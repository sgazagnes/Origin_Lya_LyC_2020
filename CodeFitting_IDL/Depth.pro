vmin = -1000
vmax = 500
vfcovmin =-100
vfcovmax =200


vlyb = (absorp.wave/1025.762 -1) * 2.99e5
plot, vlyb, absorp.flux, xr=[-1000,1000], yr =[0,2]

interv = where(vlyb gt vmin  and vlyb lt vmax)
err = absorp.err[interv]
flux = absorp.flux[interv]
v_temp = vlyb[interv]

shift_arr = fltarr(n_elements(interv))
 max_shift = fltarr(1000)
for ii = 0,999 do begin & $
for jj = 0,n_elements(interv)-1 do begin & $
shift_arr[jj] = err[jj] * randomn(seed, 1) & $
endfor &$
flux_temp = flux + shift_arr & $
flux_temp[where(flux_temp lt 0)] = 0 & $
max_shift[ii] = median(1-flux_temp[where(v_temp gt vfcovmin  and v_temp lt vfcovmax)]) & $
endfor
print, median(max_shift)
print, stddev(max_shift)


       ; line =  lyb_ab(s.wave, 0, 20/2.35, 15, 1193.28/(1+s.z), 0.575,2.69e9, 1.,0,params_out.ebv, vdisp=vdisp) ;This calls an ancilary functneut to generate the LyB profile       
    ;   plot, s.wave, line, xr = [1020,1030] 
       ;  tosaveis = tosaveis/line & $  
;

 
vlyg = (absorp.wave/972.5368 -1) * 2.99e5
plot, vlyg, absorp.flux, xr=[-1000,1000]

interv = where(vlyg gt vmin  and vlyg lt vmax)
err = absorp.err[interv]
flux = absorp.flux[interv]
v_temp = vlyg[interv]

shift_arr = fltarr(n_elements(interv))
 max_shift = fltarr(1000)
for ii = 0,999 do begin & $
for jj = 0,n_elements(interv)-1 do begin & $
shift_arr[jj] = err[jj] * randomn(seed, 1) & $
endfor &$
flux_temp = flux + shift_arr & $
flux_temp[where(flux_temp lt 0)] = 0 & $
max_shift[ii] = median(1-flux_temp[where(v_temp gt vfcovmin  and v_temp lt vfcovmax)]) & $
endfor
print, median(max_shift)
print, stddev(max_shift)



vlyd = (absorp.wave/949.7431 -1) * 2.99e5
plot, vlyd, absorp.flux, xr=[-1000,1000]
;djs_oplot, [vmin,vmin],[-1,2], color = 'red'
;djs_oplot, [vmax,vmax],[-1,2], color = 'red'
;  lydcf = median(1-absorp.flux[where(vlyd gt vmin and vlyd lt vmax and absorp.flux ge 0)])
; lydcf_err = sqrt(1/total(1/absorp.err[where(vlyd gt vmin and vlyd lt vmax and absorp.flux ge 0)]^2))
; print, string(lydcf) +'+-'+ string(lydcf_err)
 interv = where(vlyd gt vmin  and vlyd lt vmax)
err = absorp.err[interv]
flux = absorp.flux[interv]
v_temp = vlyd[interv]

shift_arr = fltarr(n_elements(interv))
 max_shift = fltarr(1000)
for ii = 0,999 do begin & $
for jj = 0,n_elements(interv)-1 do begin & $
shift_arr[jj] = err[jj] * randomn(seed, 1) & $
endfor &$
flux_temp = flux + shift_arr & $
flux_temp[where(flux_temp lt 0)] = 0 & $
max_shift[ii] = median(1-flux_temp[where(v_temp gt vfcovmin  and v_temp lt vfcovmax)]) & $
endfor
print, median(max_shift)
print, stddev(max_shift)
 

 vly5 = (absorp.wave/937.8035 -1) * 2.99e5
