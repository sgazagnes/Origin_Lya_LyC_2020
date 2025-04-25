

lTemplate = ASCII_TEMPLATE()
;
RESTORE, 'sTemplate.sav'
;
galaxy = 'J1243+4646'
if galaxy eq 'J0921+4509' then ebvMW = 0.016
if galaxy eq 'J1503' then ebvMW = 0.013
if galaxy eq 'J0925' then ebvMW = 0.028
if galaxy eq 'J1152' then ebvMW = 0.017
if galaxy eq 'J1333' then ebvMW = 0.018
if galaxy eq 'J1442' then ebvMW = 0.048
if galaxy eq 'J1154' then ebvMW = 0.016
if galaxy eq 'J0901+2119' then ebvMW = 0.038
if galaxy eq 'J1011+1947' then ebvMW = 0.037
if galaxy eq 'J1243+4646' then ebvMW = 0.017
if galaxy eq 'J1248+4259' then ebvMW = 0.032
if galaxy eq 'J1256+4509' then ebvMW = 0.027
if galaxy eq 'tol1247-232' then ebvMW = 0.078
if galaxy eq 'tol0440-381' then ebvMW = 0.016
if galaxy eq 'mrk54' then ebvMW = 0.014
if galaxy eq 'J0926+4427' then ebvMW = 0.02
if galaxy eq 'J1429+0643' then ebvMW = 0.022
if galaxy eq 'GP0303-0759' then ebvMW = 0.10
if galaxy eq 'GP1244+0216' then ebvMW = 0.020
if galaxy eq 'GP1054+5238' then ebvMW = 0.010
if galaxy eq 'GP0911+1831' then ebvMW = 0.030
if galaxy eq 'S1226+2152' then ebvMW = 0.0213
if galaxy eq 'S1527' then ebvMW = 0.0503
if galaxy eq 'cosmic' then ebvMW = 0.0475

galaxyfile = galaxy +'/'+galaxy+'.fits';
s= mrdfits(galaxyfile, 1)
;z=0.0482
;plot, s.wave, s.flux, xr = [1100,1300]

; OLD GAL 
; 
; 
;data = READ_ASCII(galaxy +'/'+galaxy +'-G160M', TEMPLATE = sTemplate)
;x= data.wave/(1+s.z)
;flux = data.flux
;err= data.err
;flux = flux * 2.99E5 / (x * 1e-10)^2
;err = err * 2.99E5 / (x * 1e-10)^2
;;teston = median(flux[where(s.wave gt 1225 and x lt 1230)])
;;err= err/median(flux[where(x gt 1225 and x lt 1230)])
;;flux = flux/median(flux[where(x gt 1225 and x lt 1230)])
;s = {wave:x,flux:flux,err:err,z:s.z}
;s.err[where(finite(s.err) ne 1)] = 0.5
;s.err[where(s.err gt 0.1)] = 0.1
;s.flux = smooth(s.flux,10)
;s.err = smooth(s.err,10)

;err = data.err
;err[where(finite(err) ne 1)] = 0.5
;err[where(err gt 0.1)] = 0.1
;err= smooth(err,5)
;;flux = data.fnu;/median(data.fnu[where(x gt 1047 and x lt 1050)])
;err= err/median(flux[where(x gt 1047 and x lt 1050)])
;flux = flux/median(flux[where(x gt 1047 and x lt 1050)])
;err= data.err/median(data.fnu[where(x gt 1050 and x lt 1053)])
;
;
s= mrdfits(galaxy+'/'+galaxy+'g140lbin3.fits', 1, header)


;++ For Leitherer or new leakers

s= mrdfits(galaxy+'/'+galaxy+'g160mabin3.fits', 1, header)

z=0.4317
s = {wave:s.wave/(1+z),flux:s.flux,err:s.sigma_flux,z:z}
s.flux = smooth(s.flux,2)
s.err = smooth(s.err,2)
;s.err = s.err/median(s.flux[where(s.wave gt 1180 and s.wave lt 1186)])
;s.flux = s.flux/median(s.flux[where(s.wave gt 1180 and s.wave lt 1186)])


 ;s = {wave:x,flux:flux,err:err,z:s.z}

;
;RESTORE, 'sTemplate.sav'
;data = READ_ASCII( galaxy +'/Oth/'+galaxy+'_g160m_bin3_box21_normalized_err.txt', TEMPLATE = sTemplate)
;z=0.2937 ; Do't forget to change
;x= data.wave/(1+z)
;flux = data.flux
;err= data.err
;s = {wave:x,flux:flux,err:err,z:z}
;s.err[where(finite(s.err) ne 1)] = 0.5
;s = {wave:s.wave,flux:s.flux,err:s.err,z:z}

