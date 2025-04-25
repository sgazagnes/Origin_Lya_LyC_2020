x = (FINDGEN(7600)/50)+1190

col = [20,21]
vres = [100.,200.,600.]
lya = fltarr(6,7600)
 vlya = (x/1215.6701 -1) * 2.99e5

for jj = 0,1 do begin & $
for ii =0,2 do begin & $

lya[ii+jj*3,*] = lyb_ab(x, 0, 125,col[jj], 1215.6701, .41641, 4.6986d8, 1, vres=vres[ii]) &$
endfor & $
endfor
lyaa = lyb_ab(x, 0, 125,19, 1215.6701, .41641, 4.6986d8, 1, vres=0)
lyab =lyb_ab(x, 0, 125,20, 1215.6701, .41641, 4.6986d8, 1, vres=0)
lyac =lyb_ab(x, 0, 125,21, 1215.6701, .41641, 4.6986d8, 1, vres=0)
;lyb = lyb_ab(x, 0, 125,col, 1025.728, .079142, 5.5751d7, 1, vdisp=vdisp) ;This calls an ancilary function to generate the LyB profile
;lyg = lyb_ab(x, 0, 125, col, 972.517, 0.029006, 1.2785d7, 1, vdisp=vdisp) ; LyG profile
;lyd = lyb_ab(x, 0, 125, col, 949.742, .013945, 4.125d6, 1, vdisp=vdisp) ; LyG profile
;ly5 = lyb_ab(x,0, 125, col, 937.814, 0.0078035, 1.644d6, 1, vdisp=vdisp) ; LyG profile
;ly6 = lyb_ab(x, 0, 125, col, 930.751, 0.0048164, 7.5684d5,1, vdisp=vdisp) ; LyG profile
;ly7 = lyb_ab(x, 0, 125, col, 926.249, 0.0031850, 3.8694d5, 1, vdisp=vdisp) ; LyG profile
;ly8 = lyb_ab(x, 0, 125, col, 923.148, 0.0022172, 2.1425d5, 1, vdisp=vdisp) ; LyG profile

;
;dfpsplot, 'Lya.ps', /landscape, /color
;ang = cgsymbol("angstrom") 
;bet = textoidl('\beta')
;net = textoidl('\neta')
;esp = textoidl('\epsilon')
;delt = textoidl('\delta')
;gam = cgsymbol("gamma") 
;multiplot,/reset, /default
;!p.charthick = 4
;!p.font = 0
;multiplot, [1,2], ygap = 0.03,mXtitle="Wavelength ("+ang+")",mxTitSize=1.5, mxTitOffset=1.4, mYtitle='Normalized Flux',myTitSize=1.5,myTitOffset=1.1,/doxaxis
;plot, x, lya[0,*], xr = [1190,1240], /xs, yr = [0,1.1], thick = 8
;djs_oplot, x, lya[1,*], color = 'red', thick =8
;djs_oplot,x, lya[2,*], color = 'blue', thick =4
;legend, ['R = 3000','R = 1500', 'R = 500'],textcolors =[djs_icolor('black'),djs_icolor('red'),djs_icolor('blue')], box = 0
;
;multiplot, /doxaxis
;plot, x, lya[3,*], xr = [1190,1240], /xs, yr = [0,1.1], thick = 8
;djs_oplot, x, lya[4,*], color = 'red', thick =8
;djs_oplot,x, lya[5,*], color = 'blue', thick =4
;
;dfpsclose
; multiplot,/reset, /default 

dfpsplot, 'LyaN21corr.ps', /landscape, /color
ang = cgsymbol("angstrom") 
bet = textoidl('\beta')
net = textoidl('\neta')
esp = textoidl('\epsilon')
delt = textoidl('\delta')
gam = cgsymbol("gamma") 
multiplot,/reset, /default
!p.charthick = 4
!p.font = 0
multiplot, [3,1], mXtitle="Wavelength ("+ang+")",mxTitSize=1.5, mxTitOffset=1.4, mYtitle='Normalized Flux',myTitSize=1.5,myTitOffset=1.1,/doxaxis
plot, vlya, lya[3,*], xr=[-5000,5000], /xs, yr = [0,1.1], thick = 4
djs_oplot,data.v, data.fcra, color = 'blue', thick =4
legend, ['Profil Simon','Profil Daniel'],textcolors =[djs_icolor('black'),djs_icolor('blue')], box = 0
legend, ['R=100'], box = 0, Position = [-4000,0.6]
multiplot, /doxaxis
plot, vlya, lya[4,*], xr=[-5000,5000], /xs, yr = [0,1.1], thick = 4
djs_oplot,data.v, data.fcrb, color = 'blue', thick =4
legend, ['N=21'], box = 0
legend, ['R=200'], box = 0,Position = [-4000,0.6]
multiplot, /doxaxis
plot, vlya, lya[5,*], xr=[-5000,5000], /xs, yr = [0,1.1], thick = 4
djs_oplot,data.v, data.fcrc, color = 'blue', thick =4
legend, ['R=600'], box = 0,Position = [-4000,0.6]
dfpsclose
 multiplot,/reset, /default 
 
 dfpsplot, 'LyaInf.ps', /landscape, /color
ang = cgsymbol("angstrom") 
bet = textoidl('\beta')
net = textoidl('\neta')
esp = textoidl('\epsilon')
delt = textoidl('\delta')
gam = cgsymbol("gamma") 
multiplot,/reset, /default
!p.charthick = 4
!p.font = 0
multiplot, [3,1], mXtitle="Wavelength ("+ang+")",mxTitSize=1.5, mxTitOffset=1.4, mYtitle='Normalized Flux',myTitSize=1.5,myTitOffset=1.1,/doxaxis
plot, vlya, lyaa, xr=[-5000,5000], /xs, yr = [0,1.1], thick = 4
djs_oplot,data.v, data.fa, color = 'blue', thick =4
legend, ['Profil Simon','Profil Daniel'],textcolors =[djs_icolor('black'),djs_icolor('blue')], box = 0
legend, ['N=19'], box = 0, Position = [-4000,0.6]
multiplot, /doxaxis
plot, vlya, lyab, xr=[-5000,5000], /xs, yr = [0,1.1], thick = 4
djs_oplot,data.v, data.fb, color = 'blue', thick =4
legend, ['N=20'], box = 0
;legend, ['R=200'], box = 0,Position = [-4000,0.6]
multiplot, /doxaxis
plot, vlya, lyac, xr=[-5000,5000], /xs, yr = [0,1.1], thick = 4
djs_oplot,data.v, data.fc, color = 'blue', thick =4
legend, ['N=21'], box = 0,Position = [-4000,0.6]
dfpsclose
 multiplot,/reset, /default 
end