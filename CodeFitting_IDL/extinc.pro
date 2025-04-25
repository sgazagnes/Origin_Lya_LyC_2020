function extinc, wave, ebv, law

  x = 10000./wave
  ;idx = where(wave gt 1047.65 and wave lt 1047.67)
  
  if law EQ 1 then $ ; Calzetti lam > 0.12 microns
      klam = poly(x, [-1.687, 4.009, -0.527, 0.030])
      
  if law EQ 2 then $ ; Leitherer
      ;klam = poly(x, [1.035, 0.142, -1.953d-3, 5.5d-4])
      klam = poly(x, [5.472, 0.671, -9.218d-3, 2.62d-3])
      
  if law EQ 3 then $ ; Calzetti polyfit
      klam = poly(x, [4.126, 0.931])
      
  if law EQ 4 then $ Reddy polyfit
      klam = poly(x, [2.191, 0.974])
      
  if law EQ 5 then begin ; 
      wv = [1000,1050,1111,1180,1250,1390,1490,1600,1700,1800,1900,2000,2100,2190,2300,2400,2500,2740,3440,4000,4400,5500,7000,9000] 
      ;xum = [1d-9 , 0.455,0.606,0.800,1.235,1.538,1.818,2.273,2.703,3.375,3.625,3.875,4.125,4.375,4.625,4.875,5.125,5.375,5.625,5.875,6.125,6.375,6.625,6.875,7.125,7.375,7.625,7.875,8.125,8.375,8.625]
      val = [8.06452 , 7.3871 , 6.77419 ,6.12903 ,5.64516, 4.67742 ,4.12903 ,3.87097 ,3.64516, 3.41936, 3.22581 ,2.96774, 2.83871 ,2.74194 ,2.58065, 2.41935 ,2.25806 ,2.09677 ,1.58065, 1.41935, 1.32258, 1 ,0.748387 , 0.483871] 
     ; valxum = [0.000,0.016,0.169,0.131,0.567,0.801,1.00,1.374,1.672,2.000,2.220,2.428,2.661,2.947,3.161,3.293,3.489,3.637,3.866,4.013,4.243,4.472,4.776,5.00,5.272,5.575,5.795,6.074,6.297,6.436,6.992]
      klam =  interpol(val, wv, wave)*2.72
      ;klam = interpol(valxum, xum, x)*2.72
      endif
      
  flaw = 10.0^(-0.4*klam*ebv)   
  ;fred = flux*flaw  
  return, flaw
  
end

function eval, x, data, yfit, err, nbparams, reg
chi2 = total((yfit[reg]- data[reg])^2/err[reg]^2)/(nbparams+n_elements(yfit[reg]))
return, chi2
end

function AbsSpec, x, data, err, models, light_array, ebv, law, vdisp
nmodels = n_elements(models.age)
npix = n_elements(x)
custom_lib = dblarr(npix, nmodels)
nlib = n_elements(models.flux[0,*])
;stellarspec =  0
quality = fltarr(npix) + 1 ;A quality array where we will flag if the wavelength is good
;data[where(data lt 0)] = 0

;outside_model = where(x le min(models.wave) or x ge max(models.wave)) ;Flag wher ethe data is outside the model
;if outside_model[0] ne -1 then quality[outside_model] = 0 ;Set the quality array to 0 if the data is outside  the model
;
;bad = where(finite(data) ne 1 or finite(err) ne 1 or err lt 1e-6) ;This finds any infinite flux or error points. 
;if bad[0] ne -1 then quality[bad] = 0 ;This removes any bad data.
;
;ok = where(quality eq 1)

s99_pix = 11.75 ; size of 1 model pixel in km/s 
s99_vdisp = 58.0 ; approximate velocity dispersion of S99 models
if vdisp lt s99_vdisp then vdisp_add = 0 $
else vdisp_add = sqrt(vdisp^2 - s99_vdisp^2)  
sigma_pix = vdisp_add / s99_pix

for ii = 0, nmodels - 1 do begin & $  
  ;Convolve and interpolate the models onto the data. 
  custom_lib[*,ii] = gconv(interpol(models.flux[*,ii], models.wave, x), sigma_pix)& $ 
endfor 
    
y = double(custom_lib[*,*]) # double(light_array[0:nlib-1])
  
;for ii = 0, nmodels - 1 do begin & $  
;  ;Convolve and interpolate the models onto the data. 
;  stellarspec = stellarspec + custom_lib[ok,ii]*light_array[ii]& $ 
;endfor
ydust = extinc(x, ebv[0], law)
yred = ydust * y
yred[where(finite(yred) eq 0)] = 0
flux_tmp =data[where(yred ne 0)]/yred[where(yred ne 0)]
err_tmp = err[where(yred ne 0)]/yred[where(yred ne 0)]


MISspec = {name:'Absspec', wave: fltarr(npix), flux:fltarr(npix), err:fltarr(npix)}
MISspec.wave = x
;MISspec.flux = smooth(data[where(yred ne 0)]/yred[where(yred ne 0)],2)
MISspec.flux = interpol(flux_tmp, x[where(yred ne 0)], x)
MISspec.flux[where(finite(MISspec.flux) eq 0)] = 0
;Misspec.err = err[where(yred ne 0)]/yred[where(yred ne 0)]
Misspec.err =interpol(err_tmp, x[where(yred ne 0)], x)
return, MISspec
end