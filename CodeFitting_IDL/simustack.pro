; 
; models = mrdfits('Models/models.fits', 1)
;
;
;x = (FINDGEN(7500)/50)+910
;y = dblarr(7500)
;;y = interpol(models.flux[*,2], models.wave, x)
;
;  s99_pix = 11.75 ; size of 1 model pixel in km/s 
;  s99_vdisp = 58.0 ; approximate velocity dispersion of S99 models
;  vdisp = [20.,200.,600.]
;indiv = fltarr(100,7500)
;indiv_noise = fltarr(100,7500)
;noise_coef = fltarr(100)
;noise_arr =fltarr(100,7500)
;fcov = fltarr(100)
;logn = fltarr(100)
;b = fltarr(100) + 75
;
;fcov = randomu(seed, 100)*0.3 +0.7
;noise_coef = randomu(seed,100)*0.35 +0.15
;noise_mean  =sqrt(total(noise_coef^2))/100
;stack = fltarr(7,7500)
;stack_noise=fltarr(7,7500)
;reddy =0.
;ebv = 0.
;
;
;fcov_Wmean = (total(fcov/noise_coef^2))/(total(1/noise_coef^2))
;fcov_mean = mean(fcov)
;;fcov_med = median(fcov)
;b_Wmean = (total(b/noise_coef^2))/(total(1/noise_coef^2))
;b_mean = mean(b)
;;b_med = median(b)
;logn_Wmean = (total(logn/noise_coef^2))/(total(1/noise_coef^2))
;logn_mean = mean(logn)
;;b_med = median(logn)
;
;headl = ['HI parameter', 'Value']
;allstring = ['Fcov Min', 'Fcov Max', 'Fcov Weighted mean', 'Fcov mean',' B min', 'B max', 'B weighted mean', 'B mean', 'Log(N(HI)) min',  'Log(N(HI)) max',  'Log(N(HI)) Wmean',  'Log(N(HI)) mean']
;params_arr = [min(fcov), max(fcov),fcov_Wmean, fcov_mean, min(b), max(b), b_Wmean, b_mean, min(logn), max(logn), logn_Wmean, logn_mean]
;
;write_csv, 'Simu/stackParameterscfandb.csv', allstring, params_arr, header= headl
;
;b = randomu(seed, 100)*100+50
;logn = randomu(seed, 100)*2+18
;
;
;  for ii = 0, 99 do begin & $
;  noise_arr[ii,*] = noise_coef[ii]*randomn(seed, n_elements(x)) & $
;  endfor
;  
;   vdisp =[20.,200.,600.]
;   vdisp = vdisp/2.3548
;   
; for jj = 0, 2 do begin & $
; 
;  if vdisp[jj] lt s99_vdisp then vdisp_add = 0  $ & $
;  else vdisp_add = sqrt(vdisp[jj]^2 - s99_vdisp^2)  & $
;  sigma_pix = vdisp_add / s99_pix & $
;  
; 
; y = gconv(interpol(models.flux[*,2], models.wave, x), sigma_pix) & $
;
; o1j924 = lyb_ab(x,0,75,16, 924.950, .0013, 7.22d6, 1,reddy, ebv, vdisp=vdisp[jj]) & $; O I 976
; o1j929 = lyb_ab(x,0,75,16, 929.517, .00192, 1.06d7, 1,reddy, ebv, vdisp=vdisp[jj]) & $; O I 976
; o1j930 = lyb_ab(x,0,75,16, 930.257, .000537, 6.9d6, 1,reddy, ebv, vdisp=vdisp[jj]) & $; O I 976
; o1j936 = lyb_ab(x,0,75,16, 936.629, .00306, 1.66d7, 1,reddy, ebv, vdisp=vdisp[jj]) & $; O I 976
; o1j948 = lyb_ab(x,0,75,16, 948.686, .00531, 2.81d7, 1,reddy, ebv, vdisp=vdisp[jj]) & $; O I 976
; o1j950 = lyb_ab(x,0,75,16, 950.885, .00158, 1.94d7, 1,reddy, ebv, vdisp=vdisp[jj]) & $; O I 976
; o1j971 = lyb_ab(x,0,75,16, 971.738, .0116, 5.85d7, 1,reddy, ebv, vdisp=vdisp[jj]) & $; O I 976
; o1j976 = lyb_ab(x,0,75,16, 976.448, .00331, 3.86d7, 1,reddy, ebv, vdisp=vdisp[jj]) & $; O I 976
; o1j988a = lyb_ab(x,0,75,16, 988.578, .000569, 6.47d6, 1,reddy, ebv, vdisp=vdisp[jj])  & $; O I 976
; o1j988b = lyb_ab(x,0,75,16, 988.655, .00846, 5.77d7, 1,reddy, ebv, vdisp=vdisp[jj]) & $; O I 976
; o1j988 = lyb_ab(x,0,75,16, 988.773, .0464, 2.26d8, 1,reddy, ebv, vdisp=vdisp[jj]) & $; O I 976
; o1j1025 = lyb_ab(x,0,75,16, 1025.762, .0169, 7.66d7, 1,reddy, ebv, vdisp=vdisp[jj]) & $; O I 976
; o1j1039 = lyb_ab(x,0,75,16, 1039.230, 0.00916, 9.43d7, 1,reddy, ebv, vdisp=vdisp[jj])  & $; O I 1039 profile
;  
; o6j1031 = lyb_ab(x,0.,100,15., 1031.912, 0.133, 4.16d8, 1,reddy, ebv, vdisp=vdisp[jj])  & $; O VI 1031 profile
; o6j1037 = lyb_ab(x,0.,100,15., 1037.613, 0.066, 4.09d8, 1,reddy, ebv, vdisp=vdisp[jj])  & $; O VI 1037 profile
; c2j1036 = lyb_ab(x,0.,80,15.5, 1036.337, 0.119, 7.38d8, 1,reddy, ebv, vdisp=vdisp[jj])  & $; C II 1036 profile
;  
;olines = o1j924*o1j929*o1j930*o1j936*o1j948*o1j950*o1j971*o1j976*o1j988a*o1j988b*o1j988*o1j1025*o1j1039*o6j1031*o6j1037*c2j1036 & $
;
;
;for ii = 0, 99 do begin& $
;
;
;lyb_cf10 = lyb_ab(x, 0, b[ii],logn[ii], 1025.728, .079142, 5.5751d7,fcov[ii], reddy, ebv, vdisp=vdisp[jj])& $ ;This calls an ancilary function to generate the LyB profile
;lyg_cf10 = lyb_ab(x, 0,  b[ii], logn[ii], 972.517, 0.029006, 1.2785d7, fcov[ii],reddy, ebv,  vdisp=vdisp[jj])& $ ; LyG profile
;lyd_cf10 = lyb_ab(x, 0,  b[ii], logn[ii], 949.742, .013945, 4.125d6, fcov[ii],reddy, ebv,  vdisp=vdisp[jj]) & $; LyG profile
;ly5_cf10 = lyb_ab(x,0,  b[ii],logn[ii], 937.814, 0.0078035, 1.644d6, fcov[ii], reddy, ebv, vdisp=vdisp[jj])& $ ; LyG profile
;ly6_cf10 = lyb_ab(x, 0,  b[ii], logn[ii], 930.751, 0.0048164, 7.5684d5,fcov[ii], reddy, ebv, vdisp=vdisp[jj]) & $; LyG profile
;ly7_cf10 = lyb_ab(x, 0,  b[ii], logn[ii], 926.249, 0.0031850, 3.8694d5, fcov[ii],reddy, ebv,  vdisp=vdisp[jj])& $ ; LyG profile
;ly8_cf10 = lyb_ab(x, 0,  b[ii], logn[ii], 923.148, 0.0022172, 2.1425d5, fcov[ii],reddy, ebv,  vdisp=vdisp[jj])& $ ; LyG profile
;
;indiv[ii,*]= y*lyb_cf10*lyg_cf10*lyd_cf10*ly5_cf10*ly6_cf10*ly7_cf10*ly8_cf10 * olines& $
;indiv_noise[ii,*] = indiv[ii,*] + noise_arr[ii,*] & $
;
;
;endfor & $
;;
;
;stack[jj,*] = mean(indiv,dimension=1) & $
;stack_noise[jj,*] = mean(indiv_noise,dimension=1) & $
;
;
;endfor
;
;
;fcov_Wmean = (total(fcov/noise_coef^2))/(total(1/noise_coef^2))
;fcov_mean = mean(fcov)
;;fcov_med = median(fcov)
;b_Wmean = (total(b/noise_coef^2))/(total(1/noise_coef^2))
;b_mean = mean(b)
;;b_med = median(b)
;logn_Wmean = (total(logn/noise_coef^2))/(total(1/noise_coef^2))
;logn_mean = mean(logn)
;;b_med = median(logn)
;
;headl = ['HI parameter', 'Value']
;allstring = ['Fcov Min', 'Fcov Max', 'Fcov Weighted mean', 'Fcov mean',' B min', 'B max', 'B weighted mean', 'B mean', 'Log(N(HI)) min',  'Log(N(HI)) max',  'Log(N(HI)) Wmean',  'Log(N(HI)) mean']
;params_arr = [min(fcov), max(fcov),fcov_Wmean, fcov_mean, min(b), max(b), b_Wmean, b_mean, min(logn), max(logn), logn_Wmean, logn_mean]
;
;write_csv, 'Simu/stackParametersnofix.csv', allstring, params_arr, header= headl
;
;tosave = {name:'stacklognfix', wave:x, b:b, fcov:fcov, noise_coef:noise_coef, noise_arr:noise_arr,$
; groundstack20: stack[0,*],  groundstack200: stack[1,*],groundstack500: stack[2,*],$
; stack_noise20 : stack_noise[0,*],stack_noise200 : stack_noise[1,*],stack_noise500 : stack_noise[2,*]}
;;
;mwrfits, tosave, 'Simu/stack100nofix.fits'
;;
linefile = 'linelist.csv'

