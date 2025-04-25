function s99_continuum_o6, model, allwave, flux, err, good_reg, vdisp, options, $
         yfit = yfit

 
restwl = allwave
nmodels = n_elements(model.age) ;This is the total number of continuum models

if tag_exist(options, 'ngroup') then ngroup = options.ngroup
if tag_exist(options, 'nspeciesGal') then nspeciesGal = options.nspeciesGal
if tag_exist(options, 'nspeciesMW') then nspeciesMW = options.nspeciesMW


if (options.fitChoice ne 3) then begin
  ; Define the output structure. This includes light fractions, model ages, LyB velocities,
  ; LyB column densities, LyB b-parameters, and the errors on each.
  restwl = allwave[good_reg]
  flux = flux[good_reg]
  err = err[good_reg]
 ; nmodels = n_elements(model.age) ;This is the total number of continuum models
endif 

if (options.fitChoice eq 1) then begin
  coefs = {light_frac: fltarr(nmodels), light_frac_err: fltarr(nmodels), $
           model_age: model.age, ebv:fltarr(2),ebv_err:fltarr(2)}
  
  parinfo = replicate({value:0.D, fixed:0, limited:[0,0], tied:'', $
                      limits:[0.D,0.D]},nmodels+ 2) ;nmodels = number of stellar continuum, 3 for LyB
  

  parinfo[0:nmodels-1].limited = [1,0]  ;This says that the light fraction for each continuum model is limited on the lower limit but not the upper limit
  parinfo[0:nmodels-1].limits = [0.0,0.0] ;Sets the lower limit to 0. Don't want negative light fractions
  parinfo[0:nmodels-1].value = 20 ;This sets the starting value for the light fractions at .1 for all models
  parinfo[0:nmodels-1].fixed = 0 ;This sets the starting value for the light fractions at .1 for all models
  
  ;Now the EBV parameter
  parinfo[nmodels:nmodels+1].value = [0.0,0.0] ;Initial b-parameter guess.
  parinfo[nmodels:nmodels+1].fixed =  [0,0] ; We are not fixing the b-parameter 
  parinfo[nmodels:nmodels+1].limited = [1,1] ; The ebv-parameter is limited for both upper and lower limits
  parinfo[nmodels:nmodels+1].limits = [0, 1] ; The limits of the ebv value
  
  endif else begin
  
  if nspeciesMW eq 0 then nspeciesMW = 1
  
  coefs = {light_frac: fltarr(nmodels), light_frac_err: fltarr(nmodels), $
           model_age: model.age, ebv:fltarr(2),ebv_err:fltarr(2),$
           b:fltarr(ngroup), b_err:fltarr(ngroup),$
           v:fltarr(ngroup), v_err:fltarr(ngroup),$
           fcov:fltarr(ngroup), fcov_err:fltarr(ngroup), $
           log_n: fltarr(nspeciesGal), log_n_err:fltarr(nspeciesGal), $
           log_n_MW: fltarr(nspeciesMW), log_n_MW_err:fltarr(nspeciesMW)}
  

  parinfo = replicate({value:0.D, fixed:0, limited:[0,0], tied:'', $
                      limits:[0.D,0.D]},nmodels+ 3*ngroup + nspeciesGal + nspeciesMW+2) ;nmodels = number of stellar continuum, 3 for LyB
  

  parinfo[0:nmodels-1].limited = [1,0]  ;This says that the light fraction for each continuum model is limited on the lower limit but not the upper limit
  parinfo[0:nmodels-1].limits = [0.0,0.0] ;Sets the lower limit to 0. Don't want negative light fractions
  parinfo[0:nmodels-1].value = options.light_arr ;This sets the starting value for the light fractions at .1 for all models
  parinfo[0:nmodels-1].fixed = options.fixstell ;This sets the starting value for the light fractions at .1 for all models
  
  ;Now the EBV parameter
  parinfo[nmodels:nmodels+1].value = options.ebv_coef ;Initial b-parameter guess.
  parinfo[nmodels:nmodels+1].fixed = options.fixebv ; We are not fixing the b-parameter 
  parinfo[nmodels:nmodels+1].limited = [1,1] ; The ebv-parameter is limited for both upper and lower limits
  parinfo[nmodels:nmodels+1].limits = [0, 2] ; The limits of the ebv value
  
  ;Now the b-parameters 
  parinfo[nmodels+2:nmodels+ngroup+1].value = options.b_val_arr;  ;Initial b-parameter guess.
  parinfo[nmodels+2:nmodels+ngroup+1].fixed = options.b_fix_arr ; We are not fixing the b-parameter 
  parinfo[nmodels+2:nmodels+ngroup+1].limited = [1,1] ; The b-parameter is limited for both upper and lower limits
  parinfo[nmodels+2:nmodels+ngroup+1].limits = [1, 700] ; The limits of the b-parameter. 20 km/s is roughly the spectral resolution

  ;Now the velocity parameters
  parinfo[nmodels+ngroup+2:nmodels+2*ngroup+1].value = options.v_val_arr ;initial velocity guess. This is the Si II velocity
  parinfo[nmodels+ngroup+2:nmodels+2*ngroup+1].fixed = options.v_fix_arr ;We are not fixing the velocities 
  parinfo[nmodels+ngroup+2:nmodels+2*ngroup+1].limited = [1,1] ;We are limiting both the upper and lower limits of the velocities 
  parinfo[nmodels+ngroup+2:nmodels+2*ngroup+1].limits = [-1000,1000] ;This the lower and upper limits for the velocity.

  ;Now the covering fraction parameters  
  parinfo[nmodels+2*ngroup+2:nmodels+3*ngroup+1].value = options.cf_val_arr ;Initial b-parameter guess.
  parinfo[nmodels+2*ngroup+2:nmodels+3*ngroup+1].fixed = options.cf_fix_arr; 
  parinfo[nmodels+2*ngroup+2:nmodels+3*ngroup+1].limited = [1,1] ;We are limiting both the upper and lower limits of the velocities 
  parinfo[nmodels+2*ngroup+2:nmodels+3*ngroup+1].limits =  [transpose(options.cf_lim_arr), transpose(dblarr(ngroup)+1)] ; The limits of the ebv value

  ;Now the column density 
  parinfo[nmodels+3*ngroup+2:nmodels+3*ngroup+nspeciesGal+1].value = options.log_n_val_arr ; initial column density guess. This is what we expect from fesc. 
  parinfo[nmodels+3*ngroup+2:nmodels+3*ngroup+nspeciesGal+1].fixed = options.log_n_fix_arr ;We are not fixing the column density
  parinfo[nmodels+3*ngroup+2:nmodels+3*ngroup+nspeciesGal+1].limited = [1,1] ; We are limiting both the upper and lower limits of the column density
  parinfo[nmodels+3*ngroup+2:nmodels+3*ngroup+nspeciesGal+1].limits = [transpose(dblarr(nspeciesGal)+1),transpose(options.log_n_lim_arr)] ; These are the lower and upper limits of the column density. It is a very broad range
  
  ;Now the MW  column density 
  parinfo[nmodels+3*ngroup+nspeciesGal+2:nmodels+3*ngroup+ nspeciesGal + nspeciesMW+1].value = 14. ; initial column density guess. This is what we expect from fesc. 
  parinfo[nmodels+3*ngroup+nspeciesGal+2:nmodels+3*ngroup+ nspeciesGal + nspeciesMW+1].fixed = 0  ;We are not fixing the column density
  parinfo[nmodels+3*ngroup+nspeciesGal+2:nmodels+3*ngroup+ nspeciesGal + nspeciesMW+1].limited = [1,1] ; We are limiting both the upper and lower limits of the column density
  parinfo[nmodels+3*ngroup+nspeciesGal+2:nmodels+3*ngroup+ nspeciesGal + nspeciesMW+1].limits = [1, 15] ; These are the lower and upper limits of the column density. It is a very broad range
  
  endelse
  
  ;-----------------------------------------------------------------------------
  ; Mask out bad data regions 
  
  npix = n_elements(restwl) ;number of wavelength pixels
  quality = fltarr(npix) + 1 ;A quality array where we will flag if the wavelength is good
  
  outside_model = where(restwl le min(model.wave) or restwl ge max(model.wave)) ;Flag wher ethe data is outside the model
  if outside_model[0] ne -1 then quality[outside_model] = 0 ;Set the quality array to 0 if the data is outside  the model
  
  bad = where(finite(flux) ne 1 or finite(err) ne 1 or err lt 1e-6) ;This finds any infinite flux or error points. 
  if bad[0] ne -1 then quality[bad] = 0 ;This removes any bad data.
  
  ok = where(quality eq 1)
  

  ;-----------------------------------------------------------------------------
  ; Convolve models to velocity dispersion of data and interpolate to
  ; match data
  
  s99_pix = 11.75 ; size of 1 model pixel in km/s 
  s99_vdisp = 58.0 ; approximate velocity dispersion of S99 models
   
  ;Deconvolve template instrumental resolution
  if vdisp lt s99_vdisp then vdisp_add = 0 $
  else vdisp_add = sqrt(vdisp^2 - s99_vdisp^2)  
  sigma_pix = vdisp_add / s99_pix
  
  custom_lib = dblarr(npix, nmodels)  ;create the array for the new models
  for ii = 0, nmodels - 1 do begin & $  
    ;Convolve and interpolate the models onto the data. 
    custom_lib[*,ii] = gconv(interpol(model.flux[*,ii], model.wave, restwl), sigma_pix)& $ 
  endfor
 
  ;-------------------------------------------------------------------------------
  ;Now we are actually going to run MPFIT
  fitcoefs = mpfitfun('s99_mcombine_o6', restwl[ok], flux[ok], err[ok], $
                       parinfo = parinfo, functargs = {options:options, mlib: custom_lib[ok, *], vdisp: vdisp}, $
                       perror=perror, niter=niter, status=status, /quiet, $
                       maxiter = 2000, errmsg = errmsg)
  print, 'CONTINUUM FIT ITERATIONS: ', strtrim(niter, 2)
  print, 'CONTINUUM_FIT EXIT STATUS: ', strtrim(status, 2)
  ;We want to make sure that the exit status is always 1

  coefs.light_frac = fitcoefs[0:nmodels-1]
  coefs.light_frac_err = perror[0:nmodels-1]
  coefs.ebv = fitcoefs[nmodels:nmodels+1]
  coefs.ebv_err = perror[nmodels:nmodels+1]
  
  if options.fitchoice ne 1 then begin
  coefs.b = fitcoefs[nmodels+2:nmodels+ngroup+1]
  coefs.b_err = perror[nmodels+2:nmodels+ngroup+1]
  coefs.v = fitcoefs[nmodels+ngroup+2:nmodels+2*ngroup+1]
  coefs.v_err = perror[nmodels+ngroup+2:nmodels+2*ngroup+1]
  coefs.fcov = fitcoefs[nmodels+2*ngroup+2:nmodels+3*ngroup+1]
  coefs.fcov_err = perror[nmodels+2*ngroup+2:nmodels+3*ngroup+1]
  coefs.log_n = fitcoefs[nmodels+3*ngroup+2:nmodels+3*ngroup+nspeciesGal+1]
  coefs.log_n_err = perror[nmodels+3*ngroup+2:nmodels+3*ngroup+nspeciesGal+1]
  coefs.log_n_MW = fitcoefs[nmodels+3*ngroup+nspeciesGal+2:nmodels+3*ngroup+ nspeciesGal + nspeciesMW+1]
  coefs.log_n_MW_err = perror[nmodels+3*ngroup+nspeciesGal+2:nmodels+3*ngroup+ nspeciesGal + nspeciesMW+1]
  endif

  custom_lib2 = dblarr(n_elements(allwave), nmodels)  ;create the array for the new models
  for ii = 0, nmodels - 1 do begin & $  
    ;Convolve and interpolate the models onto the data. 
    custom_lib2[*,ii] = gconv(interpol(model.flux[*,ii], model.wave, allwave),sigma_pix, /edge_wrap)& $ 
  endfor
  yfit = s99_mcombine_o6(allwave, fitcoefs, options=options,mlib=custom_lib2, vdisp=vdisp)
  ;Now we can return the fitted coefficients
  
  return, coefs


end
