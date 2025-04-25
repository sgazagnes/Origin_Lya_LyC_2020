
lim1=[925,1130]
lim2=[1018,1042]
lim3=[965,980]
lim4=[945,955]
lim5=[928,942]
;lim3 =[1100,1200]
wave = list([927.5,939.2],[946,951],[971.4, 972.9], [985,992],[1023.1,1026],[1026.72,1030],[1038,1045],[934,935],[939,942],[947,948],[951,955],[956.5,958],[978,987], [991,997], [1000,1009],[1022,1023], [1026,1029], [1042,1050], [1060,1080],[1087,1108],[1113,1120]);


;lines = params_out.lines
;RESTORE, 'DataTemplate.sav'
;alllines = READ_ASCII(linefile, TEMPLATE = myTemplate)
    
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
dfpsplot,  'Fits/lines.ps', /landscape, /color
ang = cgsymbol("angstrom") 
bet = textoidl('\beta')
net = textoidl('\neta')
esp = textoidl('\epsilon')
delt = textoidl('\delta')
gam = cgsymbol("gamma") 

!p.charthick = 40
!p.font = 0
!y.margin = [2,1]

plot, s.wave, s.flux, xr = lim5, /xs, yr = [0,5], thick = 8, psym = 10
!p.charthick = 40
!p.font = 0
;djs_oplot, [1024.5, 1024.5], [2,1.60], color = 'black',/data, thick =5
;djs_oplot, [1025.5, 1025.5], [2,1.60], color = 'black',/data, thick =5
;djs_oplot, [1039., 1039.], [2,1.60], color = 'black',/data, thick =5
;djs_oplot, [1030.5, 1030.5], [2,1.60], color = 'gray',/data, thick =5
;djs_oplot, [1036.6, 1036.6], [2,1.60], color = 'gray',/data, thick =5
;djs_oplot, [1035.5, 1035.5], [2,1.60], color = 'gray',/data, thick =5
;legend, ['Ly'+bet], charsize = 1.4, charthick = 6, box = 0
legend, ['HI OI SiII CII OVI CIII SiIV SIII, Ly'+bet+ ' Ly'+gam+ ' Ly'+delt+ ' Ly5 Ly6', 'HI OI SiII CII OVI CIII SiIV SIII Ly'+bet+' Ly'+gam+ ' Ly'+delt+ ' Ly5 Ly6', 'HI Ly'+bet+ ' Ly'+gam+' Ly'+delt+ ' Ly5 Ly6'], charsize = 1.4, charthick = 6, textcolors =[djs_icolor('gray'), djs_icolor('black'), djs_icolor('blue')],box = 0
dfpsclose

end