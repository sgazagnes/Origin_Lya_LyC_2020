
lim1=[900,1270]
lim2=[1018,1042]
lim3=[969,980]
lim4=[945,955]
lim5=[927,942]
;lim3 =[1100,1200]
wave=   list([930,947],[964,975],[988,1004],[1003,1050],[1054,1070],[1087,1095],[1100,1130],[1230,1250])
       
RESTORE, 'DataTemplate.sav'
alllines = READ_ASCII(linefile, TEMPLATE = myTemplate)
    
good_reg = []
reg_arr=[]
for ii = 0, wave.count()-1 DO BEGIN & $
  interv = wave[ii] & $
  reg_arr = [[reg_arr], [wave[ii]]] & $
  good_reg = [good_reg, where(s.wave gt interv[0] and s.wave lt interv[1])] & $
  ;jj= jj+1
  ;wltoinclude.remove, 0 & $
ENDfor

mask = s.wave 
mask = mask * 0
mask[good_reg] = 1
good_flux = s.flux
good_flux[where(mask lt 1.)] = 'NaN'
dfpsplot,  'Fits/'+galaxy+ 'fitttt.ps', /landscape, /color
;ang = cgsymbol("angstrom") 
;bet = textoidl('\beta')
;net = textoidl('\neta')
;esp = textoidl('\epsilon')
;delt = textoidl('\delta')
;gam = cgsymbol("gamma") 
!p.multi = [0,1,5]
!p.charthick = 4
!p.font = 0
!y.margin = [2,1]
!x.margin = [5,5]
plot, s.wave, s.flux, xr = lim1, /xs, yr = [0,2], thick = 2, charsize = 1.5, charthick = 4, psym = 10;, position=[0.05,0.95,0.95,0.7]
!p.charthick = 4
!p.font = 0
djs_oplot, s.wave, s.flux,color = 'gray', thick = 8, psym = 10;, position=[0.05,0.95,0.95,0.7]
djs_oplot, s.wave, good_flux,color = 'black', thick = 8, psym = 10;, position=[0.05,0.95,0.95,0.7]
djs_oplot, s.wave, params_out.fit, color = 'red', thick =6
djs_oplot, s.wave, s.err, color = 'green', thick =3
djs_oplot, [923, 923], [2,1.7], color = 'gray', /data, thick = 2
djs_oplot, [926, 926], [2,1.7], color = 'gray', /data, thick = 2
djs_oplot, [930, 930], [2,1.7], color = 'gray', /data, thick = 2
djs_oplot, [937, 937], [2,1.7], color = 'black', /data, thick = 2
djs_oplot, [950, 950], [2,1.7], color = 'black', /data, thick = 2
djs_oplot, [972, 972], [2,1.7], color = 'gray', /data, thick = 2
djs_oplot, [977, 977], [2,1.7], color = 'gray', /data, thick = 2
djs_oplot, [989, 989], [2,1.7], color = 'black', /data, thick = 2
djs_oplot, [1010, 1010], [2,1.7], color = 'gray', /data, thick = 2
djs_oplot, [1020, 1020], [2,1.7], color = 'black', /data, thick = 2
djs_oplot, [1025, 1025], [2,1.7], color = 'gray', /data, thick = 2
djs_oplot, [1032, 1032], [2,1.7], color = 'gray', /data, thick = 2
;djs_oplot, [1036, 1036], [2,1.7], color = 'graygraygraygraygraygraygray', /data, thick = 2
djs_oplot, [1039, 1039], [2,1.7], color = 'black', /data, thick = 2


