pro plotfit, s, params_out, plotreg, vdisp, disp_fit, disp_ly, disp_ot 
  
  z = s.z
  yfit = params_out.fit
  if tag_exist( params_out, 'b') then b_coefs = params_out.b
  if tag_exist( params_out, 'v') then v_coefs = params_out.v
  if tag_exist( params_out, 'f') then f_coefs = params_out.fcov
  if tag_exist( params_out, 'log_n') then log_n_coefs = params_out.log_n
  if tag_exist( params_out, 'log_n_MW') then log_n_MW_coefs = params_out.log_n_MW
  if tag_exist( params_out, 'lines') then lines = params_out.lines
  
 !p.font = 0 ;This makes the fonts look better
  plot, s.wave,s.flux, yr = [0, 2], xr = plotreg, /xs;, psym = 10;, xtitle = 'Wavelength (A)', ytitle = 'Normalized Flux', charsize = 1.5, charthick = 4
  djs_oplot, s.wave, s.err, color = 'green', thick = 2 ;this is the error on the flux
  
  if disp_fit eq 1 then begin
  djs_oplot, s.wave, yfit, color = 'red', thick = 8; this is the stellar continuum fit
  endif


  if disp_ly eq 1 then begin
  for ii =0, n_elements(lines.wave)-1 do begin
      if (lines.index_arr[ii] ne 0) and (lines.species[ii] eq 'HI') then begin
        line =  lyb_ab(s.wave, v_coefs[lines.group_arr[ii]], b_coefs[lines.group_arr[ii]], log_n_coefs[lines.index_arr[ii]-1], $
        lines.wave[ii], lines.f[ii],lines.A[ii], f_coefs[lines.group_arr[ii]], vdisp=vdisp) ;This calls an ancilary functneut to generate the LyB profile   
        djs_oplot, s.wave, line, color = 'blue', thick = 4; 
       ; djs_oplot, [lines.wave[ii], lines.wave[ii]], [1.5,1.39], color = 'blue'
       ; legend, [lines.species[ii]], POSITION = [lines.wave[ii],1.37],/data, textcolors =djs_icolor('blue'),box = 0
      endif
 endfor
  endif 
  
   if disp_ot eq 1 then begin
  for ii =0, n_elements(lines.wave)-1 do begin
      if (lines.index_arr[ii] ne 0) and (lines.species[ii] ne 'HI') then begin
        line =  lyb_ab(s.wave, v_coefs[lines.group_arr[ii]], b_coefs[lines.group_arr[ii]], log_n_coefs[lines.index_arr[ii]-1], $
        lines.wave[ii], lines.f[ii],lines.A[ii], f_coefs[lines.group_arr[ii]],vdisp=vdisp) ;This calls an ancilary functneut to generate the LyB profile   
        djs_oplot, s.wave, line, color = 'orange', thick = 4; 
       ; djs_oplot, [lines.wave[ii], lines.wave[ii]], [1.5,1.34], color = 'orange'
       ; legend, [lines.species[ii]], POSITION = [lines.wave[ii],1.29],/data, textcolors =djs_icolor('orange'),box = 0
      endif
 endfor
; 
   for ii =0, n_elements(lines.wave)-1 do begin
      if (lines.index_MW_arr[ii] ne 0) then begin
        line =  lyb_ab(s.wave, -20, 50, log_n_MW_coefs[lines.index_MW_arr[ii]-1], $
        lines.wave[ii]/(1+s.z), lines.f[ii],lines.A[ii], 1., vdisp=vdisp) ;This calls an ancilary functneut to generate the LyB profile   
        djs_oplot, s.wave, line, color = 'orange', linestyle = 2, thick = 4; 
        djs_oplot, [lines.wave[ii]/(1+s.z), lines.wave[ii]/(1+s.z)], [1.5,1.29], linestyle = 2, color = 'orange'
;        legend, ['MW '+lines.species[ii]], POSITION = [lines.wave[ii]/(1+s.z)-1,1.27],/data, textcolors =djs_icolor('orange'),box = 0
      endif
 endfor
  endif 
;  

end
 