pro savefit, s, yfit, cont_params, good_reg, plotreg, vdisp, plotchoice, lineIndic,savechoice,  suf

if savechoice eq 0 then begin

  
  dfpsplot, suf + '.ps', /landscape, /color
  plotfit,  s,  yfit, cont_params, good_reg, plotreg, vdisp, s.z, plotchoice,lineIndic
  dfpsclose

endif

if savechoice eq 1 then begin
  
  
  
  dfpsplot, 'Specpart1' + suf + '.ps', /landscape, /color
  plotfit,  s,  fltarr(n_elements(s.wave))-1, cont_params, good_reg, [900,980], vdisp, s.z, 1,1
  dfpsclose
  dfpsplot, 'Specpart2' + suf + '.ps', /landscape, /color
  plotfit,  s,  fltarr(n_elements(s.wave))-1, cont_params, good_reg, [980,1060], vdisp, s.z, 1,1
    dfpsclose
  dfpsplot, 'SpecZpart3' + suf + '.ps', /landscape, /color
  plotfit,  s,  fltarr(n_elements(s.wave))-1, cont_params, good_reg, [1060,1140], vdisp, s.z, 1,1
  dfpsclose
; 
  dfpsplot, 'SpecLyd' + suf + '.ps', /landscape, /color
  plotfit,  s, fltarr(n_elements(s.wave))-1, cont_params, good_reg, [915,955], vdisp, s.z, 1,1
  dfpsclose
   dfpsplot, 'SpecLyb' + suf + '.ps', /landscape, /color
  plotfit,  s,  fltarr(n_elements(s.wave))-1, cont_params, good_reg, [1020,1040], vdisp, s.z, 1,1
  dfpsclose

  
  endif 
  
if savechoice eq 2 then begin
  ; Saving fits
  dfpsplot, 'Fitpart1' + suf + '.ps', /landscape, /color
  plotfit,  CREATE_STRUCT('wave', s.wave, 'flux', fltarr(n_elements(s.wave))-1, 'err', fltarr(n_elements(s.wave))-1),$
  yfit, cont_params, good_reg, [900,980], vdisp, s.z, 1,0
  dfpsclose
  dfpsplot, 'Fitpart2' + suf + '.ps', /landscape, /color
  plotfit,  CREATE_STRUCT('wave', s.wave, 'flux', fltarr(n_elements(s.wave))-1, 'err', fltarr(n_elements(s.wave))-1),$
  yfit, cont_params, good_reg, [980,1060], vdisp, s.z, 1,0
  dfpsclose
  dfpsplot, 'Fitpart3' + suf + '.ps', /landscape, /color
  plotfit, CREATE_STRUCT('wave', s.wave, 'flux', fltarr(n_elements(s.wave))-1, 'err', fltarr(n_elements(s.wave))-1),$
  yfit, cont_params, good_reg, [1060,1140], vdisp, s.z, 1,0
  dfpsclose
; 
  dfpsplot, 'FitLyd' + suf + '.ps', /landscape, /color
  plotfit,  CREATE_STRUCT('wave', s.wave, 'flux', fltarr(n_elements(s.wave))-1, 'err', fltarr(n_elements(s.wave))-1),$
  yfit, cont_params, good_reg, [915,955], vdisp, s.z, 1,0
  dfpsclose
   dfpsplot, 'FitLyb' + suf + '.ps', /landscape, /color
  plotfit,  CREATE_STRUCT('wave', s.wave, 'flux', fltarr(n_elements(s.wave))-1, 'err', fltarr(n_elements(s.wave))-1),$
  yfit,  cont_params, good_reg, [1020,1040], vdisp, s.z, 1,0
  dfpsclose
   
   ; saving Lyb
   
  dfpsplot, 'Lypart1' + suf + '.ps', /landscape, /color
  plotfit,  CREATE_STRUCT('wave', s.wave, 'flux', fltarr(n_elements(s.wave))-1, 'err', fltarr(n_elements(s.wave))-1),$
   fltarr(n_elements(s.wave))-1, cont_params, good_reg, [900,980], vdisp, s.z, 2,0
  dfpsclose
  dfpsplot, 'Lypart2' + suf + '.ps', /landscape, /color
  plotfit,  CREATE_STRUCT('wave', s.wave, 'flux', fltarr(n_elements(s.wave))-1, 'err', fltarr(n_elements(s.wave))-1),$
   fltarr(n_elements(s.wave))-1, cont_params, good_reg, [980,1060], vdisp, s.z, 2,0
  dfpsclose
  dfpsplot, 'Lypart3' + suf + '.ps', /landscape, /color
  plotfit, CREATE_STRUCT('wave', s.wave, 'flux', fltarr(n_elements(s.wave))-1, 'err', fltarr(n_elements(s.wave))-1),$
   fltarr(n_elements(s.wave))-1, cont_params, good_reg, [1060,1140], vdisp, s.z, 2,0
  dfpsclose
