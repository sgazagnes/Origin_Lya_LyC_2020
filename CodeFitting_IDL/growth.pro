
xlyb = (FINDGEN(10000)/20)+775
xlyg = (FINDGEN(8000)/20)+772
xlyd = (FINDGEN(2800)/20)+880
xly5 = (FINDGEN(2800)/20)+868
xly6 = (FINDGEN(2800)/20)+860
xly7 = (FINDGEN(2800)/20)+856

b = [50,100,150,200,250]
logn = (FINDGEN(24)/2)+11

tablyb = fltarr(5,n_elements(logn))
tablyg = fltarr(5,n_elements(logn))
tablyd = fltarr(5,n_elements(logn))
tably5 = fltarr(5,n_elements(logn))
tably6 = fltarr(5,n_elements(logn))
tably7 = fltarr(5,n_elements(logn))
tabo1 = fltarr(5,n_elements(logn))

for ii = 0, n_elements(b)-1 do begin & $
curb = b[ii] & $
for jj = 0, n_elements(logn) -1 do begin & $
curn = logn[jj] & $

lyb = lyb_ab(xlyb, 0, curb, curn, 1025.728, .079142, 5.5751d7, 1, vdisp=20.) & $ ;This calls an ancilary function to generate the LyB profile
lyg = lyb_ab(xlyg, 0, curb, curn, 972.517, 0.029006, 1.2785d7, 1, vdisp=20.) & $; LyG profile
lyd = lyb_ab(xlyd, 0, curb, curn, 949.742, .013945, 4.125d6, 1, vdisp=20.) & $ ; LyG profile
ly5 = lyb_ab(xly5,0, curb, curn, 937.814, 0.0078035, 1.644d6, 1, vdisp=20.) & $ ; LyG profile
ly6 = lyb_ab(xly6, 0, curb, curn, 930.751, 0.0048164, 7.5684d5,1, vdisp=20.) & $ ; LyG profile
ly7 = lyb_ab(xly7, 0, curb, curn, 926.249, 0.0031850, 3.8694d5, 1, vdisp=20.) & $ ; LyG profile

;o1 = lyb_ab(xlyb,0,curb,curn, 1039.230, 0.00916, 9.43d7, 1,vdisp=20.) & $
o1= lyb_ab(xlyb,0,curb,curn,  988.773, .0464, 2.26d8, 1,vdisp=20.) & $
ewlyb = INT_TABULATED(xlyb, 1-lyb) & $
ewlyg = INT_TABULATED(xlyg, 1-lyg) & $
ewlyd = INT_TABULATED(xlyd, 1-lyd) & $
ewly5 = INT_TABULATED(xly5, 1-ly5) & $
ewly6 = INT_TABULATED(xly6, 1-ly6) & $
ewly7 = INT_TABULATED(xly7, 1-ly7) & $
ewo1 = INT_TABULATED(xlyb, 1-o1) & $
tablyb[ii, jj] = ewlyb & $
tablyg[ii, jj] = ewlyg & $
tablyd[ii, jj] = ewlyd & $
tably5[ii, jj] = ewly5 & $
tably6[ii, jj] = ewly6 & $
tably7[ii, jj] = ewly7 & $
tabo1[ii, jj] = ewo1 & $
endfor & $
endfor