groups = list({species:'HI', cf_fix:0, cf_lim:0.1,cf_val:1., log_n_fix:0, log_n_val:18., log_n_lim:24.},$
              {species:'OVI', cf_fix:1, cf_lim:0.1},$
             {species:'OI', cf_fix:1, cf_lim:0.1},$
              {species:'CII', cf_fix:1})


              
wltoinclude=list([928,1050])


simu= mrdfits('Simu/stack100nofix.fits', 1)
;imu = tosave;
;;; Resolution = 15000
;
;vec_col_arr = []
;fcovstring = 'fcov('+params_out.speciesgal+')' 
;lognstring = 'log_n('+params_out.speciesgal+')'
;bstring = 'b('+params_out.speciesgal+')'
;vstring ='v('+params_out.speciesgal+')'
;allstring = ['Stellar', 'E(B-V)',fcovstring,lognstring,bstring,vstring]
;headl = ['Parameter', 'GTfit', 'GTfitError', 'Noisefit', 'NoisefitError']

;s = {wave:simu.wave, flux:simu.groundstack20, err:fltarr(n_elements(simu.wave))+0.000005, z:1000}
;s = {wave:simu.wave, flux:simu.stack_noise20, err:fltarr(n_elements(simu.wave))+noise_mean, z:1000}

