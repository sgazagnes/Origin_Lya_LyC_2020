

headl = ['Parameter', 'Value', 'Error']
allstring = [['redshift'],['S/N'],['Vres'],['Stellar'], ['E(B-V)'],[transpose(fcovstring)],[transpose(lognstring)],[transpose(bstring)],[transpose(vstring)]]
value_arr = [[s.z],[top],[params.vdisp],[exage],[ebv_coef],[transpose(params_out.fcov)],[transpose(params_out.log_n)],$
[transpose(params_out.b)],[transpose(params_out.v)]]
err_arr = [[0],[0],[0],[exage_err],[ebv_err],[transpose(params_out.fcov_err)],[transpose(params_out.log_n_err)],[transpose(params_out.b_err)],[transpose(params_out.v_err)]];
write_csv, galaxy+'/'+galaxy+'_parameters_free.csv', transpose(allstring), transpose(value_arr),transpose(err_arr), header =headl 
;write_csv,  galaxy+'/'+galaxy+'_parameters_fixNH.csv', transpose(allstring), transpose(value_arr),transpose(err_arr), header =headl 
;
lim1=[900,1150]
;lim2=[970,1040]

lim2=[1022,1042]
lim3=[965,980]

;lim1=[900,1000]
;lim2=[1000,1100]
;lim3 =[1100,1200]

dfpsplot,  galaxy+'/'+galaxy+ 'fitStell2.ps', /landscape, /color
ang = cgsymbol("angstrom") 
bet = textoidl('\beta')
net = textoidl('\neta')
esp = textoidl('\epsilon')
delt = textoidl('\delta')
gam = cgsymbol("gamma") 
multiplot,/reset, /default
!p.charthick = 4
!p.font = 0
multiplot, [1,4], ygap = 0.03, xgap = 0.02, mXtitle="Wavelength ("+ang+")",mxTitSize=1.5, mxTitOffset=1.4, mYtitle='Normalized Flux',myTitSize=1.5,myTitOffset=1.1,/doxaxis
plot, s.wave, s.flux, xr = lim1, /xs, yr = [0,1.5], thick = 8
djs_oplot, s.wave, params_out.fit, color = 'red', thick =8
       djs_oplot, s.wave, s.err, color = 'green', thick =4

multiplot,/doxaxis
!P.Multi = [2,2]
plot, s.wave, s.flux, xr = lim1, /xs, yr = [0,2], thick = 8, psym = 10
djs_oplot, s.wave, params_out.fit, color = 'red', thick =8
djs_oplot, s.wave, s.err, color = 'green', thick =4
legend, ['Ly'+bet], charsize = 1.4, charthick = 6, box = 0
;plot, s.wave, s.flux, xr = lim2, /xs, yr = [0,1.5], thick = 8
;djs_oplot, s.wave,params_out.fit, color = 'red', thick =8
;djs_oplot, s.wave, s.err, color = 'green', thick =4
multiplot
dfpsclose
 multiplot,/reset, /default 

lim1=[900,1200]
lim2=[1022,1042]
lim3=[965,980]
lim4=[945,955]
lim5=[932,942]
;lim3 =[1100,1200]
wave =list([981,985],[994,1009],[1021,1023], [1028.5,1029.5],[1045,1060],[1064,1072],[1075,1081],[1086,1087],[1124,1135],[1140,1170])

good_reg = []
reg_arr=[]
for ii = 0, wave.count()-1 DO BEGIN & $
  interv = wave[ii] & $
  reg_arr = [[reg_arr], [wave[ii]]] & $
  good_reg = [good_reg, where(s.wave gt interv[0] and s.wave lt interv[1])] & $
  ;jj= jj+1
  ;wltoinclude.remove, 0 & $
ENDfor