dfpsplot, 'cog.ps', /landscape, /color
ang = cgsymbol("angstrom") 
bet = textoidl('\beta')
net = textoidl('\neta')
esp = textoidl('\epsilon')
delt = textoidl('\delta')
gam = cgsymbol("gamma") 
multiplot,/reset, /default
!p.charthick = 4
!p.font = 0
!Y.MARGIN = [5,1]
!X.MARGIN = [10,5]
!y.range = [0,1.5]
;!p.YMARGIN = [5,2]
multiplot, [1,2], ygap = 0.,mXtitle='Log(N(HI))',mxTitSize=1.5, mxTitOffset=1.4, mYtitle='Equivalent Width',myTitSize=1.5,myTitOffset=4.5,ytickformat='(E7.0)'
line = tabo1
plot, logn, line[0,*], thick = 5, /YLOG, xrange =[13, 24], yrange = [0.001,80], /ys, /xs, charthick = 4, charsize = 1.5
djs_oplot, logn, line[1,*], thick = 5, color = 'blue'
djs_oplot, logn, line[2,*], thick = 5, color = 'red'
djs_oplot, logn, line[3,*], thick = 5, color = 'green'
djs_oplot, logn, line[4,*], thick = 5,  color = 'cyan'
djs_oplot, [14.9,14.9], [0.0001, 100000], linestyle = 1
djs_oplot, [15.38,15.38], [0.0001, 100000], linestyle = 1
djs_oplot, [16,16], [0.0001, 100000], linestyle = 1
djs_oplot, [15.56,15.56], [0.0001, 100000], linestyle = 1
djs_oplot, [15.76,15.76], [0.0001, 100000], linestyle = 1
djs_oplot, [15.33,15.33], [0.0001, 100000], linestyle = 1
djs_oplot, [15.97,15.97], [0.0001, 100000], linestyle = 1
djs_oplot, [15.73,15.73], [0.0001, 100000], linestyle = 1
legend, ['b = 50 km/s','b = 100 km/s','b = 150 km/s','b = 200 km/s','b = 250 km/s'],$
 textcolors =[djs_icolor('black'),djs_icolor('blue'),djs_icolor('red'),djs_icolor('green'),djs_icolor('cyan')],box = 0, charsize = 1.5, charthick = 4
 legend, ['OI 1039'], POSITION = [18,0.1],box = 0, charsize = 1.5, charthick = 4
multiplot
line = tably7
plot, logn, line[0,*], thick = 5, /YLOG, xrange =[13, 24], yrange = [0.001,80], /ys, /xs, charthick = 4, charsize = 1.5
djs_oplot, logn, line[1,*], thick = 5, color = 'blue'
djs_oplot, logn, line[2,*], thick = 5, color = 'red'
djs_oplot, logn, line[3,*], thick = 5, color = 'green'
djs_oplot, logn, line[4,*], thick = 5,  color = 'cyan'
 legend, ['Ly7 : 927 '+ang], POSITION = [18,0.1],box = 0, charsize = 1.5, charthick = 4
 
dfpsclose
14.9
15.38
16
15.56
15.76
15.33
15.97
15.79


dfpsplot, 'curveLyb.ps', /landscape, /color
line = tablyb
bet = textoidl('\beta')
net = textoidl('\neta')
esp = textoidl('\epsilon')
delt = textoidl('\delta')
gam = cgsymbol("gamma") 

plot, logn, line[0,*], thick = 5, /YLOG, xrange =[13, 24], yrange = [0.001,80], /ys, /xs,title = 'Ly'+bet, ytitle = 'Equivalent Width', xtitle = 'Log(N(HI))', charthick = 4, charsize = 1.5
djs_oplot, logn, line[1,*], thick = 5, color = 'blue'
djs_oplot, logn, line[2,*], thick = 5, color = 'red'
djs_oplot, logn, line[3,*], thick = 5, color = 'green'
djs_oplot, logn, line[4,*], thick = 5,  color = 'cyan'
legend, ['b = 50 km/s','b = 100 km/s','b = 150 km/s','b = 200 km/s','b = 250 km/s'],$
 textcolors =[djs_icolor('black'),djs_icolor('blue'),djs_icolor('red'),djs_icolor('green'),djs_icolor('cyan')],box = 0, charsize = 1.5, charthick = 4

dfpsclose


lyb = lyb_ab(xlyb, 0, 100, 19, 1025.728, .079142, 5.5751d7, 1, vdisp=20.)  ;This calls an ancilary function to generate the LyB profile
ly2b = lyb_ab(xlyb, 0, 170, 16.5, 1025.728, .079142, 5.5751d7, 1, vdisp=20.)  ;This calls an ancilary function to generate the LyB profile

lyb = fltarr(5,10000)
n= [21,22,23]
for ii = 0, 4 do begin & $
curb = b[ii] & $

curn = 18 & $

