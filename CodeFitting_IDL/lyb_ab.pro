;This function creates a Voigt Profile for the LyB line. It requires
; two ancillary functions sigma_line and gconv


function sigma_line,lambda,f,gamma,b_km,wave=wave

;+
;this program computes the absorption cross section line profile for a
;given transition
;-

c   = 2.997925d10 ; in cgs units
lam = lambda*1.d-8

nu  = c/lam

dnu = nu/c*b_km*1.d5

a   = gamma/(4.*!pi*dnu)

if (not keyword_set(wave)) then begin
    print,'Computing wavelength grid...'
    lmin   = lam-c/nu^2*(sqrt(2.654e-2*f*gamma*nu/c)*5d-4+10.*dnu)
    lmax   = lam+c/nu^2*(sqrt(2.654e-2*f*gamma*nu/c)*5d-4+10.*dnu)
    bin    = 0.0005d-8            
    ;lams   = wavegrid(lmin,lmax,bin,/double)
endif else begin
    lams   = wave*1.d-8
endelse

freq = c/lams
u    = abs(freq-nu)/dnu
h    = voigt(a,u)
sig  = 2.654e-2*f*h/dnu/sqrt(!pi)

out  = [[lams*1.d8],[sig]]

return,out

end

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
;
;function lyb_ab,x, vout, b, log_n, wave0, f, A, fcov, vdisp=vdisp
;  ;This program creates a Voigt profile fitter.
;
;  cspeed = 2.99E5 ;speed of light
;
;  tau = 0. ;The initial Ly-Beta optical depth is zero.
;
;  x0 = wave0*(vout/cspeed + 1.) ;This is the wavelength from line center in Angstroms
;  tau_line = sigma_line(x0, f, A, b, wave = x) ;This calls a function which calculates the line profile using the f-value and Einstein A coefficient of Ly-B
;  N_line = 10.D^log_n ;need column density in normal units
;  tau = tau + (N_line * tau_line[*,1]) ;calculate the optical depth of the line profile
;  flux = (1-fcov) + fcov*exp(-tau) ;This converts the optical depth to Flux units using the radiative transfer equation
;  ;if (reddy eq 1) then flux = fcov*exp(-tau) +  (1-fcov)/extinc(x0,fcov,ebv,4)
;  sigma_pixel = vdisp / ((x[1]-x[0])*cspeed/wave0) & $  ; gaussian sigma of convolution kernel in pixels
;    cflux = gconv(flux, sigma_pixel, /edge_wrap) & $ ;Convolve to the resolution of the data.
;
;    return, cflux



function lyb_ab_t,x, vout, b, log_n, wave0, f, A, fcov, vdisp=vdisp
;This program creates a Voigt profile fitter.

cspeed = 2.99E5 ;speed of light

tau = 0. ;The initial Ly-Beta optical depth is zero. 

x0 = wave0*(vout/cspeed + 1.) ;This is the wavelength from line center in Angstroms
  tau_line = sigma_line(x0, f, A, b, wave = x) ;This calls a function which calculates the line profile using the f-value and Einstein A coefficient of Ly-B
  N_line = 10.D^log_n ;need column density in normal units
  tau = tau + (N_line * tau_line[*,1]) ;calculate the optical depth of the line profile
  gflux = exp(-tau) ;This converts the optical depth to Flux units using the radiative transfer equation
  ;if (reddy eq 1) then flux = fcov*exp(-tau) +  (1-fcov)/extinc(x0,fcov,ebv,4)
  sigma_pixel = vdisp / ((x[1]-x[0])*cspeed/wave0) & $  ; gaussian sigma of convolution kernel in pixels  
  cgflux = gconv(gflux, sigma_pixel, /edge_wrap) & $ ;Convolve to the resolution of the data.
  ;chflux =  fltarr(n_elements(cgflux))+(1-fcov) & $ ;Convolve to the resolution of the data.
return, cgflux;, [chflux]]  
end

function lyb_ab,x, vout, b, log_n, wave0, f, A, fcov, vdisp=vdisp
  ;This program creates a Voigt profile fitter.

  cspeed = 2.99E5 ;speed of light

  tau = 0. ;The initial Ly-Beta optical depth is zero.

  x0 = wave0*(vout/cspeed + 1.) ;This is the wavelength from line center in Angstroms
  tau_line = sigma_line(x0, f, A, b, wave = x) ;This calls a function which calculates the line profile using the f-value and Einstein A coefficient of Ly-B
  N_line = 10.D^log_n ;need column density in normal units
  tau = tau + (N_line * tau_line[*,1]) ;calculate the optical depth of the line profile
  gflux = fcov*exp(-tau) +1-fcov ;This converts the optical depth to Flux units using the radiative transfer equation
  ;if (reddy eq 1) then flux = fcov*exp(-tau) +  (1-fcov)/extinc(x0,fcov,ebv,4)
  sigma_pixel = vdisp / ((x[1]-x[0])*cspeed/wave0) & $  ; gaussian sigma of convolution kernel in pixels
  cflux = gconv(gflux, sigma_pixel, /edge_wrap) & $ ;Convolve to the resolution of the data.
  return, cflux;, [chflux]]
end