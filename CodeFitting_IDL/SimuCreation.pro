; 
 models = mrdfits('Models/models.fits', 1)
nmodels = n_elements(models.age)
for ii = 0, nmodels - 1 do begin & $  
    models.flux[*,ii] = models.flux[*,ii]/median(models.flux[where(models.wave gt 1047 and models.wave lt 1050),ii]) & $ 
endfor

vres=50
vdisp =vres/2.3548

x = (FINDGEN(7500)/50)+910
y = dblarr(7500)
;y = interpol(models.flux[*,2], models.wave, x)

  s99_pix = 11.75 ; size of 1 model pixel in km/s 
  s99_vdisp = 58.0 ; approximate velocity dispersion of S99 models
   
  ;Deconvolve template instrumental resolution
  if vdisp lt s99_vdisp then vdisp_add = 0 $
  else vdisp_add = sqrt(vdisp^2 - s99_vdisp^2)  
  sigma_pix = vdisp_add / s99_pix
  
 ;custom_lib = dblarr(2800)  ;create the array for the new models
 
 y = gconv(interpol(models.flux[*,2], models.wave, x), sigma_pix)

 dens =17.57
 cf = 0.9
;y = y[where(s.wave gt 910)]
;x = s.wave[where(s.wave gt 910)]
;ynoise =y + .2*randomn(seed, n_elements(x))

; 
lyb_dens10 = lyb_ab(x, 0, 50, dens, 1025.728, .079142, 5.5751d7, 1, vdisp=vdisp) ;This calls an ancilary function to generate the LyB profile
lyg_dens10 = lyb_ab(x, 0, 50, dens, 972.517, 0.029006, 1.2785d7, 1, vdisp=vdisp) ; LyG profile
lyd_dens10 = lyb_ab(x, 0, 50, dens, 949.742, .013945, 4.125d6, 1, vdisp=vdisp) ; LyG profile
ly5_dens10 = lyb_ab(x,0, 50, dens, 937.814, 0.0078035, 1.644d6, 1, vdisp=vdisp) ; LyG profile
ly6_dens10 = lyb_ab(x, 0, 50, dens, 930.751, 0.0048164, 7.5684d5,1, vdisp=vdisp) ; LyG profile
ly7_dens10 = lyb_ab(x, 0, 50, dens, 926.249, 0.0031850, 3.8694d5, 1, vdisp=vdisp) ; LyG profile
ly8_dens10 = lyb_ab(x, 0, 50, dens, 923.148, 0.0022172, 2.1425d5, 1, vdisp=vdisp) ; LyG profile
ly9_dens10 = lyb_ab(x, 0, 50, dens, 920.947, 0.0016062, 1.2631d5, 1, vdisp=vdisp)