ccm_unred, s.wave*(1+s.z), s.flux, ebvMW, funred
ccm_unred, s.wave*(1+s.z), s.err, ebvMW, errunred
s.flux = funred
s.err = errunred

teston = median(s.flux[where(s.wave gt 1180 and s.wave lt 1200)])
s.err = s.err/median(s.flux[where(s.wave gt 1180 and s.wave lt 1200)])
s.flux = s.flux/median(s.flux[where(s.wave gt 1180 and s.wave lt 1200)]) ;17-20 or 47-50

;teston = median(s.flux[where(s.wave gt 1225 and s.wave lt 1230)])
;s.err= s.err/median(s.flux[where(s.wave gt 1225 and s.wave lt 1230)])
;s.flux = s.flux/median(s.flux[where(s.wave gt 1225 and s.wave lt 1230)])

plot, s.wave, s.flux, xr = [1100,1300]
djs_oplot, s.wave, s.err, color = 'green'

groups = list({species:'HI', cf_fix:0, cf_lim:0.6, cf_val : 1, log_n_fix:0, log_n_val:17, log_n_lim:22., b_fix :0., b_val :50.},$
              {species:'OVI', cf_fix:1, cf_lim:0.1,log_n_lim:20},$
              {species:'OI', cf_fix:1, cf_lim:0.1,log_n_fix:0, log_n_val:14.5,log_n_lim:18,b_fix :0., b_val :50.},$
              {species:'CII', cf_fix:1},$
              {species:'CIII', cf_fix:1,log_n_lim:16.5},$
             {species:'SiII', cf_fix:1,log_n_fix:0, log_n_val:14.8},$
              {species:'SiIII', cf_fix:1},$
              {species:'SiIV', cf_fix:1},$
              {species:'SIII', cf_fix:1})


                           
params = {fitchoice :1,$ ; 1; Stellar continuum only, 2: Stellar with lines, 3: Lines on removed stellar continuum spectrum1
          vdisp:120./2.3548,$ ; Velocity resolution
          solarmodels: 'Z02',$ ; Stellar model (Z005, Z02, Z04, Z, 2Z)
         ; removelist : ['SiII1020', 'CII1036'],$ ; to remove particular lines (name in linelist file)
          light_arr:fltarr(10),$; Initialization of stellar continuum
          fixstell:0,$ ; fixing stellar continuum 
          ebv_coef: fltarr(2),$; Initialization of E(B-V)
          fixebv : 0.,$ ; fixing E(B-V) in gas  (only with fitchoice 2 or 3)
          s:s,$   ; Structure with wavelengths, data, error and z
          MW:1.,$ ;Include  Milky Way Line
          dust_model:0,$ ; 0: screen, 1: no dust in holes ; 2: different ebv in gas or holes
          ebvlaw:4}  ;choice of extinction law: 1; Calzetti for lam>12 microns, 2; leitherer02, 3; Calzetti from Reddy16, 4; Reddy from Reddy16 

if params.solarmodels eq 'Z005' then models = mrdfits('Models/sb99001.fits', 1) 
if params.solarmodels eq 'Z02' then models = mrdfits('Models/sb99004.fits', 1) 
if params.solarmodels eq 'Z04' then models = mrdfits('Models/sb99008.fits', 1) 
if params.solarmodels eq 'Z' then models = mrdfits('Models/models.fits', 1)
if params.solarmodels eq '2Z' then models = mrdfits('Models/sb9904.fits', 1)
nmodels = n_elements(models.age)
for ii = 0, nmodels - 1 do begin & $  
    models.flux[*,ii] = models.flux[*,ii]/median(models.flux[where(models.wave gt 1047 and models.wave lt 1050),ii]) & $ 
endfor
;
;
wltoinclude=list([1000,1150],[1230,1370])
;;[1180,1200],
;;list([938.8,938.9],[946.5,947.1],[947.4,947.5],[948.1,948.18],[948.8,950.28],[950.63,950.7],[951.4,952], [970.3,970.37], [970.7,973.79],$
;;[974.4,974.5],[988,990.3],[1000,1010],[1021.5,1022.7],[1022.8,1026.3],[1027.35,1027.6],[1027.8,1027.9],$
;;[1028.39,1024.5],[1028.75,1029.9],[1030,1032.5],[1034.5,1047],[1051,1056]) 
;
;params.light_arr = params_out.light_frac
;params.ebv_coef = params_out.ebv
;
;params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;plotfit, s, params_out, [1180,1280], params.vdisp, 1, 0, 0