!p.multi = [8,2,5]
plot, s.wave, s.flux, xr = lim2, /xs, yr = [0,2], thick = 8,  charsize = 1.5, charthick = 4, psym = 10
djs_oplot, s.wave, s.flux,color = 'gray', thick = 8, psym = 10;, position=[0.05,0.95,0.95,0.7]
djs_oplot, s.wave, good_flux,color = 'black', thick = 8, psym = 10;, position=[0.05,0.95,0.95,0.7]
djs_oplot, s.wave, params_out.fit, color = 'red', thick =6
djs_oplot, s.wave, s.err, color = 'green', thick =3
djs_oplot, [1020, 1020], [2,1.70], color = 'gray',/data, thick =5
djs_oplot, [1024.5, 1024.5], [2,1.70], color = 'black',/data, thick =5
djs_oplot, [1025.5, 1025.5], [2,1.70], color = 'black',/data, thick =5
djs_oplot, [1039., 1039.], [2,1.70], color = 'black',/data, thick =5
djs_oplot, [1030.5, 1030.5], [2,1.70], color = 'gray',/data, thick =5
djs_oplot, [1036.6, 1036.6], [2,1.70], color = 'gray',/data, thick =5
djs_oplot, [1035.5, 1035.5], [2,1.70], color = 'gray',/data, thick =5
;;;
!p.multi = [7,2,5]
plot, s.wave, s.flux, xr = lim3, /xs, yr = [0,2], thick = 8, psym = 10,  charsize = 1.5, charthick = 4
djs_oplot, s.wave, s.flux,color = 'gray', thick = 8, psym = 10;, position=[0.05,0.95,0.95,0.7]
djs_oplot, s.wave, good_flux,color = 'black', thick = 8, psym = 10;, position=[0.05,0.95,0.95,0.7]
djs_oplot, s.wave,params_out.fit, color = 'red', thick =6
djs_oplot, s.wave, s.err, color = 'green', thick =3
djs_oplot, [972.3, 972.3], [2,1.70], color = 'black', /data, thick =5
djs_oplot, [971.5, 971.5], [2,1.70], color = 'black', /data, thick =5
djs_oplot, [976.5, 976.5], [2,1.70], color = 'black', /data, thick =5
djs_oplot, [975.8, 975.8], [2,1.70], color = 'gray', /data, thick =5

;;;
;!p.multi = [6,2,5]
;plot, s.wave, s.flux, xr = lim4, /xs, yr = [0,2], thick = 8,  charsize = 1.5, charthick = 4, psym = 10
;djs_oplot, s.wave, s.flux,color = 'gray', thick = 8, psym = 10;, position=[0.05,0.95,0.95,0.7]
;djs_oplot, s.wave, good_flux,color = 'black', thick = 8, psym = 10;, position=[0.05,0.95,0.95,0.7]
;djs_oplot, s.wave, params_out.fit, color = 'red', thick =6
;djs_oplot, s.wave, s.err, color = 'green', thick =3
;djs_oplot, [949.2, 949.2], [2,1.70], color = 'black', /data, thick =5
;djs_oplot, [948.7, 948.7], [2,1.70], color = 'black', /data, thick =5
;djs_oplot, [949.7, 949.7], [2,1.70], color = 'black', /data, thick =5
;;;
!p.multi = [6,2,5]
plot, s.wave, s.flux, xr = lim5, /xs, yr = [0,2], thick = 8,  charsize = 1.5, charthick = 4, psym = 10
djs_oplot, s.wave, s.flux,color = 'gray', thick = 8, psym = 10;, position=[0.05,0.95,0.95,0.7]
djs_oplot, s.wave, good_flux,color = 'black', thick = 8, psym = 10;, position=[0.05,0.95,0.95,0.7]
djs_oplot, s.wave,params_out.fit, color = 'red', thick =6
djs_oplot, s.wave, s.err, color = 'green', thick =3
djs_oplot, [937.5, 937.5], [2,1.70], color = 'black', /data, thick =5
djs_oplot, [936.5, 936.5], [2,1.70], color = 'black', /data, thick =5
djs_oplot, [930.6, 930.6], [2,1.70], color = 'gray', /data, thick =5
djs_oplot, [929.6, 929.6], [2,1.70], color = 'gray', /data, thick =5
djs_oplot, [926.2, 926.6], [2,1.70], color = 'black', /data, thick =5
djs_oplot, [924.9, 924.9], [2,1.70], color = 'gray', /data, thick =5
djs_oplot, [923.2, 923.2], [2,1.70], color = 'black', /data, thick =5