lyb_cf10 = lyb_ab(x, 0, 50, 20, 1025.728, .079142, 5.5751d7, cf, vdisp=vdisp) ;This calls an ancilary function to generate the LyB profile
lyg_cf10 = lyb_ab(x, 0, 50, 20, 972.517, 0.029006, 1.2785d7, cf, vdisp=vdisp) ; LyG profile
lyd_cf10 = lyb_ab(x, 0, 50, 20, 949.742, .013945, 4.125d6, cf, vdisp=vdisp) ; LyG profile
ly5_cf10 = lyb_ab(x,0, 50, 20, 937.814, 0.0078035, 1.644d6, cf, vdisp=vdisp) ; LyG profile
ly6_cf10 = lyb_ab(x, 0, 50, 20, 930.751, 0.0048164, 7.5684d5,cf, vdisp=vdisp) ; LyG profile
ly7_cf10 = lyb_ab(x, 0, 50, 20, 926.249, 0.0031850, 3.8694d5, cf, vdisp=vdisp) ; LyG profile
ly8_cf10 = lyb_ab(x, 0, 50, 20, 923.148, 0.0022172, 2.1425d5, cf, vdisp=vdisp) ; LyG profile
ly9_cf10 = lyb_ab(x, 0, 50, 20, 920.947, 0.0016062, 1.2631d5, cf, vdisp=vdisp)

 o1j924 = lyb_ab(x,0,75,16, 924.950, .0013, 7.22d6, 1,vdisp=vdisp); O I 976
 o1j929 = lyb_ab(x,0,75,16, 929.517, .00192, 1.06d7, 1,vdisp=vdisp); O I 976
 o1j930 = lyb_ab(x,0,75,16, 930.257, .000537, 6.9d6, 1,vdisp=vdisp); O I 976
 o1j936 = lyb_ab(x,0,75,16, 936.629, .00306, 1.66d7, 1,vdisp=vdisp); O I 976
 o1j948 = lyb_ab(x,0,75,16, 948.686, .00531, 2.81d7, 1,vdisp=vdisp); O I 976
 o1j950 = lyb_ab(x,0,75,16, 950.885, .00158, 1.94d7, 1,vdisp=vdisp); O I 976
 o1j971 = lyb_ab(x,0,75,16, 971.738, .0116, 5.85d7, 1,vdisp=vdisp); O I 976
 o1j976 = lyb_ab(x,0,75,16, 976.448, .00331, 3.86d7, 1,vdisp=vdisp); O I 976
 o1j988a = lyb_ab(x,0,75,16, 988.578, .000569, 6.47d6, 1,vdisp=vdisp); O I 976
 o1j988b = lyb_ab(x,0,75,16, 988.655, .00846, 5.77d7, 1,vdisp=vdisp); O I 976
 o1j988 = lyb_ab(x,0,75,16, 988.773, .0464, 2.26d8, 1,vdisp=vdisp); O I 976
 o1j1025 = lyb_ab(x,0,75,16, 1025.762, .0169, 7.66d7, 1,vdisp=vdisp); O I 976
 o1j1039 = lyb_ab(x,0,75,16, 1039.230, 0.00916, 9.43d7, 1,vdisp=vdisp) ; O I 1039 profile
  
 o6j1031 = lyb_ab(x,0.,100,15., 1031.912, 0.133, 4.16d8, 1,vdisp=vdisp) ; O VI 1031 profile
 o6j1037 = lyb_ab(x,0.,100,15., 1037.613, 0.066, 4.09d8, 1,vdisp=vdisp) ; O VI 1037 profile
 c2j1036 = lyb_ab(x,0.,80,15.5, 1036.337, 0.119, 7.38d8, 1,vdisp=vdisp) ; C II 1036 profile
  
olines = o1j924*o1j929*o1j930*o1j936*o1j948*o1j950*o1j971*o1j976*o1j988a*o1j988b*o1j988*o1j1025*o1j1039*o6j1031*o6j1037*c2j1036


GTcf= y*lyb_cf10*lyg_cf10*lyd_cf10*ly5_cf10*ly6_cf10*ly7_cf10*ly8_cf10 *ly9_cf10* olines
GTdens = y*lyb_dens10*lyg_dens10*lyd_dens10*ly5_dens10*ly6_dens10*ly7_dens10*ly8_dens10 *ly9_dens10* olines


Noisecf10SN1 =[]
Noisecf10SN2 =[]
Noisecf10SN3 =[]
Noisecf10SN4 =[]
Noisecf10SN5 = []
Noisecf10SN6 =[]
Noisecf10SN7 = []
Noisecf10SN8 =[]
Noisecf10SN9 =[]
Noisecf10SN10 = []
;Noisedens10SN5 = []
;Noisedens10SN7 = []
;Noisedens10SN2 =[]
;Noisedens10SN10 = []
;Noisecf10SN20 = []
;Noisedens10SN20 = []
;Noisecf10SN30 = []
;Noisedens10SN30 = []
;Noisecf10SN40 = []
;Noisedens10SN40 = []
;Noisecf10SN50 = []
;Noisedens10SN50 = []

for ii = 0, 49 do begin & $

noise1 = randomn(seed, n_elements(x)) & $
noise2 = .5*randomn(seed, n_elements(x)) & $
noise3 = .33*randomn(seed, n_elements(x)) & $
noise4 = .25*randomn(seed, n_elements(x)) & $
noise5 = .2*randomn(seed, n_elements(x)) & $
noise6 = .167*randomn(seed, n_elements(x)) & $
noise7 = .143*randomn(seed, n_elements(x)) & $
noise8 = .125*randomn(seed, n_elements(x)) & $
noise9 = .111*randomn(seed, n_elements(x)) & $
noise10 = .1*randomn(seed, n_elements(x)) & $
;noise20 = 0.05*randomn(seed, n_elements(x)) & $
;noise30 = (1/30.)*randomn(seed, n_elements(x)) & $
;noise40 = 0.025*randomn(seed, n_elements(x)) & $
;noise50 = 0.02*randomn(seed, n_elements(x)) & $