;light_arr = params_out.light_frac
; ebv_coef = params_out.ebv
;absorp =  AbsSpec(s.wave, s.flux, s.err, models, light_arr, ebv_coef, 4,  120./2.3548) 
;;absorp = create_struct(absorp, 'z',s.z)
;;;;;djs_oplot, s.wave, absorp.flux, thick = 5, color = 'blue'
; vlya = (absorp.wave/1215.6701 -1) * 2.99e5
; interv = where( vlya gt 0 and vlya lt 500)
;plot, vlya, s.flux, xr = [-10000,10000]
;
; flux = absorp.flux[interv]
; err = s.err[interv]
;  vlya = vlya[interv]
; 
;; print, vlya[where(flux eq max(flux))]
;shift_arr = fltarr(n_elements(interv))
; max_shift = fltarr(1000)
;for ii = 0,999 do begin & $
;for jj = 0,n_elements(interv)-1 do begin & $
;shift_arr[jj] = err[jj] * randomn(seed, 1) & $
;endfor &$
;flux_temp = flux + shift_arr & $
;max_shift[ii] = vlya[where(flux_temp eq max(flux_temp))] & $
;endfor
;print, median(max_shift)
;print, stddev(max_shift)
;
;vlya = (absorp.wave/1215.6701 -1) * 2.99e5
;interv = where( vlya gt -500 and vlya lt -150)
;
;flux = absorp.flux[interv]
;err = s.err[interv]
;vlya = vlya[interv]
;
;;print, vlya[where(flux eq max(flux))]
;shift_arr = fltarr(n_elements(interv))
;max_shift = fltarr(1000)
;for ii = 0,999 do begin & $
;  for jj = 0,n_elements(interv)-1 do begin & $
;  shift_arr[jj] = err[jj] * randomn(seed, 1) & $
;endfor &$
;flux_temp = flux + shift_arr & $
;max_shift[ii] = vlya[where(flux_temp eq max(flux_temp))] & $
;endfor
;print, median(max_shift)
;print, stddev(max_shift)
;
;;
;
;vlya = (absorp.wave/1215.6701 -1) * 2.99e5
;interv = where( vlya gt -1000 and vlya lt 1100)
;plot, vlya, absorp.flux, xr = [-10000,10000]
;
; flux = absorp.flux[interv]
; err = absorp.err[interv]
;  vlya = vlya[interv]
; 
;
;shift_arr = fltarr(n_elements(interv))
; max_shift = fltarr(1000)
;for ii = 0,999 do begin & $
;for jj = 0,n_elements(interv)-1 do begin & $
;shift_arr[jj] = err[jj] * randomn(seed, 1) & $
;endfor &$
;flux_temp = flux + shift_arr & $
;max_shift[ii] =int_tabulated(absorp.wave[interv], flux_temp-1) & $
;endfor
;print, median(max_shift)
;print, stddev(max_shift)
;;

;
vlya = (s.wave/1215.6701 -1) * 2.99e5
interv = where( vlya gt -1000 and vlya lt 1500)
plot, vlya, s.flux, xr = [-5010,4500]

flux = s.flux[interv]
err = s.err[interv]
vlya = vlya[interv]


shift_arr = fltarr(n_elements(interv))
max_shift = fltarr(1000)
for ii = 0,999 do begin & $
  for jj = 0,n_elements(interv)-1 do begin & $
  shift_arr[jj] = err[jj] * randomn(seed, 1) & $
endfor &$
flux_temp = flux + shift_arr & $
max_shift[ii] =int_tabulated(s.wave[interv], flux_temp-1) & $
endfor
print, median(max_shift)
print, stddev(max_shift)
;;
vlya = (s.wave/1215.6701 -1) * 2.99e5
interv = where( vlya gt -1000 and vlya lt 1000)
plot, vlya, s.flux, xr = [-1000,1000]

flux = s.flux[interv]
err = s.err[interv]
vlya = vlya[interv]


shift_arr = fltarr(n_elements(interv))
max_shift = fltarr(1000)
for ii = 0,999 do begin & $
  for jj = 0,n_elements(interv)-1 do begin & $
  shift_arr[jj] = err[jj] * randomn(seed, 1) & $
endfor &$
flux_temp = flux + shift_arr & $
max_shift[ii] = vlya[where(flux_temp eq max(flux_temp))] & $
endfor
print, median(max_shift)
print, stddev(max_shift)

vlya = (s.wave/1215.6701 -1) * 2.99e5
interv = where( vlya gt -1000 and vlya lt -00)
plot, vlya, s.flux, xr = [-1000,1000]

flux = s.flux[interv]
err = s.err[interv]
vlya = vlya[interv]


shift_arr = fltarr(n_elements(interv))
max_shift = fltarr(1000)
for ii = 0,999 do begin & $
  for jj = 0,n_elements(interv)-1 do begin & $
  shift_arr[jj] = err[jj] * randomn(seed, 1) & $