;params = {fitchoice : 2,$
;          vdisp:20./2.3548,$
;          solarmodels: 'Z',$           
;          light_arr:fltarr(10)+1,$
;          ebv_coef:  0.,$
;          s:s}
;          
          params = {fitchoice :2,$ ; 1; Stellar continuum only, 2: Stellar with lines, 3: Lines on removed stellar continuum spectrum
          vdisp:20./2.3548,$ ; Velocity resolution
          solarmodels: 'Z',$ 
          ;removelist : ['CII1036'],$ ; to remove particular lines (name in linelist file)
          light_arr:fltarr(10),$; Initialization of stellar continuum
          fixstell:0,$ ; fixing stellar continuum (only with fitchoice 2 or 3)
          ebv_coef:  0.,$; Initialization of E(B-V)
          fixebv : 0,$ ; fixing E(B-V)  (only with fitchoice 2 or 3)
          s:s,$   ; Structure with wavelengths, data, error and z
          MW:0.}  ; Include  Milky Way Lines
          

;params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;
;exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
;print, 'Age of the continuum: ' + string(exage/1e6) +' Myr'
;print, 'E(B-V) = ' + string(params_out.ebv) + string(params_out.ebv_err)
;
;if tag_exist(params_out, 'speciesgal') then print, 'Log(N('+ string(params_out.speciesgal)+')) =' + string(params_out.log_n) +' +- ' + string(params_out.log_n_err)+ ', '
;
;if tag_exist(params_out, 'speciesgal') then print, string(params_out.speciesgal[0]) + ' with covering fraction of ' + string(params_out.fcov[0])+ ' +- ' + string(params_out.fcov_err[0])
;if tag_exist(params_out, 'speciesgal') then print, 'B('+ string(params_out.speciesgal)+') =' + string(params_out.b) +' +- ' + string(params_out.b_err)+ ', '
;if tag_exist(params_out, 'speciesgal') then print, 'V('+ string(params_out.speciesgal)+') =' + string(params_out.v) +' +- ' + string(params_out.v_err)+ ', '
;
;plotfit, s, params_out, [920,1050], params.vdisp, 1, 1, 1 
;;
;light_arr = params_out.light_frac
;light_arr_err = params_out.light_frac_err
;exage = total(params_out.light_frac*models.age)/total(params_out.light_frac) ; Age of stellar continuum
;exage_err=0 &$
;for ii = 0, 9 do begin & $
;tot_temp = 0 &$
;for jj = 0,9 do begin & $
;if jj ne ii then tot_temp = tot_temp + light_arr[jj] &$
;endfor &$
;exage_err = exage_err + (light_arr_err[ii]*models.age[ii]*tot_temp)^2 &$
;endfor &$
;exage_err = sqrt(exage_err)/total(light_arr)^2 &$ ; Error on age of stellar continuum
;
;vec_col = [[exage,exage_err], [params_out.ebv,params_out.ebv_err],[transpose(params_out.b),transpose(params_out.b_err)],[transpose(params_out.v),transpose(params_out.v_err)],$
;[transpose(params_out.fcov),transpose(params_out.fcov_err)], [transpose(params_out.log_n),transpose(params_out.log_n_err)]] 
;vec_col_arr = [vec_col_arr, vec_col]


