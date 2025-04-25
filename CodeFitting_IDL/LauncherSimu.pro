models = mrdfits('Models/models.fits', 1)

linefile = 'linelist.csv'
;s = {wave:simu.wave, flux:simu.groundcf, err:fltarr(n_elements(simu.wave))+0.01, z:1000}

groups = list({species:'HI', cf_fix:0, cf_lim:0.1,cf_val:1., log_n_fix:0, log_n_val:18., log_n_lim:24.},$
              {species:'OVI', cf_fix:1, cf_lim:0.1},$
              {species:'OI', cf_fix:1, cf_lim:0.1},$
              {species:'CII', cf_fix:1})


              
wltoinclude=list([928,1050]);[920,942],[943.5,945],

;vres = [20.,50.,100.,200.,300.,400.,500.]
vres = [150.,200.,300.,375.,600.]
;vresstr = ['20','50','100','200','300','400','500']
vresstr = ['150','200','300','375','600']
headrow = ['SN','b','fcov','logn','berr','fcoverr','lognerr']
firstcol = ['2','5','7','10'];,'20','30','40','50']
vec_col_arrcf = fltarr(10,10)
;vec_col_arrdens = fltarr(7,7)
vec_col_arrcff = fltarr(10,10)
;vec_col_arrdenss = fltarr(7,7)

for jj = 0, 9 do begin 
lin=jj
j= jj
simu= mrdfits('SimuJWST/Simucf10vres'+vresstr[jj]+'.fits', 1)

vec_col_arr = []
;;; GT 
;
s = {wave:simu.wave, flux:simu.groundcf, err:fltarr(n_elements(simu.wave))+0.0001, z:1000}
params = {fitchoice :2,$ ; 1; Stellar continuum only, 2: Stellar with lines, 3: Lines on removed stellar continuum spectrum
          vdisp:vres[jj]/2.3548,$ ; Velocity resolution
          solarmodels: 'Z',$ 
          ;removelist : ['CII1036'],$ ; to remove particular lines (name in linelist file)
          light_arr:fltarr(10)+1,$; Initialization of stellar continuum
          fixstell:0,$ ; fixing stellar continuum (only with fitchoice 2 or 3)
          ebv_coef:  0.,$; Initialization of E(B-V)
          fixebv : 0,$ ; fixing E(B-V)  (only with fitchoice 2 or 3)
          s:s,$
          reddy:0,$   ; Structure with wavelengths, data, error and z
          MW:1.}  ; Include  Milky Way Lines

;++++++++++++++++++++++++++++++++++++   GT  ++++++++++++++++++++++++++++++++++
;
;params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
; 
;vec_colcf = [params_out.b[0],params_out.fcov[0],params_out.log_n[0],$
;params_out.b_err[0],params_out.fcov_err[0], params_out.log_n_err[0]]  
;write_csv, 'Simu/GTcf10vdisp20.csv', vec_col
;vec_col_arrcf = [[vec_col_arrcf], [vec_colcf]]  
;
;s.flux = simu.grounddens
;params.s = s
;
;params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
; 
;exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;vec_coldens = [params_out.b[0],params_out.fcov[0],params_out.log_n[0],$
;params_out.b_err[0],params_out.fcov_err[0], params_out.log_n_err[0]]  
;write_csv, 'Simu/GTdens10vdisp20.csv', vec_col
;vec_col_arrdens = [[vec_col_arrdens], [vec_coldens]] 


;;++++++++++++++++++++   SN1   +++++++++++++++++++++++++++

s.err = fltarr(n_elements(simu.wave))+1
;
;
for ii = 0, 49 do begin
  s.flux = simu.noisecfSN2[*,ii]
  params.s = s

  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)

  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
  vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
  print, jj
  print, ii
  vec_col_arr = [[vec_col_arr], [vec_col]]
endfor

vec_col_arrcf[lin,0] = mean(abs(vec_col_arr[2,*]-0.9))
vec_col_arrcff[lin,0] = sqrt(mean((vec_col_arr[2,*]-0.9)^2))
write_csv, 'SimuJWST/SN1cf10vdisp'+vresstr[jj]+'.csv', vec_col_arr

vec_col_arr = []
;;++++++++++++++++++++   SN2   +++++++++++++++++++++++++++ 

s.err = fltarr(n_elements(simu.wave))+0.5
;
;
for ii = 0, 49 do begin
  s.flux = simu.noisecfSN2[*,ii]
  params.s = s 
  