fitcfSN1 = GTcf+ noise1 & $
fitcfSN2 = GTcf+ noise2 & $
fitcfSN3 = GTcf+ noise3 & $
fitcfSN4 = GTcf+ noise4 & $
fitcfSN5 = GTcf+ noise5 & $
fitcfSN6 = GTcf+ noise6 & $
fitcfSN8 = GTcf+ noise8 & $
fitcfSN7 = GTcf+ noise7 & $
fitcfSN9 = GTcf+ noise9 & $
fitcfSN10 = GTcf+ noise10 & $
;fitcfSN20 = GTcf+ noise20 & $
;fitcfSN30 = GTcf+ noise30 & $
;fitcfSN40 = GTcf+ noise40 & $
;fitcfSN50 = GTcf+ noise50 & $

;fitdensSN2 = GTdens+ noise2 & $
;fitdensSN5 = GTdens+ noise5 & $
;fitdensSN10 = GTdens+ noise10 & $
;fitdensSN20 = GTdens+ noise20 & $
;fitdensSN30 = GTdens+ noise30 & $
;fitdensSN40 = GTdens+ noise40 & $
;fitdensSN50 = GTdens+ noise50 & $

Noisecf10SN1 = [[noisecf10SN1], [fitcfSN1]] & $
Noisecf10SN2 = [[noisecf10SN2], [fitcfSN2]] & $
Noisecf10SN3 = [[noisecf10SN3], [fitcfSN3]] & $
Noisecf10SN4 = [[noisecf10SN4], [fitcfSN4]] & $
;Noisedens10SN2 = [[noisedens10SN2], [fitdensSN2]] & $
Noisecf10SN5 = [[noisecf10SN5], [fitcfSN5]] & $
Noisecf10SN6 = [[noisecf10SN6], [fitcfSN6]] & $
;Noisedens10SN5 = [[noisedens10SN5], [fitdensSN5]] & $
Noisecf10SN10 = [[noisecf10SN10], [fitcfSN10]] & $
;Noisedens10SN10 = [[noisedens10SN10], [fitdensSN10]] & $
Noisecf10SN7 = [[noisecf10SN7], [fitcfSN7]] & $
Noisecf10SN8 = [[noisecf10SN8], [fitcfSN8]] & $
Noisecf10SN9 = [[noisecf10SN9], [fitcfSN9]] & $
;Noisecf10SN20 = [[Noisecf10SN20], [fitcfSN20]] & $
;Noisedens10SN20 = [[noisedens10SN20], [fitdensSN20]] & $
;Noisecf10SN30 = [[Noisecf10SN30], [fitcfSN30]] & $
;Noisedens10SN30 = [[noisedens10SN30], [fitdensSN30]] & $
;Noisecf10SN40 = [[Noisecf10SN40], [fitcfSN40]] & $
;Noisedens10SN40 = [[noisedens10SN40], [fitdensSN40]] & $
;Noisecf10SN50 = [[noisecf10SN50], [fitcfSN50]] & $
;Noisedens10SN50 = [[noisedens10SN50], [fitdensSN50]] & $


endfor

tosave = {name:'Cf10vres'+string(vres), wave:x, groundcf:GTcf, grounddens: GTdens,$
  noisecfSN1 : Noisecf10SN1, noisecfSN2 : Noisecf10SN2, noisecfSN3 : Noisecf10SN3, noisecfSN4 : Noisecf10SN4, noisecfSN5 : Noisecf10SN5,noisecfSN6 : Noisecf10SN6, noisecfSN7 : Noisecf10SN7,noisecfSN8 : Noisecf10SN8,noisecfSN9 : Noisecf10SN9,noisecfSN10: Noisecf10SN10};,noisecfSN20: Noisecf10SN20,noisecfSN30: Noisecf10SN30,noisecfSN40: Noisecf10SN40,noisecfSN50: Noisecf10SN50,$
;NoisedensSN2:Noisedens10SN2,NoisedensSN5:Noisedens10SN5, NoisedensSN10:Noisedens10SN10,NoisedensSN20:Noisedens10SN20,NoisedensSN30:Noisedens10SN30,NoisedensSN40:Noisedens10SN40,NoisedensSN50:Noisedens10SN50}

mwrfits, tosave, 'SimuJWST/Simucf10vres150.fits'
end