mask = s.wave 
mask = mask * 0
mask[good_reg] = 1
good_flux = s.flux
good_flux[where(mask lt 1.)] = 'NaN'
dfpsplot,  galaxy+ 'test.ps', /landscape, /color
ang = cgsymbol("angstrom") 
bet = textoidl('\beta')
net = textoidl('\neta')
esp = textoidl('\epsilon')
delt = textoidl('\delta')
gam = cgsymbol("gamma") 
!p.multi = [0,1,5]
!p.charthick = 4
!p.font = 0
!y.margin = [2,1]
plot, s.wave, s.flux, xr = lim1, /xs, yr = [0,1.5], thick = 2, charsize = 1.5, charthick = 4;, position=[0.05,0.95,0.95,0.7]
djs_oplot, s.wave, s.flux,color = 'gray', thick = 8;, position=[0.05,0.95,0.95,0.7]
djs_oplot, s.wave, good_flux,color = 'black', thick = 8;, position=[0.05,0.95,0.95,0.7]
djs_oplot, s.wave, stell.fit, color = 'red', thick =6
djs_oplot, s.wave, s.err, color = 'green', thick =3
;
!p.multi = [8,2,5]
plot, s.wave, s.flux, xr = lim2, /xs, yr = [0,1.5], thick = 8, psym = 10,  charsize = 1.5, charthick = 4
djs_oplot, s.wave, params_out.fit, color = 'red', thick =6
djs_oplot, s.wave, s.err, color = 'green', thick =3
djs_oplot, [1025.7, 1025.7], [1.5,1.39], color = 'black',/data, thick =3
djs_oplot, [1025.8, 1025.8], [1.5,1.39], color = 'black',/data, thick =3
;djs_oplot, [1039.2, 1039.2], [1.5,1.39], color = 'black',/data, thick =3
;djs_oplot, [1031.9, 1031.9], [1.5,1.39], color = 'black',/data, thick =3
;djs_oplot, [1037.6, 1037.6], [1.5,1.39], color = 'black',/data, thick =3
;djs_oplot, [1036, 1036], [1.5,1.39], color = 'black',/data, thick =3
;legend, ['Ly'+bet], charsize = 1.4, charthick = 6, box = 0
;!p.multi = [7,2,5]
;plot, s.wave, s.flux, xr = lim3, /xs, yr = [0,1.5], thick = 8, psym = 10,  charsize = 1.5, charthick = 4
;djs_oplot, s.wave,params_out.fit, color = 'red', thick =6
;djs_oplot, s.wave, s.err, color = 'green', thick =3
;djs_oplot, [972., 972.], [1.5,1.39], color = 'black', /data, thick =3
;djs_oplot, [971.2, 971.2], [1.5,1.39], color = 'black', /data, thick =3
;;djs_oplot, [977, 977], [1.5,1.39], color = 'black', /data, thick =3
;;djs_oplot, [976.4, 976.4], [1.5,1.39], color = 'black', /data, thick =3
;;legend, ['Ly'+gam], charsize = 1.4, charthick = 6, box = 0
;
;!p.multi = [6,2,5]
;plot, s.wave, s.flux, xr = lim4, /xs, yr = [0,1.5], thick = 8, psym = 10,  charsize = 1.5, charthick = 4
;djs_oplot, s.wave, params_out.fit, color = 'red', thick =6
;djs_oplot, s.wave, s.err, color = 'green', thick =3
;djs_oplot, [949.7, 949.7], [1.5,1.39], color = 'black', /data, thick =3
;djs_oplot, [948.7, 948.7], [1.5,1.39], color = 'black', /data, thick =3
;djs_oplot, [950.9, 950.9], [1.5,1.39], color = 'black', /data, thick =3
;;legend, ['Ly'+delt], charsize = 1.4, charthick = 6, box = 0
;!p.multi = [5,2,5]
;plot, s.wave, s.flux, xr = lim5, /xs, yr = [0,1.5], thick = 8, psym = 10,  charsize = 1.5, charthick = 4
;djs_oplot, s.wave,params_out.fit, color = 'red', thick =6
;djs_oplot, s.wave, s.err, color = 'green', thick =3
;djs_oplot, [937.8, 937.8], [1.5,1.39], color = 'black', /data, thick =3
;djs_oplot, [936.6, 936.6], [1.5,1.39], color = 'black', /data, thick =3
;;djs_oplot, [930.7, 930.7], [1.5,1.39], color = 'black', /data, thick =3
;;djs_oplot, [930.2, 930.2], [1.5,1.39], color = 'black', /data, thick =3
;;legend, ['Ly6'], charsize = 1.4, charthick = 6, box = 0
!p.multi = 0
dfpsclose