!p.multi = 0
dfpsclose
;
;models = mrdfits('Models/models.fits', 1)
;
;linefile = 'linelist.csv'
;;s = {wave:simu.wave, flux:simu.groundcf, err:fltarr(n_elements(simu.wave))+0.01, z:1000}
;
;groups = list({species:'HI', cf_fix:0, cf_lim:0.1,cf_val:1., log_n_fix:0, log_n_val:18., log_n_lim:24.},$
;              {species:'OVI', cf_fix:1, cf_lim:0.1},$
;              {species:'OI', cf_fix:1, cf_lim:0.1},$
;              {species:'CII', cf_fix:1})
;
;
;              
;wltoinclude=list([928,1050])
;
;simu= mrdfits('Simu/Simucf10vres500.fits', 1)
;
;vec_col_arr = []
;;;; GT 
;;
;
;
;s = {wave:simu.wave, flux:simu.groundcf, err:fltarr(n_elements(simu.wave))+0.0001, z:1000}
;params = {fitchoice :2,$ ; 1; Stellar continuum only, 2: Stellar with lines, 3: Lines on removed stellar continuum spectrum
;          vdisp:500/2.3548,$ ; Velocity resolution
;          solarmodels: 'Z',$ 
;          ;removelist : ['CII1036'],$ ; to remove particular lines (name in linelist file)
;          light_arr:fltarr(10)+1,$; Initialization of stellar continuum
;          fixstell:0,$ ; fixing stellar continuum (only with fitchoice 2 or 3)
;          ebv_coef:  0.,$; Initialization of E(B-V)
;          fixebv : 0,$ ; fixing E(B-V)  (only with fitchoice 2 or 3)
;          s:s,$   ; Structure with wavelengths, data, error and z
;          MW:1.}  ; Include  Milky Way Lines
;
;params_outGT15000 = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;
;s = {wave:simu.wave, flux:simu.noisecfSN10[*,5], err:fltarr(n_elements(simu.wave))+0.1, z:1000}
;params = {fitchoice :2,$ ; 1; Stellar continuum only, 2: Stellar with lines, 3: Lines on removed stellar continuum spectrum
;          vdisp:500/2.3548,$ ; Velocity resolution
;          solarmodels: 'Z',$ 
;          ;removelist : ['CII1036'],$ ; to remove particular lines (name in linelist file)
;          light_arr:fltarr(10)+1,$; Initialization of stellar continuum
;          fixstell:0,$ ; fixing stellar continuum (only with fitchoice 2 or 3)
;          ebv_coef:  0.,$; Initialization of E(B-V)
;          fixebv : 0,$ ; fixing E(B-V)  (only with fitchoice 2 or 3)
;          s:s,$   ; Structure with wavelengths, data, error and z
;          MW:1.}  ; Include  Milky Way Lines
;
;params_outSN1015000 = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;
;s = {wave:simu.wave, flux:simu.noisecfSN2[*,35], err:fltarr(n_elements(simu.wave))+0.5, z:1000}
;params = {fitchoice :2,$ ; 1; Stellar continuum only, 2: Stellar with lines, 3: Lines on removed stellar continuum spectrum
;          vdisp:500/2.3548,$ ; Velocity resolution
;          solarmodels: 'Z',$ 
;          ;removelist : ['CII1036'],$ ; to remove particular lines (name in linelist file)
;          light_arr:fltarr(10)+1,$; Initialization of stellar continuum
;          fixstell:0,$ ; fixing stellar continuum (only with fitchoice 2 or 3)
;          ebv_coef:  0.,$; Initialization of E(B-V)
;          fixebv : 0,$ ; fixing E(B-V)  (only with fitchoice 2 or 3)
;          s:s,$   ; Structure with wavelengths, data, error and z
;          MW:1.}  ; Include  Milky Way Lines
;
;params_outSN215000 = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;
;
;
;wave =wltoinclude 
;good_reg = []
;reg_arr=[]
;for ii = 0, wave.count()-1 DO BEGIN & $
;  interv = wave[ii] & $
;  reg_arr = [[reg_arr], [wave[ii]]] & $
;  good_reg = [good_reg, where(simu.wave gt interv[0] and simu.wave lt interv[1])] & $
;  ;jj= jj+1
;  ;wltoinclude.remove, 0 & $
;ENDfor
;
;mask = simu.wave 
;mask = mask * 0
;mask[good_reg] = 1
;good_fluxa = simu.groundcf
;good_fluxa[where(mask lt 1.)] = 'NaN'
;good_fluxb = simu.noisecfSN10[*,5]
;good_fluxb[where(mask lt 1.)] = 'NaN'
;good_fluxc = simu.noisecfSN2[*,35]
;good_fluxc[where(mask lt 1.)] = 'NaN'
;
;
;dfpsplot,  'Fits/R500fit.ps', /landscape, /color
;ang = cgsymbol("angstrom") 
;bet = textoidl('\beta')
;net = textoidl('\neta')
;esp = textoidl('\epsilon')
;delt = textoidl('\delta')
;gam = cgsymbol("gamma") 
;!p.multi = [0,1,5]
;!p.charthick = 4
;!p.font = 0
;!y.margin = [2,1]
;plot,simu.wave, simu.groundcf, xr = [910,1050], /xs, yr = [0,2], thick = 2, charsize = 1.5, charthick = 4;, position=[0.05,0.95,0.95,0.7]
;!p.charthick = 4
;!p.font = 0
;djs_oplot, simu.wave, simu.groundcf,color = 'gray', thick = 8;, position=[0.05,0.95,0.95,0.7]
;djs_oplot, simu.wave, good_fluxa,color = 'black', thick = 8;, position=[0.05,0.95,0.95,0.7]
;djs_oplot, simu.wave, params_outGT15000.fit, color = 'red', thick =6
;;djs_oplot, s.wave, s.err, color = 'green', thick =3
;djs_oplot, [926, 926], [2,1.7], color = 'gray', /data, thick = 2
;djs_oplot, [930, 930], [2,1.7], color = 'gray', /data, thick = 2
;djs_oplot, [937, 937], [2,1.7], color = 'black', /data, thick = 2
;djs_oplot, [950, 950], [2,1.7], color = 'black', /data, thick = 2
;djs_oplot, [972, 972], [2,1.7], color = 'black', /data, thick = 2
;djs_oplot, [989, 989], [2,1.7], color = 'black', /data, thick = 2
;djs_oplot, [1010, 1010], [2,1.7], color = 'black', /data, thick = 2
;djs_oplot, [1020, 1020], [2,1.7], color = 'black', /data, thick = 2
;djs_oplot, [1025, 1025], [2,1.7], color = 'black', /data, thick = 2
;djs_oplot, [1032, 1032], [2,1.7], color = 'black', /data, thick = 2
;djs_oplot, [1036, 1036], [2,1.7], color = 'black', /data, thick = 2
;djs_oplot, [1039, 1039], [2,1.7], color = 'black', /data, thick = 2
;
;;
;!p.multi = [1,1,5]
;plot,simu.wave,simu.noisecfSN10[*,5], xr = [910,1050], /xs, yr = [0,2], thick = 8,  charsize = 1.5, charthick = 4
;djs_oplot, simu.wave, simu.noisecfSN10[*,5],color = 'gray', thick = 8;, position=[0.05,0.95,0.95,0.7]
;djs_oplot, simu.wave, good_fluxb,color = 'black', thick = 8;, position=[0.05,0.95,0.95,0.7]
;djs_oplot, simu.wave, params_outSN1015000.fit , color = 'red', thick =6
;
;
;!p.multi = [2,1,5]
;plot, simu.wave, simu.noisecfSN2[*,35], xr = [910,1050], /xs, yr = [0,2], thick = 8,  charsize = 1.5, charthick = 4
;djs_oplot, simu.wave, simu.noisecfSN2[*,35],color = 'gray', thick = 8;, position=[0.05,0.95,0.95,0.7]
;djs_oplot, simu.wave, good_fluxc,color = 'black', thick = 8;, position=[0.05,0.95,0.95,0.7]
;djs_oplot, simu.wave,params_outSN215000.fit, color = 'red', thick =6
;
;
;!p.multi = 0
;dfpsclose
end