endfor &$
flux_temp = flux + shift_arr & $
max_shift[ii] = vlya[where(flux_temp eq max(flux_temp))] & $
endfor
print, median(max_shift)
print, stddev(max_shift)


line =  lyb_ab(s.wave, params_out.v[0], params_out.b[0], params_out.log_n[0], $
  1216,0.41641, 840000, params_out.fcov[0],vdisp=50/2.35) ;This calls an ancilary functneut to generate the LyB profile
  dfpsplot,  'Fits/'+galaxy+ 'lyacorr.ps', /landscape, /color
  plot, s.wave, s.flux, xr = [1210,1220], thick = 10
  djs_oplot, s.wave, line, color = 'red', thick = 10
  djs_oplot, s.wave, s.flux/line, color = 'blue', thick = 10
dfpsclose


galaxy = 'J0921+4509'
if galaxy eq 'J0921+4509' then ebvMW = 0.016
if galaxy eq 'J1503' then ebvMW = 0.013
if galaxy eq 'J0925' then ebvMW = 0.028
if galaxy eq 'J1152' then ebvMW = 0.017
if galaxy eq 'J1333' then ebvMW = 0.018
if galaxy eq 'J1442' then ebvMW = 0.048
if galaxy eq 'J1154' then ebvMW = 0.016
if galaxy eq 'J0901+2119' then ebvMW = 0.025
if galaxy eq 'J1011+1947' then ebvMW = 0.025
if galaxy eq 'J1243+4646' then ebvMW = 0.012
if galaxy eq 'J1248+4259' then ebvMW = 0.021
if galaxy eq 'J1256+4509' then ebvMW = 0.018
if galaxy eq 'tol1247-232' then ebvMW = 0.078
if galaxy eq 'tol0440-381' then ebvMW = 0.016
if galaxy eq 'mrk54' then ebvMW = 0.014
if galaxy eq 'J0926+4427' then ebvMW = 0.02
if galaxy eq 'J1429+0643' then ebvMW = 0.022
if galaxy eq 'GP0303-0759' then ebvMW = 0.10
if galaxy eq 'GP1244+0216' then ebvMW = 0.020
if galaxy eq 'GP1054+5238' then ebvMW = 0.010
if galaxy eq 'GP0911+1831' then ebvMW = 0.030
if galaxy eq 'S1226+2152' then ebvMW = 0.0213
if galaxy eq 'S1527' then ebvMW = 0.0503
if galaxy eq 'cosmic' then ebvMW = 0.0475
galaxyfile = galaxy +'/'+galaxy+'.fits';
s= mrdfits(galaxyfile, 1)
z=s.z
;lTemplate = ASCII_TEMPLATE()
data = READ_ASCII(galaxy +'/'+galaxy +'-G160M', TEMPLATE = sTemplate)

;data = READ_ASCII( 'cosmic/cosmiceye-combwC1.txt', TEMPLATE=ltemplate)
;data = READ_ASCII( 'S1527/s1527-combwC1.txt', TEMPLATE=ltemplate)
;data = READ_ASCII( 'S1226+2152/s1226-all-combwC1.txt', TEMPLATE=ltemplate)
;s = {wave: data.wave/(1+z), flux:data.fnu*(2.99e8/(data.wave*1e-10))/data.wave, err:data.err*(2.99e8/(data.wave*1e-10))/data.wave, z:z}
s = {wave: data.wave/(1+z), flux:data.flux, err:data.err, z:z}

ccm_unred, s.wave*(1+s.z), s.flux, ebvMW, funred
ccm_unred, s.wave*(1+s.z), s.err, ebvMW, errunred
s.flux = funred
s.err = errunred
s.flux[where(s.flux lt 0)] =0
s.err[where(s.err lt 0)] =0
s.err[where(s.err gt 2e-13)] =0
vlya = (s.wave/1215.6701 -1) * 2.99e5

plot, vlya, s.flux, xr = [-1000,1000], thick = 10
 djs_oplot, vlya, s.err, color = 'green
shift_arr = fltarr(n_elements(s.err))
max_shift = fltarr(1000)
for ii = 0,999 do begin & $
  for jj = 0,n_elements(s.err)-1 do begin & $
    shift_arr[jj] = s.err[jj]* randomn(seed, 1) & $
    endfor & $
flux_temp = s.flux + shift_arr & $
flux_temp[where(flux_temp lt 0)] =  0 & $
max_shift[ii] = int_tabulated(s.wave[where(vlya gt -1000 and vlya lt 1000)], flux_temp[where(vlya gt -1000 and vlya lt 1000)]) & $
endfor
print, median(max_shift)
print, stddev(max_shift)


val = int_tabulated(s.wave[where(vlya gt -2000 and vlya lt 1000)], s.flux[where(vlya gt -2000 and vlya lt 1000)])
end