plot, vly5, absorp.flux, xr=[-1000,1000]
;djs_oplot, [vmin,vmin],[-1,2], color = 'red'
;djs_oplot, [vmax,vmax],[-1,2], color = 'red'
;  ly5cf = median(1-absorp.flux[where(vly5 gt vmin and vly5 lt vmax and absorp.flux ge 0)])
; ly5cf_err = sqrt(1/total(1/absorp.err[where(vly5 gt vmin and vly5 lt vmax and absorp.flux ge 0)]^2))
; print, string(ly5cf) +'+-'+ string(ly5cf_err)
  interv = where(vly5 gt vmin  and vly5 lt vmax)
err = absorp.err[interv]
flux = absorp.flux[interv]
v_temp = vly5[interv]

shift_arr = fltarr(n_elements(interv))
 max_shift = fltarr(1000)
for ii = 0,999 do begin & $
for jj = 0,n_elements(interv)-1 do begin & $
shift_arr[jj] = err[jj] * randomn(seed, 1) & $
endfor &$
flux_temp = flux + shift_arr & $
flux_temp[where(flux_temp lt 0)] = 0 & $
max_shift[ii] = median(1-flux_temp[where(v_temp gt vfcovmin  and v_temp lt vfcovmax)]) & $
endfor
print, median(max_shift)
print, stddev(max_shift)
 
 
 vly6 = (absorp.wave/930.751 -1) * 2.99e5
plot, vly6, absorp.flux, xr=[-1000,1000]
;djs_oplot, [vmin,vmin],[-1,2], color = 'red'
;djs_oplot, [vmax,vmax],[-1,2], color = 'red'
;  ly5cf = median(1-absorp.flux[where(vly5 gt vmin and vly5 lt vmax and absorp.flux ge 0)])
; ly5cf_err = sqrt(1/total(1/absorp.err[where(vly5 gt vmin and vly5 lt vmax and absorp.flux ge 0)]^2))
; print, string(ly5cf) +'+-'+ string(ly5cf_err)
interv = where(vly5 gt vmin  and vly5 lt vmax)
err = absorp.err[interv]
flux = absorp.flux[interv]
v_temp = vly5[interv]

shift_arr = fltarr(n_elements(interv))
max_shift = fltarr(1000)
for ii = 0,999 do begin & $
  for jj = 0,n_elements(interv)-1 do begin & $
  shift_arr[jj] = err[jj] * randomn(seed, 1) & $
endfor &$
flux_temp = flux + shift_arr & $
flux_temp[where(flux_temp lt 0)] = 0 & $
max_shift[ii] = median(1-flux_temp[where(v_temp gt vfcovmin  and v_temp lt vfcovmax)]) & $
endfor
print, median(max_shift)
print, stddev(max_shift)


vly7 = (absorp.wave/926.249 -1) * 2.99e5
plot, vly7, absorp.flux, xr=[-1000,1000]
;djs_oplot, [vmin,vmin],[-1,2], color = 'red'
;djs_oplot, [vmax,vmax],[-1,2], color = 'red'
;  ly5cf = median(1-absorp.flux[where(vly5 gt vmin and vly5 lt vmax and absorp.flux ge 0)])
; ly5cf_err = sqrt(1/total(1/absorp.err[where(vly5 gt vmin and vly5 lt vmax and absorp.flux ge 0)]^2))
; print, string(ly5cf) +'+-'+ string(ly5cf_err)
interv = where(vly5 gt vmin  and vly5 lt vmax)
err = absorp.err[interv]
flux = absorp.flux[interv]
v_temp = vly5[interv]

shift_arr = fltarr(n_elements(interv))
max_shift = fltarr(1000)
for ii = 0,999 do begin & $
  for jj = 0,n_elements(interv)-1 do begin & $
  shift_arr[jj] = err[jj] * randomn(seed, 1) & $
endfor &$
flux_temp = flux + shift_arr & $
flux_temp[where(flux_temp lt 0)] = 0 & $
max_shift[ii] = median(1-flux_temp[where(v_temp gt vfcovmin  and v_temp lt vfcovmax)]) & $
endfor
print, median(max_shift)
print, stddev(max_shift)