lim1=[1022,1042]
lim2=[965,980]
lim3 =[1100,1200]
dfpsplot, galaxy+'/'+galaxy+ 'fitLy.ps', /landscape, /color
ang = cgsymbol("angstrom") 
bet = textoidl('\beta')
net = textoidl('\neta')
esp = textoidl('\epsilon')
delt = textoidl('\delta')
gam = cgsymbol("gamma") 
multiplot,/reset, /default
!p.charthick = 4
!p.font = 0
multiplot, [2,3], ygap = 0.03, xgap = 0.02, mXtitle="Wavelength ("+ang+")",mxTitSize=1.5, mxTitOffset=1.4, mYtitle='Normalized Flux',myTitSize=1.5,myTitOffset=1.1,/doxaxis
plot, s.wave, s.flux, xr = lim1, /xs, yr = [0,2], thick = 8, psym = 10
djs_oplot, s.wave, params_out.fit, color = 'red', thick =8
djs_oplot, s.wave, s.err, color = 'green', thick =4
legend, ['Ly'+bet], charsize = 1.4, charthick = 6, box = 0

multiplot, /doxaxis
plot, s.wave, s.flux, xr = lim2, /xs, yr = [0,2], thick = 8
djs_oplot, s.wave,params_out.fit, color = 'red', thick =8
djs_oplot, s.wave, s.err, color = 'green', thick =4
legend, ['Ly'+gam], charsize = 1.4, charthick = 6, box = 0
;multiplot
;plot, s.wave, s.flux, xr = lim3, /xs, yr = [0,2], thick = 8
;djs_oplot, s.wave, params_out.fit, color = 'red', thick =8
;djs_oplot, s.wave, s.err, color = 'green', thick =4

dfpsclose
 multiplot,/reset, /default 



dfpsplot, 'Picket2fit15000.ps', /landscape, /color
ang = cgsymbol("angstrom") 
inf = cgsymbol("infinity")
bet = textoidl('\beta')
net = textoidl('\neta')
esp = textoidl('\epsilon')
delt = textoidl('\delta')
gam = cgsymbol("gamma") 
multiplot,/reset, /default
!p.charthick = 4
!p.font = 0
multiplot, [1,3], ygap = 0.03,mTitle = "Fit (red) of synthetic spectra (R = 600) for Picket-Fence model", mTitSize = 1.2, mXtitle="Wavelenght ("+ang+")",mxTitSize=1.4, mxTitOffset=1.4, mYtitle='Normalized Flux',myTitSize=1.4,myTitOffset=1.1,/doxaxis
plot, simu.wave, simu.groundcf, xr = [910,1050], /xs, yr = [0,2], thick = 5
;djs_oplot, simu.wave, fit600inf, color = 'red', thick = 4
legend, ['SNR = '+inf], charsize = 1.4, charthick = 6, box = 0

;djs_oplot, s.wave, params_out.fit, color = 'red', thick =8
       ;djs_oplot, s.wave, params_out.fit, color = 'blue', thick =4, linestyle=1

multiplot, /doxaxis
plot, simu.wave, simu.noisecfSN10[*,40], xr = [910,1050], /xs, yr = [0,2], thick = 5
djs_oplot, simu.wave, params_out.fit, color = 'red', thick = 4
legend, ['SNR = 10'], charsize = 1.4, charthick = 6, box = 0

