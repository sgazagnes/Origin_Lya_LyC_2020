;This function creates the linear combination and LyB fit to the data. 
;It is called by MPFIT, and you need to give it: 1) x: the wavelength array
; 2) a: the array of all the coefficients 3) mlib: this is the stellar continuum model library
; 4) the velocity dispersion of the spectra.

function s99_mcombine_o6, x, a, options=options, mlib=mlib, vdisp=vdisp
      
    nlib = n_elements(mlib[0,*]) ;number of stellar continuum models
    ebv_coef = a[nlib:nlib+1]  

    y = double(mlib) # a[0:nlib-1] ;This creates the linear combination of the stellar continuum
    ;y = double(mlib[*,4])*a[4] + double(mlib[*,3])*a[3]+ double(mlib[*,5])*a[5];
    
    ydust_stell = extinc(x, ebv_coef[0], options.ebv)
    ydust_holes = extinc(x, ebv_coef[1], options.ebv)    


    if options.fitchoice eq 3 then spec = 1. 
    if options.fitchoice eq 1 then spec = y * ydust_stell 
    if options.fitchoice eq 2 then spec = y  
    
    if (options.fitChoice ne 1) then begin
           
      cspeed = 2.99e5;speed of light
      z = options.z
      ngroup = options.ngroup
      nspeciesGal = options.nspeciesGal
      nspeciesMW = options.nspeciesMW
      if nspeciesMW eq 0 then nspeciesMW = 1
      lines = options.lines
      nlines = n_elements(lines.wave)
      group_arr = options.group_arr
      index_arr = options.index_arr
      index_MW_arr = options.index_MW_arr

       ;The guess of the LyB velocity 
      b_coefs = a[nlib+2:nlib+ngroup+1]
      v_coefs = a[nlib+ngroup+2: nlib+1+2*ngroup]
      f_coefs = a[nlib+2*ngroup+2:  nlib+1+3*ngroup]
      log_n_coefs = a[nlib+3*ngroup+2:  nlib+1+3*ngroup+nspeciesGal]
     if nspeciesMW ne 0 then log_n_MW_coefs = a[nlib+3*ngroup+nspeciesGal+2:nlib+3*ngroup+ nspeciesGal + nspeciesMW+1]


    if options.dust_model ne 0 then begin
      gas_flux = fltarr(n_elements(x))
      holes_flux =fltarr(n_elements(x))+ 1
      MW_flux = fltarr(n_elements(x))+1
      line_h = 1
      line_ot = 1
      jj = 0
      fcov = 1

    for ii =0, n_elements(lines.wave)-1 do begin
      if index_arr[ii] ne 0 then begin
      if (lines.species[ii] eq 'HI') then begin
          line_h = line_h* lyb_ab_t(x, v_coefs[group_arr[ii]], b_coefs[group_arr[ii]], log_n_coefs[index_arr[ii]-1], lines.wave[ii], lines.f[ii],lines.A[ii], f_coefs[group_arr[ii]], vdisp=vdisp) ;This calls an ancilary functneut to generate the LyB profile
          fcov = f_coefs[group_arr[ii]]
          continue
      endif else begin
        line_ot = line_ot * lyb_ab_t(x, v_coefs[group_arr[ii]], b_coefs[group_arr[ii]], log_n_coefs[index_arr[ii]-1], lines.wave[ii], lines.f[ii],lines.A[ii], f_coefs[group_arr[ii]], vdisp=vdisp) ;This calls an ancilary functneut to generate the LyB profile
      endelse   
      endif
      if index_MW_arr[ii] ne 0 and options.MW eq 1 then begin
      line = lyb_ab_t(x, 0, vdisp, log_n_MW_coefs[index_MW_arr[ii]-1], lines.wave[ii]/(1+z), lines.f[ii],lines.A[ii], 1.,  vdisp=vdisp)  
      MW_flux = MW_flux * line
     ;  spec = spec * lyb_ab(x, 0, vdisp, log_n_MW_coefs[index_MW_arr[ii]-1], lines.wave[ii]/(1+z), lines.f[ii],lines.A[ii], 1., vdisp=vdisp)     
     endif   
    endfor
    
    if options.dust_model eq 0 then ydust_holes = ydust_stell
    if options.dust_model eq 1 then ydust_holes = 1 
    spec = spec*(fcov*line_h)*line_ot*ydust_stell + spec*(1-fcov)*line_ot*ydust_holes
    spec = spec * MW_flux
    endif else begin
  
    for ii =0, n_elements(lines.wave)-1 do begin
      if index_arr[ii] ne 0 then begin
        spec = spec * lyb_ab(x, v_coefs[group_arr[ii]], b_coefs[group_arr[ii]], log_n_coefs[index_arr[ii]-1], lines.wave[ii], lines.f[ii],lines.A[ii], f_coefs[group_arr[ii]], vdisp=vdisp) ;This calls an ancilary functneut to generate the LyB profile
      endif 
      if index_MW_arr[ii] ne 0 and options.MW eq 1 then begin
        spec = spec * lyb_ab(x, 0, vdisp, log_n_MW_coefs[index_MW_arr[ii]-1], lines.wave[ii]/(1+z), lines.f[ii],lines.A[ii], 1., vdisp=vdisp)
      endif
    endfor
    spec = spec * ydust_stell
   endelse
endif
 
   return, spec

end
