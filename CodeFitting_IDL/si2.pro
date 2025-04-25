; Si II study


vsi2 = (absorp.wave/1260.4221 -1) * 2.99e5

plot, vsi2,absorp.flux, xr=[-10000,10000]

vmin =600
vmax =800


interv = where(vsi2 gt -1000  and vsi2 lt 1500)
err = absorp.err[interv]
flux = absorp.flux[interv]
v_temp = vsi2[interv]

shift_arr = fltarr(n_elements(interv))
 max_shift = fltarr(1000)
for ii = 0,999 do begin & $
for jj = 0,n_elements(interv)-1 do begin & $
shift_arr[jj] = err[jj] * randomn(seed, 1) & $
endfor &$
flux_temp = flux + shift_arr & $
flux_temp[where(flux_temp lt 0)] = 0 & $
max_shift[ii] = median(1-flux_temp[where(v_temp gt vmin  and v_temp lt vmax)]) & $
endfor
print, median(max_shift)
print, stddev(max_shift)


vsi2cf = median(1-absorp.flux[where(vsi2 gt vmin  and vsi2 lt vmax and absorp.flux ge 0)])
 vsi2cf_err = sqrt(1/total(1/absorp.err[where(vsi2 gt vmin and vsi2 lt vmax and absorp.flux ge 0)]^2)) 
 ;;print, '1260: ' +string(vsi2cf) +'+-'+ string(vsi2cf_err)
 

vsi2a = (absorp.wave/1190.42 -1) * 2.99e5
vsi2b = (absorp.wave/1193.28 -1) * 2.99e5

plot, vsi2a, absorp.flux, xr=[-1000,2000]
;djs_oplot, vsi2a, absorp.err, color = 'green'

vmina =-200
vmaxa =00

interv = where(vsi2a gt -1000  and vsi2a lt 1000)
err =absorp.err[interv]
flux = absorp.flux[interv]

vtemp_a = vsi2a[interv]
vtemp_b = vsi2b[interv]
interv2a = where(vtemp_a gt vmina  and vtemp_a lt vmaxa)
interv2b = where(vtemp_b gt vmina  and vtemp_b lt vmaxa)

;err = err*0 + stddev(flux[where(vtemp_a gt vmina  and vtemp_a lt vmaxa)]) 
npix = n_elements(interv)
;cf = fltarr(npix)

;cf_err =  sqrt( (absorp.err[where(vsi2a gt vmina  and vsi2a lt vmaxa)]*(2* absorp.flux[where(vsi2a gt vmina  and vsi2a lt vmaxa)]-2 + 2 *cf )/(absorp.flux[where(vsi2b gt vmina  and vsi2b lt vmaxa)] - 2 * absorp.flux[where(vsi2a gt vmina  and vsi2a lt vmaxa)] +1))^2$
; +  ( (absorp.err[where(vsi2b gt vmina  and vsi2b lt vmaxa)] *cf )/(absorp.flux[where(vsi2b gt vmina  and vsi2b lt vmaxa)]- 2 * absorp.flux[where(vsi2a gt vmina  and vsi2a lt vmaxa)] +1))^2)
;
npix = n_elements(interv)
cf = fltarr(npix)
flux[where(flux lt 0)] = 0 
cf = (flux[where(vtemp_a gt vmina  and vtemp_a lt vmaxa)]^2 - 2 * flux[where(vtemp_a gt vmina  and vtemp_a lt vmaxa)] +1)/(flux[where(vtemp_b gt vmina  and vtemp_b lt vmaxa)]- 2 * flux[where(vtemp_a gt vmina  and vtemp_a lt vmaxa)] +1) 
cf_err =  sqrt( (absorp.err[where(vsi2a gt vmina  and vsi2a lt vmaxa)]*(2* absorp.flux[where(vsi2a gt vmina  and vsi2a lt vmaxa)]-2 + 2 *cf )/(absorp.flux[where(vsi2b gt vmina  and vsi2b lt vmaxa)] - 2 * absorp.flux[where(vsi2a gt vmina  and vsi2a lt vmaxa)] +1))^2$
 +  ( (absorp.err[where(vsi2b gt vmina  and vsi2b lt vmaxa)] *cf )/(absorp.flux[where(vsi2b gt vmina  and vsi2b lt vmaxa)]- 2 * absorp.flux[where(vsi2a gt vmina  and vsi2a lt vmaxa)] +1))^2)
print,  max(cf[where(cf gt 0 and cf le 1)])
print,  median(cf_err[where(cf gt 0 and cf le 1)])

cf = fltarr(min([n_elements(interv2a),n_elements(interv2b)]))
shift_arr = fltarr(n_elements(interv))
 max_shift = fltarr(1000,min([n_elements(interv2a),n_elements(interv2b)]))