s = {wave:simu.wave, flux:simu.stack_noise20, err:fltarr(n_elements(simu.wave))+0.03, z:1000}
params.s = s

params_outa = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
plotfit, s, params_outa, [920,1050], params.vdisp, 1, 1, 1 
;
;light_arr = params_out.light_frac
;light_arr_err = params_out.light_frac_err
;exage = total(params_out.light_frac*models.age)/total(params_out.light_frac) ; Age of stellar continuum
;exage_err=0 &$
;for ii = 0, 9 do begin & $
;tot_temp = 0 &$
;for jj = 0,9 do begin & $
;if jj ne ii then tot_temp = tot_temp + light_arr[jj] &$
;endfor &$
;exage_err = exage_err + (light_arr_err[ii]*models.age[ii]*tot_temp)^2 &$
;endfor &$
;exage_err = sqrt(exage_err)/total(light_arr)^2 &$ ; Error on age of stellar continuum
;
;vec_col = [[exage,exage_err], [params_out.ebv,params_out.ebv_err],[transpose(params_out.b),transpose(params_out.b_err)],[transpose(params_out.v),transpose(params_out.v_err)],$
;[transpose(params_out.fcov),transpose(params_out.fcov_err)], [transpose(params_out.log_n),transpose(params_out.log_n_err)]] 
;vec_col_arr = [vec_col_arr, vec_col]