multiplot, /doxaxis
plot, simu.wave, simu.noisecfSN2[*,5], xr = [910,1050], /xs, yr = [0,3], thick = 5
;djs_oplot, simu.wave, fit600SN2, color = 'red', thick = 4
;djs_oplot, s.wave,params_out.fit, color = 'red', thick =8
;djs_oplot, s.wave, s.err, color = 'green', thick =4
legend, ['SNR = 2'], charsize = 1.4, charthick = 6, box = 0

dfpsclose
 multiplot,/reset, /default 


dfpsplot, 'stacked2.ps', /landscape, /color
ang = cgsymbol("angstrom") 
inf = cgsymbol("infinity")
bet = textoidl('\beta')
net = textoidl('\neta')
esp = textoidl('\epsilon')
delt = textoidl('\delta')
gam = cgsymbol("gamma") 
multiplot,/reset, /default
!p.charthick = 4
!p.font = 0
multiplot, [1,3], ygap = 0.03,mTitle = "Fit of synthetic stacked spectra", mTitSize = 1.2, mXtitle="Wavelenght ("+ang+")",mxTitSize=1.4, mxTitOffset=1.4, mYtitle='Normalized Flux',myTitSize=1.4,myTitOffset=1.1,/doxaxis
plot, simu.wave, simu.stack_noise20, xr = [910,1050], /xs, yr = [0,2], thick = 5
;djs_oplot, simu.wave, fit20, color = 'red', thick = 4
legend, ['R = 15000'], charsize = 1.4, charthick = 6, box = 0

;djs_oplot, s.wave, params_out.fit, color = 'red', thick =8
       ;djs_oplot, s.wave, params_out.fit, color = 'blue', thick =4, linestyle=1

multiplot, /doxaxis
plot, simu.wave, simu.stack_noise100, xr = [910,1050], /xs, yr = [0,2], thick = 5
djs_oplot, simu.wave, fit200, color = 'red', thick = 4
legend, ['R = 3000'], charsize = 1.4, charthick = 6, box = 0

multiplot, /doxaxis
plot, simu.wave, simu.stack_noise500, xr = [910,1050], /xs, yr = [0,2], thick = 5
;djs_oplot, simu.wave, fit500, color = 'red', thick = 4
;djs_oplot, s.wave,params_out.fit, color = 'red', thick =8
;djs_oplot, s.wave, s.err, color = 'green', thick =4
legend, ['R = 600'], charsize = 1.4, charthick = 6, box = 0

dfpsclose
 multiplot,/reset, /default 

dfpsplot, 'lybzoom8.ps', /landscape, /color
ang = cgsymbol("angstrom") 
inf = cgsymbol("infinity")
bet = textoidl('\beta')
net = textoidl('\neta')
esp = textoidl('\epsilon')
delt = textoidl('\delta')
gam = cgsymbol("gamma") 
multiplot,/reset, /default
!p.charthick = 4
!p.font = 0
multiplot, [2,2], ygap = 0.03,mTitle = "Fit of synthetic stacked spectra", mTitSize = 1.2, mXtitle="Wavelenght ("+ang+")",mxTitSize=1.4, mxTitOffset=1.4, mYtitle='Normalized Flux',myTitSize=1.4,myTitOffset=1.1,/doxaxis
plotfit, s, pp, [1022,1028], params.vdisp, 1, 1, 1
djs_oplot, s.wave, stellar, color = 'red', thick = 4, linestyle = 2
legend, ['Stellar continuum', 'Final profile' ], charsize = 1.4, charthick = 6, box = 0

;djs_oplot, s.wave, params_out.fit, color = 'red', thick =8
       ;djs_oplot, s.wave, params_out.fit, color = 'blue', thick =4, linestyle=1
;
;multiplot, /doxaxis
;plotfit, s, pp, [1210,1240], params.vdisp, 1, 1, 1
;
;
;multiplot, /doxaxis
;plotfit, s, pp, [1020,1030], params.vdisp, 1, 1, 1


dfpsclose
 multiplot,/reset, /default 




dfpsplot, 'lybzoom7.ps', /landscape, /color