for ii = 0,999 do begin & $
for jj = 0,n_elements(interv)-1 do begin & $
shift_arr[jj] = err[jj] * randomn(seed, 1) & $
endfor & $
flux_temp = flux + shift_arr & $
flux_temp[where(flux_temp lt 0)] = 0 & $
cf = (flux_temp[where(vtemp_a gt vmina  and vtemp_a lt vmaxa)]^2 - 2 * flux_temp[where(vtemp_a gt vmina  and vtemp_a lt vmaxa)] +1)/(flux_temp[where(vtemp_b gt vmina  and vtemp_b lt vmaxa)]- 2 * flux_temp[where(vtemp_a gt vmina  and vtemp_a lt vmaxa)] +1) & $
;cf= smooth(cf,10)
;max_shift[ii,interv] = max(cf[where(cf gt 0 and cf le 1)]) & $
cf[where(cf lt 0)] = 0 & $
cf[where(cf gt 1)] = 1 & $
max_shift[ii,*] =cf & $

endfor
finalav = mean(max_shift,dimension=1)
finalsd = stddev(max_shift, dimension=1)
remove, n_elements(finalav)-1,finalav, finalsd
plot, finalav
;max_shift = mean(max_shift,dimension=1)
print, max(finalav)
 print, mean(finalsd)
;print, stddev(max_shift)
; 


 