;
;write_csv, 'Simu/stackVres20nofix.csv', allstring, transpose(vec_col_arr[0,*]), transpose(vec_col_arr[1,*]), transpose(vec_col_arr[2,*]), transpose(vec_col_arr[3,*]), header= headl
;
;
;;;; Resolution = 6000
;
;vec_col_arr = []
;s = {wave:simu.wave, flux:simu.groundstack50, err:fltarr(n_elements(simu.wave))+0.000005, z:1000}
;params.vdisp = 50./2.3548
;params.s = s
;
;params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;light_arr = params_out.light_frac
;light_arr_err = params_out.light_frac_err
;exage = total(params_out.light_frac*models.age)/total(params_out.light_frac) ; Age of stellar continuum
;exage_err=0 &$
;for ii = 0, 9 do begin & $
;tot_temp = 0 &$
;for jj = 0,9 do begin & $
;if jj ne ii then tot_temp = tot_temp + light_arr[jj] &$
;endfor &$
;exage_err = exage_err + (light_arr_err[ii]*models.age[ii]*tot_temp)^2 &$
;endfor &$
;exage_err = sqrt(exage_err)/total(light_arr)^2 &$ ; Error on age of stellar continuum
;
;vec_col = [[exage,exage_err], [params_out.ebv,params_out.ebv_err],[transpose(params_out.b),transpose(params_out.b_err)],[transpose(params_out.v),transpose(params_out.v_err)],$
;[transpose(params_out.fcov),transpose(params_out.fcov_err)], [transpose(params_out.log_n),transpose(params_out.log_n_err)]] 
;vec_col_arr = [vec_col_arr, vec_col]
;
;
;s = {wave:simu.wave, flux:simu.stack_noise50, err:fltarr(n_elements(simu.wave))+noise_mean, z:1000}
;params.s = s
;
;params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;light_arr = params_out.light_frac
;light_arr_err = params_out.light_frac_err
;exage = total(params_out.light_frac*models.age)/total(params_out.light_frac) ; Age of stellar continuum
;exage_err=0 &$
;for ii = 0, 9 do begin & $
;tot_temp = 0 &$
;for jj = 0,9 do begin & $
;if jj ne ii then tot_temp = tot_temp + light_arr[jj] &$
;endfor &$
;exage_err = exage_err + (light_arr_err[ii]*models.age[ii]*tot_temp)^2 &$
;endfor &$
;exage_err = sqrt(exage_err)/total(light_arr)^2 &$ ; Error on age of stellar continuum
;
;vec_col = [[exage,exage_err], [params_out.ebv,params_out.ebv_err],[transpose(params_out.b),transpose(params_out.b_err)],[transpose(params_out.v),transpose(params_out.v_err)],$
;[transpose(params_out.fcov),transpose(params_out.fcov_err)], [transpose(params_out.log_n),transpose(params_out.log_n_err)]] 
;vec_col_arr = [vec_col_arr, vec_col]
;
;
;write_csv, 'Simu/stackVres50.csv', allstring, transpose(vec_col_arr[0,*]), transpose(vec_col_arr[1,*]), transpose(vec_col_arr[2,*]), transpose(vec_col_arr[3,*]), header= headl
;
;
;;;; Resolution = 3000
;
;vec_col_arr = []
;s = {wave:simu.wave, flux:simu.groundstack100, err:fltarr(n_elements(simu.wave))+0.000005, z:1000}
;params.vdisp = 100./2.3548
;params.s = s
;
;params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;light_arr = params_out.light_frac
;light_arr_err = params_out.light_frac_err
;exage = total(params_out.light_frac*models.age)/total(params_out.light_frac) ; Age of stellar continuum
;exage_err=0 &$
;for ii = 0, 9 do begin & $
;tot_temp = 0 &$
;for jj = 0,9 do begin & $
;if jj ne ii then tot_temp = tot_temp + light_arr[jj] &$
;endfor &$
;exage_err = exage_err + (light_arr_err[ii]*models.age[ii]*tot_temp)^2 &$
;endfor &$
;exage_err = sqrt(exage_err)/total(light_arr)^2 &$ ; Error on age of stellar continuum
;
;vec_col = [[exage,exage_err], [params_out.ebv,params_out.ebv_err],[transpose(params_out.b),transpose(params_out.b_err)],[transpose(params_out.v),transpose(params_out.v_err)],$
;[transpose(params_out.fcov),transpose(params_out.fcov_err)], [transpose(params_out.log_n),transpose(params_out.log_n_err)]] 
;vec_col_arr = [vec_col_arr, vec_col]
;
;
;s = {wave:simu.wave, flux:simu.stack_noise100, err:fltarr(n_elements(simu.wave))+noise_mean, z:1000}
;params.s = s
;
;params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;light_arr = params_out.light_frac
;light_arr_err = params_out.light_frac_err
;exage = total(params_out.light_frac*models.age)/total(params_out.light_frac) ; Age of stellar continuum
;exage_err=0 &$
;for ii = 0, 9 do begin & $
;tot_temp = 0 &$
;for jj = 0,9 do begin & $
;if jj ne ii then tot_temp = tot_temp + light_arr[jj] &$
;endfor &$
;exage_err = exage_err + (light_arr_err[ii]*models.age[ii]*tot_temp)^2 &$
;endfor &$
;exage_err = sqrt(exage_err)/total(light_arr)^2 &$ ; Error on age of stellar continuum
;
;vec_col = [[exage,exage_err], [params_out.ebv,params_out.ebv_err],[transpose(params_out.b),transpose(params_out.b_err)],[transpose(params_out.v),transpose(params_out.v_err)],$
;[transpose(params_out.fcov),transpose(params_out.fcov_err)], [transpose(params_out.log_n),transpose(params_out.log_n_err)]] 
;vec_col_arr = [vec_col_arr, vec_col]
;
;
;write_csv, 'Simu/stackVres100.csv', allstring, transpose(vec_col_arr[0,*]), transpose(vec_col_arr[1,*]), transpose(vec_col_arr[2,*]), transpose(vec_col_arr[3,*]), header= headl
;
;
;;;; Resolution = 1500
;
;vec_col_arr = []
;s = {wave:simu.wave, flux:simu.groundstack200, err:fltarr(n_elements(simu.wave))+0.000005, z:1000}
params.vdisp = 200./2.3548
params.s = s
;
;params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;light_arr = params_out.light_frac
;light_arr_err = params_out.light_frac_err
;exage = total(params_out.light_frac*models.age)/total(params_out.light_frac) ; Age of stellar continuum
;exage_err=0 &$
;for ii = 0, 9 do begin & $
;tot_temp = 0 &$
;for jj = 0,9 do begin & $
;if jj ne ii then tot_temp = tot_temp + light_arr[jj] &$
;endfor &$
;exage_err = exage_err + (light_arr_err[ii]*models.age[ii]*tot_temp)^2 &$
;endfor &$
;exage_err = sqrt(exage_err)/total(light_arr)^2 &$ ; Error on age of stellar continuum
;
;vec_col = [[exage,exage_err], [params_out.ebv,params_out.ebv_err],[transpose(params_out.b),transpose(params_out.b_err)],[transpose(params_out.v),transpose(params_out.v_err)],$
;[transpose(params_out.fcov),transpose(params_out.fcov_err)], [transpose(params_out.log_n),transpose(params_out.log_n_err)]] 
;vec_col_arr = [vec_col_arr, vec_col]