params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)

exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
print, jj
print, ii
 vec_col_arr = [[vec_col_arr], [vec_col]]  
endfor

vec_col_arrcf[lin,1] = mean(abs(vec_col_arr[2,*]-0.9))
vec_col_arrcff[lin,1] = sqrt(mean((vec_col_arr[2,*]-0.9)^2))
write_csv, 'SimuJWST/SN2cf10vdisp'+vresstr[jj]+'.csv', vec_col_arr

vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisedensSN2[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;    print, jj
;print, ii
; exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
;
;  vec_col_arr = [[vec_col_arr], [vec_col]]   
;endfor
;
;vec_col_arrdens[lin,0] = mean(abs(vec_col_arr[4,*]-17.57))
;vec_col_arrdenss[lin,0] = sqrt(mean((vec_col_arr[4,*]-17.57)^2))
;
;write_csv, 'Simu/SN2dens10vdisp'+vresstr[jj]+'.csv', vec_col_arr

;;++++++++++++++++++++   SN3   +++++++++++++++++++++++++++

s.err = fltarr(n_elements(simu.wave))+0.33
;
;
for ii = 0, 49 do begin
  s.flux = simu.noisecfSN2[*,ii]
  params.s = s

  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)

  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
  vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
  print, jj
  print, ii
  vec_col_arr = [[vec_col_arr], [vec_col]]
endfor

vec_col_arrcf[lin,2] = mean(abs(vec_col_arr[2,*]-0.9))
vec_col_arrcff[lin,2] = sqrt(mean((vec_col_arr[2,*]-0.9)^2))
write_csv, 'SimuJWST/SN3cf10vdisp'+vresstr[jj]+'.csv', vec_col_arr

vec_col_arr = []

;;++++++++++++++++++++   SN4   +++++++++++++++++++++++++++

s.err = fltarr(n_elements(simu.wave))+0.25
;
;
for ii = 0, 49 do begin
  s.flux = simu.noisecfSN2[*,ii]
  params.s = s

  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)

  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
  vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
  print, jj
  print, ii
  vec_col_arr = [[vec_col_arr], [vec_col]]
endfor

vec_col_arrcf[lin,3] = mean(abs(vec_col_arr[2,*]-0.9))
vec_col_arrcff[lin,3] = sqrt(mean((vec_col_arr[2,*]-0.9)^2))
write_csv, 'SimuJWST/SN4cf10vdisp'+vresstr[jj]+'.csv', vec_col_arr

vec_col_arr = []
;; ++++++++++++++++++++++  SN5 ++++++++++++++++++++++++++++++ 

s.err = fltarr(n_elements(simu.wave))+0.2

vec_col_arr = []
for ii = 0, 49 do begin
  s.flux = simu.noisecfSN5[*,ii]
  params.s = s 
  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
 print, jj
print, ii
vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]

 vec_col_arr = [[vec_col_arr], [vec_col]]  
endfor

vec_col_arrcf[lin,4] = mean(abs(vec_col_arr[2,*]-0.9))
vec_col_arrcff[lin,4] = sqrt(mean((vec_col_arr[2,*]-0.9)^2))
write_csv, 'SimuJWST/SN5cf10vdisp'+vresstr[jj]+'.csv', vec_col_arr


;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisedensSN5[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;  print, jj
;print, ii
;vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
;
;  vec_col_arr = [[vec_col_arr], [vec_col]]   
;endfor
;
;vec_col_arrdens[lin,1] = mean(abs(vec_col_arr[4,*]-17.57))
;vec_col_arrdenss[lin,1] = sqrt(mean((vec_col_arr[4,*]-17.57)^2))
;write_csv, 'Simu/SN5dens10vdisp'+vresstr[jj]+'.csv', vec_col_arr


;;++++++++++++++++++++   SN6   +++++++++++++++++++++++++++

s.err = fltarr(n_elements(simu.wave))+0.167
;
;
for ii = 0, 49 do begin
  s.flux = simu.noisecfSN2[*,ii]
  params.s = s

  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)

  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
  vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
  print, jj
  print, ii
  vec_col_arr = [[vec_col_arr], [vec_col]]
endfor

vec_col_arrcf[lin,5] = mean(abs(vec_col_arr[2,*]-0.9))
vec_col_arrcff[lin,5] = sqrt(mean((vec_col_arr[2,*]-0.9)^2))
write_csv, 'SimuJWST/SN6cf10vdisp'+vresstr[jj]+'.csv', vec_col_arr

