
galaxy = 'S1226+2152'
galaxyfile = galaxy +'/'+galaxy+'.fits'
s= mrdfits(galaxyfile, 1, header)
;
;RESTORE, 'sTemplate.sav'
;data = READ_ASCII( galaxy +'/Ot/1503_g160m_bin3_box21_normalized_err.txt', TEMPLATE = sTemplate)
;data = READ_ASCII( galaxy +'/'+galaxy+'-G160M', TEMPLATE = sTemplate)
;z=0.3557
;x= data.wave/(1+z)
;flux = data.flux
;err= data.err
;;err= smooth(err,10)
;flux= smooth(flux,10)
;err= err/median(flux[where(x gt 1225 and x lt 1230)])
;flux = flux/median(flux[where(x gt 1225 and x lt 1230)])


;s = {wave:x,flux:flux,err:err,z:z}

plot, s.wave, s.flux, xr = [1150,1350], yr =[0,2]


linefile = 'linelist.csv' ; List of lines to include

; Group definition
groups = list({species:'HI', cf_fix:0, cf_lim:0.5, cf_val : 1., log_n_fix:1, log_n_val:18., log_n_lim:23, b_fix :0., b_val :50., v_fix:0,v_val :50.},$
              {species:'OVI', cf_fix:1, cf_lim:0.1,log_n_val:14,log_n_lim:20, b_val :50.},$
              {species:'OI', cf_fix:1, cf_lim:0.1,log_n_fix:0, log_n_val:9.,log_n_lim:16.,b_fix :0., b_val :20.,v_val :-100.},$
              {species:'CII', cf_fix:1},$
              {species:'CIII', cf_fix:0, log_n_val:10.,log_n_lim:17},$
              {species:'SiII', cf_fix:1,log_n_fix:0, log_n_val:11.,log_n_lim:16, b_val :50.},$
              {species:'SiIII', cf_fix:1},$
              {species:'SiIV', cf_fix:1},$
              {species:'SIII', cf_fix:1})
;

  ; Wavelengths to include
            
wltoinclude= list([1150,1170],[1230,1255],[1265,1290],[1320,1330])

params = {fitchoice :1,$ ; 1; Stellar continuum only, 2: Stellar with lines, 3: Lines on removed stellar continuum spectrum
          vdisp:75./2.3548,$ ; Velocity resolution
          solarmodels: 'Z02',$ 
          ;removelist : ['CII1036'],$ ; to remove particular lines (name in linelist file)
          light_arr:fltarr(10)+10,$; Initialization of stellar continuum
          fixstell:1,$ ; fixing stellar continuum (only with fitchoice 2 or 3)
          ebv_coef:  0.,$; Initialization of E(B-V)
          fixebv : 1,$ ; fixing E(B-V)  (only with fitchoice 2 or 3)
          s:s,$   ; Structure with wavelengths, data, error and z
          MW:1.}  ; Include  Milky Way Lines

if isa(params_out) ne 0 then params.light_arr = params_out.light_frac ; Change initialisation of stellar continuum for value of previous fit
if isa(params_out) ne 0 then params.ebv_coef = params_out.ebv ; Change initialisation of E(B-V) for value of previous fit

; Load models 

if params.solarmodels eq 'Z005' then models = mrdfits('Models/sb99001.fits', 1) 
if params.solarmodels eq 'Z02' then models = mrdfits('Models/sb99004.fits', 1) 
if params.solarmodels eq 'Z04' then models = mrdfits('Models/sb99008.fits', 1) 
if params.solarmodels eq 'Z' then models = mrdfits('Models/models.fits', 1)
if params.solarmodels eq '2Z' then models = mrdfits('Models/sb9904.fits', 1)
nmodels = n_elements(models.age)
for ii = 0, nmodels - 1 do begin & $  
    models.flux[*,ii] = models.flux[*,ii]/median(models.flux[where(models.wave gt 1047 and models.wave lt 1050),ii]) & $ 
endfor


; Call fitting method

params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
plotfit, s, params_out, [1150,1350], params.vdisp, 1, 0, 0 ; plotfit function to plot all fits. last three digits to display (if 1): fit, H lines, Other lines 
print, string(params_out.ebv) + '+-' + string(params_out.ebv_err)
; ++++++++++++++++++++++      VredPeak   ++++++++++++++++++++++++++++

absorp =  AbsSpec(s.wave, s.flux, s.err, models, params_out.light_frac, params_out.ebv, params.vdisp)
absorp = create_struct(absorp, 'z',s.z)
;djs_oplot, s.wave, absorp.flux, thick = 5, color = 'blue'
 vlya = (s.wave/1215.6701 -1) * 2.99e5
 interv = where( vlya gt 0 and vlya lt 500)
;plot, vlya, absorp.flux, xr = [-1000,1000]

; On DATA

flux = s.flux[interv]
 err = s.err[interv]
 vlya = vlya[interv]
 

shift_arr = fltarr(n_elements(interv))
 max_shift2 = fltarr(1000)
for ii = 0,999 do begin & $
for jj = 0,n_elements(interv)-1 do begin & $
shift_arr[jj] = err[jj] * randomn(seed, 1) & $
endfor &$
flux_temp = flux + shift_arr & $
max_shift2[ii] = vlya[where(flux_temp eq max(flux_temp))] & $
endfor
print, 'Vredpeak on data ='+ string(median(max_shift2))  +'+-' + string(stddev(max_shift2))

 flux = absorp.flux[interv]
 err = s.err[interv]

 
 
shift_arr = fltarr(n_elements(interv))
 max_shift = fltarr(1000)
for ii = 0,999 do begin & $
for jj = 0,n_elements(interv)-1 do begin & $
shift_arr[jj] = err[jj] * randomn(seed, 1) & $
endfor &$
flux_temp = flux + shift_arr & $
max_shift[ii] = vlya[where(flux_temp eq max(flux_temp))] & $
endfor
print, 'Vredpeak on stellar continuum removed data ='+ string(median(max_shift))  +'+-' + string(stddev(max_shift))



dfpsplot, galaxy + 'redpeak.ps', /landscape, /color
plot, vlya, s.flux[interv], xr = [0,500], yr = [0,flux_temp[where(flux_temp eq max(flux_temp))]+1], /xs, thick = 5
djs_oplot, vlya,params_out.fit[interv], color = 'red', thick =3
djs_oplot, vlya, absorp.flux[interv], color = 'blue', thick =5
legend, ['Data, Vred = '+ string(median(max_shift2)) , 'Removed continuum,Vred = '+ string(median(max_shift)), 'Stellar fit'],textcolors =[djs_icolor('black'),djs_icolor('blue'),djs_icolor('red')], charsize = 1, charthick = 6, box = 0
dfpsclose


; +++++++ Eq width Lya +++++
;
  liminf=1205
  limout=1228
    print, int_tabulated(s.wave[where(s.wave gt liminf and s.wave lt limout)],absorp.flux[where(s.wave gt liminf and s.wave lt limout)]-1)
end