s = {wave:simu.wave, flux:simu.stack_noise200, err:fltarr(n_elements(simu.wave))+0.03, z:1000}
params.s = s

params_outb = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;light_arr = params_out.light_frac
;light_arr_err = params_out.light_frac_err
;exage = total(params_out.light_frac*models.age)/total(params_out.light_frac) ; Age of stellar continuum
;exage_err=0 &$
;for ii = 0, 9 do begin & $
;tot_temp = 0 &$
;for jj = 0,9 do begin & $
;if jj ne ii then tot_temp = tot_temp + light_arr[jj] &$
;endfor &$
;exage_err = exage_err + (light_arr_err[ii]*models.age[ii]*tot_temp)^2 &$
;endfor &$
;exage_err = sqrt(exage_err)/total(light_arr)^2 &$ ; Error on age of stellar continuum
;
;vec_col = [[exage,exage_err], [params_out.ebv,params_out.ebv_err],[transpose(params_out.b),transpose(params_out.b_err)],[transpose(params_out.v),transpose(params_out.v_err)],$
;[transpose(params_out.fcov),transpose(params_out.fcov_err)], [transpose(params_out.log_n),transpose(params_out.log_n_err)]] 
;vec_col_arr = [vec_col_arr, vec_col]


;write_csv, 'Simu/stackVres200nofix.csv', allstring, transpose(vec_col_arr[0,*]), transpose(vec_col_arr[1,*]), transpose(vec_col_arr[2,*]), transpose(vec_col_arr[3,*]), header= headl