plotfit, s, params_out, [1022,1028], params.vdisp, 1, 0, 0
djs_oplot, s.wave, one.fit, color = 'blue', thick = 4
;djs_oplot, s.wave, params_out.fit, color = 'red', thick =8
       ;djs_oplot, s.wave, params_out.fit, color = 'blue', thick =4, linestyle=1
;
multiplot, /doxaxis
plotfit, s, params_out, [960,980], params.vdisp, 1, 1, 1
;
;
multiplot, /doxaxis
plotfit, s, params_out, [928,960], params.vdisp, 1, 1, 1


dfpsclose
 multiplot,/reset, /default 








lineh =  lyb_ab(s.wave, params_out.v[0], params_out.b[0], params_out.log_n[0], 1025.728, .079142, 5.5751d7, params_out.fcov[0], vdisp=vdisp)
;lyg = lyb_ab(s.wave, params_out.v[0], params_out.b[0], params_out.log_n[0], 972.517, 0.029006, 1.2785d7, params_out.fcov[0], vdisp=vdisp) ; LyG profile
  lyd = lyb_ab(x, vh1, bh1, log_n_h, 949.742, .013945, 4.125d6, fcovneut, vdisp=vdisp) ; LyG profile
  ly5 = lyb_ab(s.wave, params_out.v[0], params_out.b[0], params_out.log_n[0], 937.814, 0.0078035, 1.644d6, params_out.fcov[0], vdisp=vdisp) ; LyG profile
  ly6 = lyb_ab(x, vh1, bh1, log_n_h, 930.751, 0.0048164, 7.5684d5, fcovneut, vdisp=vdisp) ; LyG profile
  ;ly7 = lyb_ab(x, vh1, bh1, log_n_h, 926.249, 0.0031850, 3.8694d5, fcovneut, vdisp=vdisp) ; LyG profile
  ii=2
  ; O Lines
  lineo =  lyb_ab(s.wave, params_out.v[ii],params_out.b[ii], params_out.log_n[ii], 1025.762, .0169, 7.66d7, 1, vdisp=vdisp)
 ; o1j924 = lyb_ab(x,vo1,bo1,log_n_o1, 924.950, .0013, 7.22d6, fcovion,vdisp=vdisp); O I 976
 ; o1j929 = lyb_ab(x,vo1,bo1,log_n_o1, 929.517, .00192, 1.06d7, fcovion,vdisp=vdisp); O I 976
 ; o1j930 = lyb_ab(x,vo1,bo1,log_n_o1, 930.257, .000537, 6.9d6, fcovion,vdisp=vdisp); O I 976
  o1j936 = lyb_ab(s.wave, params_out.v[ii],params_out.b[ii], params_out.log_n[ii], 936.629, .00306, 1.66d7, 1,vdisp=vdisp); O I 976
  o1j948 = lyb_ab(x,vo1,bo1,log_n_o1, 948.686, .00531, 2.81d7, fcovion,vdisp=vdisp); O I 976
  o1j950 = lyb_ab(x,vo1,bo1,log_n_o1, 950.885, .00158, 1.94d7, fcovion,vdisp=vdisp); O I 976
  o1j971 = lyb_ab(s.wave, params_out.v[ii],params_out.b[ii], params_out.log_n[ii], 971.738, .0116, 5.85d7, 1,vdisp=vdisp); O I 976
  ;o1j1025 = lyb_ab(x,vo1,bo1,log_n_o1, 1025.762, .0169, 7.66d7, fcovion,vdisp=vdisp); O I 976
  o1j1039 = lyb_ab(s.wave, params_out.v[ii],params_out.b[ii], params_out.log_n[ii], 1039.230, 0.00916, 9.43d7, 1,vdisp=vdisp) ; O I 1039 profile
  c2j1036 = lyb_ab(s.wave, params_out.v[3],params_out.b[3], params_out.log_n[3], 1036.337, 0.119, 7.38d8, 1,vdisp=vdisp)

end


;