vec_col_arr = []
;++++++++++++++++++++++  SN7 ++++++++++++++++++++++++++++++

s.err = fltarr(n_elements(simu.wave))+0.143

vec_col_arr = []
for ii = 0, 49 do begin
  s.flux = simu.noisecfSN7[*,ii]
  params.s = s
  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
  print, jj
  print, ii
  vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]

  vec_col_arr = [[vec_col_arr], [vec_col]]
endfor

vec_col_arrcf[lin,6] = mean(abs(vec_col_arr[2,*]-0.9))
vec_col_arrcff[lin,6] = sqrt(mean((vec_col_arr[2,*]-0.9)^2))
write_csv, 'SimuJWST/SN7cf10vdisp'+vresstr[jj]+'.csv', vec_col_arr


;;++++++++++++++++++++   SN8   +++++++++++++++++++++++++++

s.err = fltarr(n_elements(simu.wave))+0.125
;
;
for ii = 0, 49 do begin
  s.flux = simu.noisecfSN2[*,ii]
  params.s = s

  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)

  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
  vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
  print, jj
  print, ii
  vec_col_arr = [[vec_col_arr], [vec_col]]
endfor

vec_col_arrcf[lin,7] = mean(abs(vec_col_arr[2,*]-0.9))
vec_col_arrcff[lin,7] = sqrt(mean((vec_col_arr[2,*]-0.9)^2))
write_csv, 'SimuJWST/SN8cf10vdisp'+vresstr[jj]+'.csv', vec_col_arr

vec_col_arr = []


;;++++++++++++++++++++   SN2   +++++++++++++++++++++++++++

s.err = fltarr(n_elements(simu.wave))+0.111
;
;
for ii = 0, 49 do begin
  s.flux = simu.noisecfSN2[*,ii]
  params.s = s

  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)

  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
  vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
  print, jj
  print, ii
  vec_col_arr = [[vec_col_arr], [vec_col]]
endfor

vec_col_arrcf[lin,8] = mean(abs(vec_col_arr[2,*]-0.9))
vec_col_arrcff[lin,8] = sqrt(mean((vec_col_arr[2,*]-0.9)^2))
write_csv, 'SimuJWST/SN9cf10vdisp'+vresstr[jj]+'.csv', vec_col_arr

vec_col_arr = []
; SN10

s.err = fltarr(n_elements(simu.wave))+0.1

vec_col_arr = []
for ii = 0, 49 do begin
  s.flux = simu.noisecfSN10[*,ii]
  params.s = s 
  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
  print, jj
print, ii
 exage = total(params_out.light_frac*models.age)/total(params_out.light_frac) 
vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]

 vec_col_arr = [[vec_col_arr], [vec_col]]  
endfor