;;;; Resolution = 1000
;
;vec_col_arr = []
;s = {wave:simu.wave, flux:simu.groundstack300, err:fltarr(n_elements(simu.wave))+0.000005, z:1000}
;params.vdisp = 300./2.3548
;params.s = s
;
;params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;light_arr = params_out.light_frac
;light_arr_err = params_out.light_frac_err
;exage = total(params_out.light_frac*models.age)/total(params_out.light_frac) ; Age of stellar continuum
;exage_err=0 &$
;for ii = 0, 9 do begin & $
;tot_temp = 0 &$
;for jj = 0,9 do begin & $
;if jj ne ii then tot_temp = tot_temp + light_arr[jj] &$
;endfor &$
;exage_err = exage_err + (light_arr_err[ii]*models.age[ii]*tot_temp)^2 &$
;endfor &$
;exage_err = sqrt(exage_err)/total(light_arr)^2 &$ ; Error on age of stellar continuum
;
;vec_col = [[exage,exage_err], [params_out.ebv,params_out.ebv_err],[transpose(params_out.b),transpose(params_out.b_err)],[transpose(params_out.v),transpose(params_out.v_err)],$
;[transpose(params_out.fcov),transpose(params_out.fcov_err)], [transpose(params_out.log_n),transpose(params_out.log_n_err)]] 
;vec_col_arr = [vec_col_arr, vec_col]
;
;
;s = {wave:simu.wave, flux:simu.stack_noise300, err:fltarr(n_elements(simu.wave))+noise_mean, z:1000}
;params.s = s
;
;params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;light_arr = params_out.light_frac
;light_arr_err = params_out.light_frac_err
;exage = total(params_out.light_frac*models.age)/total(params_out.light_frac) ; Age of stellar continuum
;exage_err=0 &$
;for ii = 0, 9 do begin & $
;tot_temp = 0 &$
;for jj = 0,9 do begin & $
;if jj ne ii then tot_temp = tot_temp + light_arr[jj] &$
;endfor &$
;exage_err = exage_err + (light_arr_err[ii]*models.age[ii]*tot_temp)^2 &$
;endfor &$
;exage_err = sqrt(exage_err)/total(light_arr)^2 &$ ; Error on age of stellar continuum
;
;vec_col = [[exage,exage_err], [params_out.ebv,params_out.ebv_err],[transpose(params_out.b),transpose(params_out.b_err)],[transpose(params_out.v),transpose(params_out.v_err)],$
;[transpose(params_out.fcov),transpose(params_out.fcov_err)], [transpose(params_out.log_n),transpose(params_out.log_n_err)]] 
;vec_col_arr = [vec_col_arr, vec_col]
;
;
;write_csv, 'Simu/stackVres300.csv', allstring, transpose(vec_col_arr[0,*]), transpose(vec_col_arr[1,*]), transpose(vec_col_arr[2,*]), transpose(vec_col_arr[3,*]), header= headl
;
;
;;;; Resolution = 750
;
;vec_col_arr = []
;s = {wave:simu.wave, flux:simu.groundstack400, err:fltarr(n_elements(simu.wave))+0.000005, z:1000}
;params.vdisp = 400./2.3548
;params.s = s
;
;params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;light_arr = params_out.light_frac
;light_arr_err = params_out.light_frac_err
;exage = total(params_out.light_frac*models.age)/total(params_out.light_frac) ; Age of stellar continuum
;exage_err=0 &$
;for ii = 0, 9 do begin & $
;tot_temp = 0 &$
;for jj = 0,9 do begin & $
;if jj ne ii then tot_temp = tot_temp + light_arr[jj] &$
;endfor &$
;exage_err = exage_err + (light_arr_err[ii]*models.age[ii]*tot_temp)^2 &$
;endfor &$
;exage_err = sqrt(exage_err)/total(light_arr)^2 &$ ; Error on age of stellar continuum
;
;vec_col = [[exage,exage_err], [params_out.ebv,params_out.ebv_err],[transpose(params_out.b),transpose(params_out.b_err)],[transpose(params_out.v),transpose(params_out.v_err)],$
;[transpose(params_out.fcov),transpose(params_out.fcov_err)], [transpose(params_out.log_n),transpose(params_out.log_n_err)]] 
;vec_col_arr = [vec_col_arr, vec_col]
;
;
;s = {wave:simu.wave, flux:simu.stack_noise400, err:fltarr(n_elements(simu.wave))+noise_mean, z:1000}
;params.s = s
;
;params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;light_arr = params_out.light_frac
;light_arr_err = params_out.light_frac_err
;exage = total(params_out.light_frac*models.age)/total(params_out.light_frac) ; Age of stellar continuum
;exage_err=0 &$
;for ii = 0, 9 do begin & $
;tot_temp = 0 &$
;for jj = 0,9 do begin & $
;if jj ne ii then tot_temp = tot_temp + light_arr[jj] &$
;endfor &$
;exage_err = exage_err + (light_arr_err[ii]*models.age[ii]*tot_temp)^2 &$
;endfor &$
;exage_err = sqrt(exage_err)/total(light_arr)^2 &$ ; Error on age of stellar continuum
;
;vec_col = [[exage,exage_err], [params_out.ebv,params_out.ebv_err],[transpose(params_out.b),transpose(params_out.b_err)],[transpose(params_out.v),transpose(params_out.v_err)],$
;[transpose(params_out.fcov),transpose(params_out.fcov_err)], [transpose(params_out.log_n),transpose(params_out.log_n_err)]] 
;vec_col_arr = [vec_col_arr, vec_col]
;
;
;write_csv, 'Simu/stackVres400.csv', allstring, transpose(vec_col_arr[0,*]), transpose(vec_col_arr[1,*]), transpose(vec_col_arr[2,*]), transpose(vec_col_arr[3,*]), header= headl
;
;
;;;; Resolution = 500