;vsi2acf = median(1-absorp.flux[where(vsi2a gt vmina  and vsi2a lt vmaxa and absorp.flux ge 0)])
; vsi2acf_err = sqrt(1/total(1/absorp.err[where(vsi2a gt vmina and vsi2a lt vmaxa and absorp.flux ge 0)]^2)) 
; vsi2bcf = median(1-absorp.flux[where(vsi2b gt vminb  and vsi2b lt vmaxb and absorp.flux ge 0)])
; vsi2bcf_err = sqrt(1/total(1/absorp.err[where(vsi2b gt vminb and vsi2b lt vmaxb and absorp.flux ge 0)]^2)) 
;print, '1190: ' +string(vsi2acf) +'+-'+ string(vsi2acf_err)+ ' and 1193 :' +string(vsi2bcf) +'+-'+ string(vsi2bcf_err)
;
;npix = n_elements(vsi2a[where(vsi2a gt vmina  and vsi2a lt vmaxa)])
;cf = fltarr(npix)
;cf_err = fltarr(npix)
;cf = (absorp.flux[where(vsi2a gt vmina  and vsi2a lt vmaxa)]^2 - 2 * absorp.flux[where(vsi2a gt vmina  and vsi2a lt vmaxa)] +1)/(absorp.flux[where(vsi2b gt vmina  and vsi2b lt vmaxa)]- 2 * absorp.flux[where(vsi2a gt vmina  and vsi2a lt vmaxa)] +1)
;;cf_err =  sqrt( (absorp.err[where(vsi2a gt vmina  and vsi2a lt vmaxa)]*(2* absorp.flux[where(vsi2a gt vmina  and vsi2a lt vmaxa)]-2 + 2 *cf )/(absorp.flux[where(vsi2b gt vmina  and vsi2b lt vmaxa)] - 2 * absorp.flux[where(vsi2a gt vmina  and vsi2a lt vmaxa)] +1))^2$
; ;+  ( (absorp.err[where(vsi2b gt vmina  and vsi2b lt vmaxa)] *cf )/(absorp.flux[where(vsi2b gt vmina  and vsi2b lt vmaxa)]- 2 * absorp.flux[where(vsi2a gt vmina  and vsi2a lt vmaxa)] +1))^2)
;ploterr, vrange, cf, cf_err
;plot, vrange, cf, xr= [-650,0], yr = [-1,3], thick = 4
;djs_oplot, vrange, cf+cf_err, linestyle = 1
;djs_oplot, vrange, cf-cf_err, linestyle = 1
;
;print, median(cf[where(vrange gt -230 and vrange lt -160)])
;print, sqrt(1/total(1/cf_err[where(vrange gt -230 and vrange lt -160)]))
;print, string(cf) + ' +-' + string(cf_err)
;
;cf2 = median(cf)
;cf2_err = sqrt(1/total(1/cf_err^2))
;print, string(cf2) + ' +-' + string(cf2_err)
;;mwrfits, absorp, 'GP0911.fits'
;
;denom = (cf+absorp.flux[where(vsi2a gt vmina  and vsi2a lt vmaxa)]-1)
;denom[where(denom le 0)] = 1e3
;
;tau = alog(cf[where(cf gt 0)]/denom[where(cf gt 0)])
;tau_err = sqrt( (cf_err/cf)^2 + (cf_err^2 + absorp.err[where(vsi2a gt vmina  and vsi2a lt vmaxa)]^2)/((cf+absorp.flux[where(vsi2a gt vmina  and vsi2a lt vmaxa)]-1)^2))
;ploterr, vrange, tau, tau_err
;plot, vrange[where(tau gt 0)], tau[where(tau gt 0)], xr= [-500,0], yr = [-1,3], thick = 4
;; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;
;;plotfit, s, params_out, [1380,1410], params.vdisp, 1, 0, 0, 2
;;
;;vsi4a = (absorp.wave/1393.76 -1) * 2.99e5
;;vsi4b = (absorp.wave/1402.77 -1) * 2.99e5
;;
;;
;;vmina = -200
;;vmaxa = 0
;;vminb = -200
;;vmaxb = 0
;;
;;multiplot,/reset, /default
;;!p.charthick = 4
;;!p.font = 0
;;!Y.MARGIN = [5,1]
;;!y.range = [0,1.5]
;;;!p.YMARGIN = [5,2]
;;multiplot, [1,2], ygap = 0.,mXtitle='Velocity (km/s)',mxTitSize=1.5, mxTitOffset=1.4, mYtitle='Flux',myTitSize=1.5,myTitOffset=1.1
;;plot, vsi4a, absorp.flux, xr=[-2000,2000]
;;djs_oplot, [vmina,vmina],[-1,2], color = 'red'
;;djs_oplot, [vmaxa,vmaxa],[-1,2], color = 'red'
;;multiplot
;;plot, vsi4b, absorp.flux, xr=[-2000,2000]
;;djs_oplot, [vminb,vminb],[-1,2], color = 'red'
;;djs_oplot, [vmaxb,vmaxb],[-1,2], color = 'red'
;; multiplot,/reset, /default 
;;
;;
;;
;;vsi4acf = median(1-absorp.flux[where(vsi4a gt vmina  and vsi4a lt vmaxa and absorp.flux ge 0)])
;; vsi4acf_err = sqrt(1/total(1/absorp.err[where(vsi4a gt vmina and vsi4a lt vmaxa and absorp.flux ge 0)]^2)) 
;; vsi4bcf = median(1-absorp.flux[where(vsi4b gt vminb  and vsi4b lt vmaxb and absorp.flux ge 0)])
;; vsi4bcf_err = sqrt(1/total(1/absorp.err[where(vsi4b gt vminb and vsi4b lt vmaxb and absorp.flux ge 0)]^2)) 
;;print, '1190: ' +string(vsi4acf) +'+-'+ string(vsi4acf_err)+ ' and 1193 :' +string(vsi4bcf) +'+-'+ string(vsi4bcf_err)
;;
;;npix = n_elements(vsi4a[where(vsi4a gt vmina  and vsi4a lt vmaxa)])
;;cf = fltarr(npix)
;;cf_err = fltarr(npix)
;;cf = (absorp.flux[where(vsi4a gt vmina  and vsi4a lt vmaxa)]^2 - 2 * absorp.flux[where(vsi4a gt vmina  and vsi4a lt vmaxa)] +1)/(absorp.flux[where(vsi4b gt vmina  and vsi4b lt vmaxa)]- 2 * absorp.flux[where(vsi4a gt vmina  and vsi4a lt vmaxa)] +1)
;;cf_err =  sqrt( (absorp.err[where(vsi4a gt vmina  and vsi4a lt vmaxa)]*(2* absorp.flux[where(vsi4a gt vmina  and vsi4a lt vmaxa)]-2 + 2 *cf )/(absorp.flux[where(vsi4b gt vmina  and vsi4b lt vmaxa)] - 2 * absorp.flux[where(vsi24a gt vmina  and vsi4a lt vmaxa)] +1))^2$
;; +  ( (absorp.err[where(vsi4b gt vmina  and vsi4b lt vmaxa)] *cf )/(absorp.flux[where(vsi4b gt vmina  and vsi4b lt vmaxa)]- 2 * absorp.flux[where(vsi4a gt vmina  and vsi4a lt vmaxa)] +1))^2)
;;ploterr, vsi4a[where(vsi4a gt vmina  and vsi4a lt vmaxa)], cf, err
;;print, string(cf) + ' +-' + string(cf_err)
;;
;;cf2 = median(cf)
;;cf2_err = sqrt(1/total(1/err^2))
;;print, string(cf2) + ' +-' + string(cf2_err)
;;;mwrfits, absorp, 'J0921A.fits'
;;
;;
;;tau = alog(cf/(cf+absorp.flux[where(vsi4a gt vmina  and vsi4a lt vmaxa)]-1))
;;tau_err = sqrt( (cf_err/cf)^2 + (cf_err^2 + absorp.err[where(vsi4a gt vmina  and vsi4a lt vmaxa)]^2)/((cf+absorp.flux[where(vsi4a gt vmina  and vsi4a lt vmaxa)]-1)^2))
;
;
;vsi2 = (absorp.wave/1260.4221 -1) * 2.99e5
;
;
;
;vmin =-350
;vmax = -150
;
;plot, vsi2,absorp.flux, xr=[-1000,1000]
;djs_oplot, [vmin,vmin],[-1,2], color = 'red'
;djs_oplot, [vmax,vmax],[-1,2], color = 'red'
;
;vrange = vsi2[where(vsi2 gt vmin  and vsi2 lt vmax)]
;
;
;vsi2cf = median(1-absorp.flux[where(vsi2 gt vmin  and vsi2 lt vmax and absorp.flux ge 0)])
; vsi2cf_err = sqrt(1/total(1/absorp.err[where(vsi2 gt vmin and vsi2 lt vmax and absorp.flux ge 0)]^2)) 
; print, '1260: ' +string(vsi2cf) +'+-'+ string(vsi2cf_err)
 
 

end