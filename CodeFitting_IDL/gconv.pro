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