vec_col_arrcf[lin,9] = mean(abs(vec_col_arr[2,*]-0.9))
vec_col_arrcff[lin,9] = sqrt(mean((vec_col_arr[2,*]-0.9)^2))
write_csv, 'SimuJWST/SN10cf10vdisp'+vresstr[jj]+'.csv', vec_col_arr
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisedensSN10[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;  print, jj
;print, ii
;vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
;
;  vec_col_arr = [[vec_col_arr], [vec_col]]    
;endfor
;
;vec_col_arrdens[lin,2] = mean(abs(vec_col_arr[4,*]-17.57))
;vec_col_arrdenss[lin,2] = sqrt(mean((vec_col_arr[4,*]-17.57)^2))
;write_csv, 'Simu/SN10dens10vdisp'+vresstr[jj]+'.csv', vec_col_arr

; ++++++++++++++++++++++++++++++++++++++ SN20 +++++++++++++++++++++++++++++++++++++
;
;s.err = fltarr(n_elements(simu.wave))+0.05
;
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisecfSN20[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;  print, jj
;print, ii
;vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
;
;
; vec_col_arr = [[vec_col_arr], [vec_col]]  
;endfor
;
;vec_col_arrcf[lin,3] = mean(abs(vec_col_arr[2,*]-0.9))
;vec_col_arrcff[lin,3] = sqrt(mean((vec_col_arr[2,*]-0.9)^2))
;write_csv, 'Simu/SN20cf10vdisp'+vresstr[jj]+'.csv', vec_col_arr
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisedensSN20[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;  print, jj
;print, ii
;vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
;
;  vec_col_arr = [[vec_col_arr], [vec_col]]   
;endfor
;
;vec_col_arrdens[lin,3] = mean(abs(vec_col_arr[4,*]-17.57))
;vec_col_arrdenss[lin,3] = sqrt(mean((vec_col_arr[4,*]-17.57)^2))
;write_csv, 'Simu/SN20dens30vdisp'+vresstr[jj]+'.csv', vec_col_arr
;
;
;; ++++++++++++++++++++++++++++++++++++++++++++ SN 30 +++++++++++++++++++++++++++++++++++++
;s.err = fltarr(n_elements(simu.wave))+ (1/30.)
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisecfSN30[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
; 
;print, jj
;print, ii
; vec_col_arr = [[vec_col_arr], [vec_col]]  
;endfor
;
;vec_col_arrcf[lin,4] = mean(abs(vec_col_arr[2,*]-0.9))
;vec_col_arrcff[lin,4] = sqrt(mean((vec_col_arr[2,*]-0.9)^2))
;write_csv, 'Simu/SN30cf10vdisp'+vresstr[jj]+'.csv', vec_col_arr
;
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisedensSN30[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;  print, jj
;print, ii
;vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
;
;  vec_col_arr = [[vec_col_arr], [vec_col]]    
;endfor
;
;vec_col_arrdens[lin,4] = mean(abs(vec_col_arr[4,*]-17.57))
;vec_col_arrdenss[lin,4] = sqrt(mean((vec_col_arr[4,*]-17.57)^2))
;write_csv, 'Simu/SN30dens10vdisp'+vresstr[jj]+'.csv', vec_col_arr
;
;; ++++++++++++++++++++++++++++++++++++++++++++ SN 40 +++++++++++++++++++++++++++++++++++++
;s.err = fltarr(n_elements(simu.wave))+ (0.025)
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisecfSN40[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
;
;print, jj
;print, ii
; vec_col_arr = [[vec_col_arr], [vec_col]]  
;endfor
;
;vec_col_arrcf[lin,5] = mean(abs(vec_col_arr[2,*]-0.9))
;vec_col_arrcff[lin,5] = sqrt(mean((vec_col_arr[2,*]-0.9)^2))
;write_csv, 'Simu/SN40cf10vdisp'+vresstr[jj]+'.csv', vec_col_arr
;
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisedensSN40[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;  print, jj
;print, ii
;vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
;
; vec_col_arr = [[vec_col_arr], [vec_col]]    
;endfor
;
;vec_col_arrdens[lin,5] = mean(abs(vec_col_arr[4,*]-17.57))
;vec_col_arrdenss[lin,5] = sqrt(mean((vec_col_arr[4,*]-17.57)^2))
;write_csv, 'Simu/SN40dens10vdisp'+vresstr[jj]+'.csv', vec_col_arr
;
;; ++++++++++++++++++++++++++++++++++++++++++++ SN 50 +++++++++++++++++++++++++++++++++++++
;s.err = fltarr(n_elements(simu.wave))+ 0.02
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisecfSN50[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
;
;print, jj
;print, ii
; vec_col_arr = [[vec_col_arr], [vec_col]]  
;endfor
;
;vec_col_arrcf[lin,6] = mean(abs(vec_col_arr[2,*]-0.9))
;vec_col_arrcff[lin,6] = sqrt(mean((vec_col_arr[2,*]-0.9)^2))
;write_csv, 'Simu/SN50cf10vdisp'+vresstr[jj]+'.csv', vec_col_arr
;
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisedensSN50[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;  print, jj
;print, ii
;vec_col = [params_out.b[0],params_out.b_err[0],params_out.fcov[0],params_out.fcov_err[0],params_out.log_n[0], params_out.log_n_err[0]]
;
;  vec_col_arr = [[vec_col_arr], [vec_col]]   
;endfor
;
;vec_col_arrdens[lin,6] = mean(abs(vec_col_arr[4,*]-17.57))
;vec_col_arrdenss[lin,6] = sqrt(mean((vec_col_arr[4,*]-17.57)^2))
;write_csv, 'Simu/SN50dens10vdisp'+vresstr[jj]+'.csv', vec_col_arr
;
;
;
;
endfor

write_csv, 'SimuJWST/cf10MeanBis.csv',vec_col_arrcf;, header= vresstr
write_csv, 'SimuJWST/cf10SqrtBis.csv',vec_col_arrcff;, header= vresstr
;write_csv, 'Simu/dens10Mean.csv', vec_col_arrdens, header= vresstr
;write_csv, 'Simu/dens10Sqrt.csv', vec_col_arrdenss, header= vresstr

;
;cff = ['01','05','15']
;
;for jj = 0, 2 do begin 
;simu= mrdfits('Simu/Simucf'+cff[jj]+'vdisp20.fits', 1)
;vec_col_arrcf = []
;vec_col_arrdens = []
;vec_col_arr = []
;;;; GT 
;;
;s = {wave:simu.wave, flux:simu.groundcf, err:fltarr(n_elements(simu.wave))+0.0001, z:1000}
;params = {fitchoice : 2,$
;          vdisp:20.,$
;          solarmodels: 'Z',$           
;          light_arr:fltarr(10)+1,$
;          ebv_coef:  0.,$
;          s:s}
;
;params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;
;vec_colcf = [[params_out.b[0]],[params_out.b_err[0]],[params_out.v[0]],[params_out.v_err[0]],$
;[params_out.fcov[0]], [params_out.fcov_err[0]], [params_out.log_n[0]], [params_out.log_n_err[0]]] 
;;write_csv, 'Simu/GTcf10vdisp20.csv', vec_col
;vec_col_arrcf = [vec_col_arrcf, vec_colcf]  
;
;s.flux = simu.grounddens
;params.s = s
;
;params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;
;vec_coldens = [[params_out.b[0]],[params_out.b_err[0]],[params_out.v[0]],[params_out.v_err[0]],$
;[params_out.fcov[0]], [params_out.fcov_err[0]], [params_out.log_n[0]], [params_out.log_n_err[0]]] 
;;write_csv, 'Simu/GTdens10vdisp20.csv', vec_col
;vec_col_arrdens = [vec_col_arrdens, vec_coldens] 
;;; SN2
;
;s.err = fltarr(n_elements(simu.wave))+0.5
;
;
;for ii = 0, 49 do begin
;  s.flux = simu.noisecfSN2[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;print, 'Age of the continuum: ' + string(exage/1e6) +' Myr'
;print, 'E(B-V) = ' + string(params_out.ebv)
;
;if tag_exist(params_out, 'speciesgal') then print, string(params_out.speciesgal) + ' with column density of ' + string(params_out.log_n)+ ', '
;  
;  vec_col =  [[params_out.b[0]],[params_out.b_err[0]],[params_out.v[0]],[params_out.v_err[0]],$
;[params_out.fcov[0]], [params_out.fcov_err[0]], [params_out.log_n[0]], [params_out.log_n_err[0]]] 
;  vec_col_arr = [vec_col_arr, vec_col]  
;endfor
;
;vec_col_arrcf = [vec_col_arrcf, transpose(mean(vec_col_arr, dimension = 1)), transpose(stddev(vec_col_arr, dimension = 1))]
;;write_csv, 'Simu/SN2cf10vdisp20.csv', vec_col_arr
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisedensSN2[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;    exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;  
; vec_col =  [[params_out.b[0]],[params_out.b_err[0]],[params_out.v[0]],[params_out.v_err[0]],$
;[params_out.fcov[0]], [params_out.fcov_err[0]], [params_out.log_n[0]], [params_out.log_n_err[0]]]
;  vec_col_arr = [vec_col_arr, vec_col]  
;endfor
;
;vec_col_arrdens = [vec_col_arrdens, transpose(mean(vec_col_arr, dimension = 1)), transpose(stddev(vec_col_arr, dimension = 1))]
;
;
;;; SN5 
;
;s.err = fltarr(n_elements(simu.wave))+0.2
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisecfSN5[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
; vec_col =  [[params_out.b[0]],[params_out.b_err[0]],[params_out.v[0]],[params_out.v_err[0]],$
;[params_out.fcov[0]], [params_out.fcov_err[0]], [params_out.log_n[0]], [params_out.log_n_err[0]]]
;  vec_col_arr = [vec_col_arr, vec_col]  
;endfor
;
;vec_col_arrcf = [vec_col_arrcf, transpose(mean(vec_col_arr, dimension = 1)), transpose(stddev(vec_col_arr, dimension = 1))]
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisedensSN5[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;  
;  vec_col =  [[params_out.b[0]],[params_out.b_err[0]],[params_out.v[0]],[params_out.v_err[0]],$
;[params_out.fcov[0]], [params_out.fcov_err[0]], [params_out.log_n[0]], [params_out.log_n_err[0]]]
;  vec_col_arr = [vec_col_arr, vec_col]  
;endfor
;
;vec_col_arrdens = [vec_col_arrdens, transpose(mean(vec_col_arr, dimension = 1)), transpose(stddev(vec_col_arr, dimension = 1))]
;
;
;
;; SN10
;
;s.err = fltarr(n_elements(simu.wave))+0.1
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisecfSN10[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;  
; vec_col =  [[params_out.b[0]],[params_out.b_err[0]],[params_out.v[0]],[params_out.v_err[0]],$
;[params_out.fcov[0]], [params_out.fcov_err[0]], [params_out.log_n[0]], [params_out.log_n_err[0]]]
;  vec_col_arr = [vec_col_arr, vec_col]  
;endfor
;
;vec_col_arrcf = [vec_col_arrcf, transpose(mean(vec_col_arr, dimension = 1)), transpose(stddev(vec_col_arr, dimension = 1))]
;
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisedensSN10[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;  
;  vec_col =  [[params_out.b[0]],[params_out.b_err[0]],[params_out.v[0]],[params_out.v_err[0]],$
;[params_out.fcov[0]], [params_out.fcov_err[0]], [params_out.log_n[0]], [params_out.log_n_err[0]]]
;  vec_col_arr = [vec_col_arr, vec_col]  
;endfor
;
;vec_col_arrdens = [vec_col_arrdens, transpose(mean(vec_col_arr, dimension = 1)), transpose(stddev(vec_col_arr, dimension = 1))]
;
;
;
;
;s.err = fltarr(n_elements(simu.wave))+0.04
;
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisecfSN25[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;  
;  vec_col =  [[params_out.b[0]],[params_out.b_err[0]],[params_out.v[0]],[params_out.v_err[0]],$
;[params_out.fcov[0]], [params_out.fcov_err[0]], [params_out.log_n[0]], [params_out.log_n_err[0]]]
;  vec_col_arr = [vec_col_arr, vec_col]  
;  print,ii
;endfor
;
;vec_col_arrcf = [vec_col_arrcf, transpose(mean(vec_col_arr, dimension = 1)), transpose(stddev(vec_col_arr, dimension = 1))]
;
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisedensSN25[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;  
;  vec_col =  [[params_out.b[0]],[params_out.b_err[0]],[params_out.v[0]],[params_out.v_err[0]],$
;[params_out.fcov[0]], [params_out.fcov_err[0]], [params_out.log_n[0]], [params_out.log_n_err[0]]]
;  vec_col_arr = [vec_col_arr, vec_col]  
;  print,ii
;endfor
;
;vec_col_arrdens = [vec_col_arrdens, transpose(mean(vec_col_arr, dimension = 1)), transpose(stddev(vec_col_arr, dimension = 1))]
;
;;write_csv, 'Simu/SN10cf10vdisp100.csv', vec_col_arr
;s.err = fltarr(n_elements(simu.wave))+0.02
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisecfSN50[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;  
;  vec_col =  [[params_out.b[0]],[params_out.b_err[0]],[params_out.v[0]],[params_out.v_err[0]],$
;[params_out.fcov[0]], [params_out.fcov_err[0]], [params_out.log_n[0]], [params_out.log_n_err[0]]]
;  vec_col_arr = [vec_col_arr, vec_col]  
;  print,ii
;endfor
;
;vec_col_arrcf = [vec_col_arrcf, transpose(mean(vec_col_arr, dimension = 1)), transpose(stddev(vec_col_arr, dimension = 1))]
;
;
;
;vec_col_arr = []
;for ii = 0, 49 do begin
;  s.flux = simu.noisedensSN50[*,ii]
;  params.s = s 
;  params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;  exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;  
;  vec_col =  [[params_out.b[0]],[params_out.b_err[0]],[params_out.v[0]],[params_out.v_err[0]],$
;[params_out.fcov[0]], [params_out.fcov_err[0]], [params_out.log_n[0]], [params_out.log_n_err[0]]]
;  vec_col_arr = [vec_col_arr, vec_col]  
;   print,ii
;endfor
;
;vec_col_arrdens = [vec_col_arrdens, transpose(mean(vec_col_arr, dimension = 1)), transpose(stddev(vec_col_arr, dimension = 1))]
;
;write_csv, 'Simu/cf'+cff[jj]+'+vdisp20.csv', vec_col_arrcf
;write_csv, 'Simu/dens'+cff[jj]+'vdisp20.csv', vec_col_arrdens
;
;endfor

end