; 
  dfpsplot, 'LypartLyd' + suf + '.ps', /landscape, /color
  plotfit,  CREATE_STRUCT('wave', s.wave, 'flux', fltarr(n_elements(s.wave))-1, 'err', fltarr(n_elements(s.wave))-1),$
   fltarr(n_elements(s.wave))-1, cont_params, good_reg, [915,955], vdisp, s.z, 2,0
  dfpsclose
   dfpsplot, 'LypartLyb' + suf + '.ps', /landscape, /color
  plotfit,  CREATE_STRUCT('wave', s.wave, 'flux', fltarr(n_elements(s.wave))-1, 'err', fltarr(n_elements(s.wave))-1),$
   fltarr(n_elements(s.wave))-1,  cont_params, good_reg, [1020,1040], vdisp, s.z, 2,0
  dfpsclose
  
    ; saving other lines
   
  dfpsplot, 'Otpart1' + suf + '.ps', /landscape, /color
  plotfit,  CREATE_STRUCT('wave', s.wave, 'flux', fltarr(n_elements(s.wave))-1, 'err', fltarr(n_elements(s.wave))-1),$
   fltarr(n_elements(s.wave))-1, cont_params, good_reg, [900,980], vdisp, s.z, 3,0
  dfpsclose
  dfpsplot, 'Otpart2' + suf + '.ps', /landscape, /color
  plotfit,  CREATE_STRUCT('wave', s.wave, 'flux', fltarr(n_elements(s.wave))-1, 'err', fltarr(n_elements(s.wave))-1),$
   fltarr(n_elements(s.wave))-1, cont_params, good_reg, [980,1060], vdisp, s.z, 3,0
  dfpsclose
  dfpsplot, 'Otpart3' + suf + '.ps', /landscape, /color
  plotfit, CREATE_STRUCT('wave', s.wave, 'flux', fltarr(n_elements(s.wave))-1, 'err', fltarr(n_elements(s.wave))-1),$
   fltarr(n_elements(s.wave))-1, cont_params, good_reg, [1060,1140], vdisp, s.z, 3,0
  dfpsclose
; 
  dfpsplot, 'OtpartLyd' + suf + '.ps', /landscape, /color
  plotfit,  CREATE_STRUCT('wave', s.wave, 'flux', fltarr(n_elements(s.wave))-1, 'err', fltarr(n_elements(s.wave))-1),$
   fltarr(n_elements(s.wave))-1, cont_params, good_reg, [915,955], vdisp, s.z, 3,0
  dfpsclose
   dfpsplot, 'OtpartLyb' + suf + '.ps', /landscape, /color
  plotfit,  CREATE_STRUCT('wave', s.wave, 'flux', fltarr(n_elements(s.wave))-1, 'err', fltarr(n_elements(s.wave))-1),$
   fltarr(n_elements(s.wave))-1,  cont_params, good_reg, [1020,1040], vdisp, s.z, 3,0
  dfpsclose
endif

end