lyb[ii,*] = lyb_ab(xlyb, 0, curb, curn, 1025.728, .079142, 5.5751d7, 1, vdisp=20.) & $ ;This calls an ancilary function to generate the LyB profile

endfor

dfpsplot, 'Lybp2.ps', /landscape, /color

!X.MARGIN = [30,30]
!Y.MARGIN = [7,7]
plot, xlyb, lyb[0,*], xr = [1022,1030],yr = [0,1.2], thick = 5, /xs,/ys,ytitle = 'Intensite', xtitle = "Longueur d'onde ("+ang+")"
djs_oplot, xlyb, lyb[1,*], thick = 5, color = 'blue'
djs_oplot, xlyb, lyb[2,*], thick = 5, color = 'red'
djs_oplot, xlyb, lyb[3,*], thick = 5, color = 'green'
djs_oplot, xlyb, lyb[4,*], thick = 5,  color = 'cyan'

legend, ['log(N) = 18'],POSITION=[1027.5, 0.2],box = 0, charsize = 1.4, charthick = 4
dfpsclose

dfpsplot, 'Lybp3.ps', /landscape, /color

!X.MARGIN = [30,30]
!Y.MARGIN = [7,7]
plot, xlyb, lyb[0,*], xr = [1022,1030],yr = [0,1.2], thick = 5, /xs,/ys,ytitle = 'Intensite', xtitle = "Longueur d'onde ("+ang+")"
djs_oplot, xlyb, lyb[1,*], thick = 5, linestyle = 1
djs_oplot, xlyb, lyb[2,*], thick = 5, linestyle = 2
djs_oplot, [1027.4,1027.9], [0.2,0.2]
djs_oplot, [1027.4,1027.9], [0.1675,0.1675], linestyle = 1
djs_oplot, [1027.4,1027.9], [0.135,0.135], linestyle = 2
legend, ['b = 50 km/s'],POSITION=[1025, 1.1],box = 0, charsize = 1.4, charthick = 4
legend, ['log(N) = 21','log(N) = 22','log(N) = 23'],POSITION=[1027.7, 0.23],box = 0, charsize = 1.3, charthick = 4
dfpsclose

lyb = lyb_ab(xlyb, 0, 50, 18, 1025.728, .079142, 5.5751d7, 1, vdisp=20.) & $ ;This calls an ancilary function to generate the LyB profile
lyb08 = lyb *0.8 +0.2
lyb06 = lyb*0.6+0.4

dfpsplot, 'Lybfcov.ps', /landscape, /color

!X.MARGIN = [10,10]
!Y.MARGIN = [7,7]
plot, xlyb, lyb, xr = [1022,1030],yr = [0,1.2], thick = 5, /xs,/ys,ytitle = 'Intensite', xtitle = "Longueur d'onde ("+ang+")",charthick = 4, charsize = 1.5
djs_oplot, xlyb, lyb08, thick = 5, color = 'blue'
djs_oplot, xlyb, lyb06, thick = 5, color = 'red'
djs_oplot, [1022,1030], [0.2,0.2], linestyle = 1
djs_oplot, [1022,1030], [0.4,0.4], linestyle = 1
legend, ['b = 50 km/s'],POSITION=[1025, 1.1],box = 0, charsize = 1.4, charthick = 4
legend, ['fcov = 1','fcov = 0.8','fcov = 0.6'], textcolors =[djs_icolor('black'),djs_icolor('blue'),djs_icolor('red')],POSITION=[1023, 0.65],box = 0, charsize = 1.3, charthick = 4
dfpsclose


lyb = lyb_ab(xlyb, 0, 100, 19, 1025.728, .079142, 5.5751d7, 1, vdisp=20.)  ;This calls an ancilary function to generate the LyB profile
ly2b = lyb_ab(xlyb, 0, 160, 16.5, 1025.728, .079142, 5.5751d7, 1, vdisp=20.)  ;This calls an ancilary function to generate the LyB profile


noise10 = .1*randomn(seed, n_elements(xlyb))
noise5 = .2*randomn(seed, n_elements(xlyb)) 

lybn = lyb + noise10

lybn5 = lyb + noise5