;vec_col_arr = []
;s = {wave:simu.wave, flux:simu.groundstack500, err:fltarr(n_elements(simu.wave))+0.000005, z:1000}
params.vdisp = 600./2.3548
params.s = s
;
;params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;light_arr = params_out.light_frac
;light_arr_err = params_out.light_frac_err
;exage = total(params_out.light_frac*models.age)/total(params_out.light_frac) ; Age of stellar continuum
;exage_err=0 &$
;for ii = 0, 9 do begin & $
;tot_temp = 0 &$
;for jj = 0,9 do begin & $
;if jj ne ii then tot_temp = tot_temp + light_arr[jj] &$
;endfor &$
;exage_err = exage_err + (light_arr_err[ii]*models.age[ii]*tot_temp)^2 &$
;endfor &$
;exage_err = sqrt(exage_err)/total(light_arr)^2 &$ ; Error on age of stellar continuum
;
;vec_col = [[exage,exage_err], [params_out.ebv,params_out.ebv_err],[transpose(params_out.b),transpose(params_out.b_err)],[transpose(params_out.v),transpose(params_out.v_err)],$
;[transpose(params_out.fcov),transpose(params_out.fcov_err)], [transpose(params_out.log_n),transpose(params_out.log_n_err)]] 
;vec_col_arr = [vec_col_arr, vec_col]


s = {wave:simu.wave, flux:simu.stack_noise500, err:fltarr(n_elements(simu.wave))+0.03, z:1000}
params.s = s

params_outc = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
;light_arr = params_out.light_frac
;light_arr_err = params_out.light_frac_err
;exage = total(params_out.light_frac*models.age)/total(params_out.light_frac) ; Age of stellar continuum
;exage_err=0 &$
;for ii = 0, 9 do begin & $
;tot_temp = 0 &$
;for jj = 0,9 do begin & $
;if jj ne ii then tot_temp = tot_temp + light_arr[jj] &$
;endfor &$
;exage_err = exage_err + (light_arr_err[ii]*models.age[ii]*tot_temp)^2 &$
;endfor &$
;exage_err = sqrt(exage_err)/total(light_arr)^2 &$ ; Error on age of stellar continuum
;
;vec_col = [[exage,exage_err], [params_out.ebv,params_out.ebv_err],[transpose(params_out.b),transpose(params_out.b_err)],[transpose(params_out.v),transpose(params_out.v_err)],$
;[transpose(params_out.fcov),transpose(params_out.fcov_err)], [transpose(params_out.log_n),transpose(params_out.log_n_err)]] 
;vec_col_arr = [vec_col_arr, vec_col]
;
;
;write_csv, 'Simu/stackVres600nofix.csv', allstring, transpose(vec_col_arr[0,*]), transpose(vec_col_arr[1,*]), transpose(vec_col_arr[2,*]), transpose(vec_col_arr[3,*]), header= headl

end