; 
; 
; lya = lyb_ab(s.wave, -170, 177.5, 20.21, 1215.6701, 0.4641,4.6986e8,1, vdisp=75)
;  
;  liminf=1203
;  limout=1225
;  
;  print, int_tabulated(s.wave[where(s.wave gt liminf and s.wave lt limout)],absorp.flux[where(s.wave gt liminf and s.wave lt limout)]-1)
;    plotfit, s, params_out, [1190,1250], params.vdisp, 1, 0, 0, 2
    
    
vlyb = (s.wave/1025.762 -1) * 2.99e5
vlyg = (s.wave/972.517 -1) * 2.99e5
vlyd = (s.wave/949.742 -1) * 2.99e5
vly5 = (s.wave/937.814 -1) * 2.99e5
vly6 = (s.wave/930.751 -1) * 2.99e5

dfpsplot,  'Fits/'+galaxy+ 'ly2.ps', /landscape, /color
!x.margin = [30,30]
!y.margin = [10,10]
plot, vlyg, s.flux, xr=[-500,500], yr = [0,1.2], thick = 15, psym = 10, linestyle = 4
djs_oplot, vlyg, s.flux, xr=[-500,500], thick = 15, psym = 10, color = 'blue';,linestyle = 2
djs_oplot, vly5, s.flux, xr=[-500,500], thick = 15, psym = 10, color = 'red' ;linestyle = 2
dfpsclose




err = absorp.err
flux = absorp.flux
vlyg = (absorp.wave/972.517 -1) * 2.99e5
vlyd = (absorp.wave/949.742 -1) * 2.99e5
;vlyg = (absorp.wave/926.249 -1) * 2.99e5
;vlyd = (absorp.wave/920.947 -1) * 2.99e5


vmina =-1000
vmaxa =200

interv_n = min([n_elements(where(vlyg gt vmina  and vlyg lt vmaxa)),n_elements(where(vlyd gt vmina  and vlyd lt vmaxa))])

shift_arr = fltarr(interv_n)
max_shiftcf = fltarr(1000,interv_n)
max_shifttau = fltarr(1000,interv_n)
cf = fltarr(interv_n)

err_spe = err[where(vlyg gt vmina  and vlyg lt vmaxa)]
vplot = vlyd[where(vlyd gt vmina  and vlyd lt vmaxa)]

for ii = 0,999 do begin & $
  for jj = 0,interv_n-1 do begin & $
  shift_arr[jj] = err_spe[jj] * randomn(seed, 1) & $
  endfor & $
fluxa = flux[where(vlyd gt vmina  and vlyd lt vmaxa)] + shift_arr & $
fluxb = flux[where(vlyg gt vmina  and vlyg lt vmaxa)] + shift_arr & $

fluxa[where(fluxa lt 0)] = 0 & $
cf = (fluxa^2 - 2 * fluxa +1)/(fluxb- 2 * fluxa +1) & $
tau = alog(cf/(cf + fluxa -1)) & $

cf[where(cf lt 0)] = 0 & $
cf[where(cf gt 1)] = 1 & $
max_shiftcf[ii,*] = cf & $
max_shifttau[ii,*] = tau & $
endfor

cf = mean(max_shiftcf,dimension=1)
cf_err = stddev(max_shiftcf, dimension=1)
tau = mean(max_shifttau,dimension=1, /NAN)
tau_err = stddev(max_shifttau, dimension=1, /NAN)

cf[where(cf lt 0)] = 0
tau[where(tau lt 0)] = 0
plot, vplot, cf
plot, vplot, tau

headl = ['V', 'Cf', 'Cferr', 'Tau', 'Tau_err']
;value_arr = [[cf],[transpose(tau)]]
;err_arr = [[transpose(cf_err)],[transpose(fltarr(tau_err))]];
write_csv, galaxy+'taucf.csv', vplot, cf, cf_err,tau,tau_err, header =headl
;
;


    end