noise10 = .1*randomn(seed, n_elements(xlyb))
noise5 = .2*randomn(seed, n_elements(xlyb))
ly2bn = ly2b + noise10
ly2bn5 = ly2b + noise5

dfpsplot, 'noisecog.ps', /landscape, /color
ang = cgsymbol("angstrom") 
bet = textoidl('\beta')
net = textoidl('\neta')
esp = textoidl('\epsilon')
delt = textoidl('\delta')
gam = cgsymbol("gamma") 
multiplot,/reset, /default
!p.charthick = 4
!p.font = 0
!Y.MARGIN = [10,10]
!X.MARGIN = [10,5]
!y.range = [0,1.5]
;!p.YMARGIN = [5,2]
multiplot, [3,1], mXtitle="Longueur d'onde ("+ang+")",mxTitSize=1.5, mxTitOffset=1.4, mYtitle='Intensite',myTitSize=1.5,myTitOffset=1.5
plot, xlyb,lyb, thick = 5,  xrange =[1024, 1027.5], yrange = [0,1.2], /ys, /xs, charthick = 4, charsize = 1.5,XTICKINTERVAL=1
djs_oplot, xlyb, ly2b, thick = 5, color = 'red';, linestyle = 2
legend, ['b = 100 km/s et log(N) = 19','b = 160 km/s et log(N) = 16.5'],$
 textcolors =[djs_icolor('black'),djs_icolor('red')],Position=[1024,1.15],box = 0, charsize = 1.3, charthick = 4
 legend, ['Sans bruit'],Position=[1025,0.9],box = 0, charsize = 1.3, charthick = 4
multiplot

plot, xlyb,lybn, thick = 5,  xrange =[1024, 1027.5], yrange = [0,1.2], /ys, /xs, charthick = 4, charsize = 1.5,XTICKINTERVAL=1
djs_oplot, xlyb, ly2bn, thick = 5, color = 'red';, linestyle = 2
 legend, ['S/N = 10'],Position=[1025,0.9],box = 0, charsize = 1.3, charthick = 4
 multiplot

plot, xlyb,lybn5, thick = 5,  xrange =[1024, 1027.5], yrange = [0,1.2], /ys, /xs, charthick = 4, charsize = 1.5,XTICKINTERVAL=1
djs_oplot, xlyb, ly2bn5, thick = 5, color = 'red';, linestyle = 2
 legend, ['S/N = 5'],Position=[1025,0.9],box = 0, charsize = 1.3, charthick = 4
 
dfpsclose

lyb1 = lyb_ab(xlyb, 0, 100, 18, 1025.728, .079142, 5.5751d7, 1, vdisp=20.)  ;This calls an ancilary function to generate the LyB profile
lyb2 = lyb_ab(xlyb, 0, 100, 18, 1025.728, .079142, 5.5751d7, 1, vdisp=50.)  ;This calls an ancilary function to generate the LyB profile
lyb3 = lyb_ab(xlyb, 0, 100, 18, 1025.728, .079142, 5.5751d7, 1, vdisp=100.)  ;This calls an ancilary function to generate the LyB profile
lyb4 = lyb_ab(xlyb, 0, 100, 18, 1025.728, .079142, 5.5751d7, 1, vdisp=200.)  ;This calls an ancilary function to generate the LyB profile
plot, xlyb,lyb1, thick = 5,  xrange =[1023, 1029], yrange = [0,1.2], /ys, /xs, charthick = 4, charsize = 1.5,XTICKINTERVAL=1
djs_oplot, xlyb,lyb2,thick = 5, color = 'red'
djs_oplot, xlyb, lyb3, thick =5 , color ='blue'
djs_oplot, xlyb, lyb4, thick=5, color = 'green'
legend, ['Resolution = 15000','Resolution = 6000','Resolution = 3000','Resolution = 1500' ],$
 textcolors =[djs_icolor('black'),djs_icolor('red'),djs_icolor('blue'),djs_icolor('green')],Position=[1024,1.15],box = 0, charsize = 1.3, charthick = 4
 ;legend, ['b = 100 km/s'],Position=[1025,0.9],box = 0, charsize = 1.3, charthick = 4
 
end