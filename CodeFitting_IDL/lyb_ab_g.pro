function gconv, x, sigma, edge_wrap=edge_wrap, fwhm = fwhm
   ;; Convolve the x-vector with a Gaussian kernel - the kernel size
   ;; is set to 4 times the sigma of the Gaussian.

; x should be a float!!!

   if (n_elements(fwhm) gt 0) then $
    sigma = fwhm/2.3548

   ;; special case for no smoothing
   if sigma eq 0 then return, x

   binfactor=1
   ksize=round(4.0*sigma+1.0)*2
   xx = findgen(ksize)-ksize/2

   kernel=exp(-xx^2/(2*sigma^2))
   kernel=kernel/total(kernel)

   sm = convol(x, kernel, edge_wrap=edge_wrap)

   return, sm
end 



function lyb_ab_g,x, vout, b, log_n_h, vdisp=vdisp
;This program creates a Gaussian profile fitter.
;See Eq. 6.39 (page 59) and Eq. 9.10 (page 76) in Draine 2011 for details

cspeed = 2.99E5 ;speed of light

tau = 0. ;The initial Ly-Beta optical depth is zero. 
x0 = 1025.728*(vout/cspeed + 1.) ;This is the wavelength from line center in Angstroms
  tau = tau + .7580*(10^log_n_h/10.^13)*(.079142/.4164)*(1025.728/1215.7)*(10./b)*exp(-1.*((x-x0)/x0*cspeed)^2/b^2) ;Lyman-Beta's f = .079142, and wavelength = 1025.728
  flux = exp(-tau) ;This converts the optical depth to Flux units using the radiative transfer equation
  sigma_pixel = vdisp / ((x[1]-x[0])*cspeed/1025.728) & $  ; gaussian sigma of convolution kernel in pixels  
  cflux = gconv(flux, sigma_pixel, /edge_wrap) & $ ;Convolve to the resolution of the data.
  
return, cflux  
  
  
  
end