function fitting_main, galfile, linefile, groups, wltoinclude, params,abs_dat = abs_dat

; Define paramters
if tag_exist(params, 'fitchoice') then fitchoice = params.fitchoice else fitchoice = 2
if tag_exist(params, 'vdisp') then vdisp = params.vdisp else vdisp = 20.
if tag_exist(params, 'solarmodels') then solarmodels = params.solarmodels else solarmodels ='Z'
if tag_exist(params, 'removelist') then removelist = params.removelist else removelist = []
if tag_exist(params, 'light_arr') then light_arr = params.light_arr
if tag_exist(params, 'fixstell') then fixstell = params.fixstell else fixstell = 0
if tag_exist(params, 'ebv_coef') then ebv_coef = params.ebv_coef
if tag_exist(params, 'fixebv') then fixebv = params.fixebv else fixebv = 0
if tag_exist(params, 's') then s = params.s else s = mrdfits(galfile, 1)
if tag_exist(params, 'MW') then MWinclude = params.MW else MWinclude = 1.
if tag_exist(params, 'dust_model') then dust_model = params.dust_model else dust_model=0.
if tag_exist(params, 'ebvlaw') then ebvlaw = params.ebvlaw else ebvlaw=4.

; Open galaxy file and models

;s.flux[where(s.flux lt 0)] = 0.
if solarmodels eq 'Z005' then models = mrdfits('Models/sb99001.fits', 1)
if solarmodels eq 'Z02' then models = mrdfits('Models/sb99004.fits', 1) 
if solarmodels eq 'Z04' then models = mrdfits('Models/sb99008.fits', 1) 
if solarmodels eq 'Z' then models = mrdfits('Models/models.fits', 1)
if solarmodels eq '2Z' then models = mrdfits('Models/sb9904.fits', 1)

nmodels = n_elements(models.age)

for ii = 0, nmodels - 1 do begin & $  
    models.flux[*,ii] = models.flux[*,ii]/median(models.flux[where(models.wave gt 1047 and models.wave lt 1050),ii]) & $ 
endfor

; Create index array for the fitting region


good_reg = []
reg_arr=[]
for ii = 0, wltoinclude.count()-1 DO BEGIN & $
  interv = wltoinclude[ii] & $
  reg_arr = [[reg_arr], [wltoinclude[ii]]] & $
  good_reg = [good_reg, where(s.wave gt interv[0] and s.wave lt interv[1])] & $
  ;jj= jj+1
  ;wltoinclude.remove, 0 & $
ENDfor


if fitchoice eq 1 then begin 
    options = {name:'Options for the fitting',$
    fitChoice:fitChoice,$ ; 1; fitting of stellar continuum and absorption lines, 2; fitting only stellar continuum to get absorption spectrum, 3; Fitting absorption spectru,
    z:s.z,$
    ebv:ebvlaw} ; 
        

    cont_params = s99_continuum_o6(models, s.wave, s.flux, s.err, good_reg, vdisp, options, yfit = cont_fit)
    fit_result = CREATE_STRUCT(cont_params, 'fit', cont_fit)
    
endif else begin
    
    RESTORE, 'DataTemplate.sav'
    lines = READ_ASCII(linefile, TEMPLATE = myTemplate)
    name = lines.name
    wave = lines.wave
    fcoef = lines.f
    Acoef = lines.a
    species = lines.species
       
    
    MWwave = lines.wave/(1+s.z)
    
    nlines = n_elements(lines.wave)
    index_arr = intarr(nlines) 
    index_MW_arr = intarr(nlines) +1
    
    for kk = 0, groups.count()-1 DO BEGIN 
        group_it = groups[kk]
        for ii = 0, n_elements(group_it.species)-1 do begin 
            index_arr[where(species eq group_it.species[ii])] = 1          
        endfor 
    endfor
    
    for ii = 0, nlines -1 do begin & $
        if (total(lines.wave[ii] gt (reg_arr[0,*]+0.1) and lines.wave[ii] lt (reg_arr[1,*]-0.1)) eq 0) or (total(lines.name[ii] eq removelist) ne 0)  then index_arr[ii] = 0 & $
        if total(MWwave[ii] gt (reg_arr[0,*]+0.5) and MWwave[ii] lt (reg_arr[1,*]-0.5)) eq 0 then index_MW_arr[ii] = 0 & $
    endfor

    
    species_uniq = species[uniq(species)]
    species_exclude = []
    species_include = []
    for ii = 0, n_elements(species_uniq)-1 do begin
        if total(index_arr[where(species eq species_uniq[ii])]) eq 0 then begin 
        print, 'Caution, ' + species_uniq[ii] + ' not fitted'   
        species_exclude = [species_exclude, species_uniq[ii]]
        endif else begin
       print, species_uniq[ii] + ' has '+ string(fix(total(index_arr[where(species eq species_uniq[ii])]))) +' lines fitted'
       species_include = [species_include, species_uniq[ii]]
       endelse
    endfor
    
    species_MW_include = []
    for ii = 0, n_elements(species_uniq)-1 do begin
        if total(index_MW_arr[where(species eq species_uniq[ii])]) ne 0 and MWinclude ne 0 then begin 
       print, 'Milky Way ' + species_uniq[ii] + ' has '+ string(fix(total(index_MW_arr[where(species eq species_uniq[ii])]))) +' lines fitted'
       species_MW_include = [species_MW_include, species_uniq[ii]]
       endif
    endfor
    
    if n_elements(species_MW_include) eq 0 then species_MW_include = 0
    
    groups_copie = groups
    if n_elements(species_exclude) gt 0 then begin
      kk = 0
      WHILE (1) DO BEGIN & $
          temp = groups_copie[kk] & $
         temp2 = temp.species & $
        for jj = 0, n_elements(species_exclude)-1 do begin & $
          if n_elements(temp2) eq 1 then begin  & $
              if temp2 eq species_exclude[jj] then begin & $
              groups_copie.remove, kk  & $
              kk = kk -1
              break & $
              endif & $
          endif & $
          if n_elements(temp2) gt 1 then begin          & $
              remove, where(temp2 eq species_exclude[jj]), temp2   & $
              struct_replace_field, temp, 'species', temp2 & $
              groups_copie[kk] = temp & $
          endif & $
        endfor & $
        kk = kk +1 & $
        if kk ge n_elements(groups_copie) then break & $
      endwhile & $
      
    remove, where(index_arr eq 0 and index_MW_arr eq 0), name, wave, acoef, fcoef, species, index_arr, index_MW_arr
    species_uniq = species[uniq(species)]  
    endif
    
 

    
    nlines = n_elements(name)
    ngroup = n_elements(groups_copie)
    nspeciesGal=n_elements(species_include)
    nspeciesMW=n_elements(species_MW_include)
    group_arr = dblarr(nlines)
    cf_fix_arr = dblarr(ngroup)
    cf_lim_arr = fltarr(ngroup)+0.1
    cf_val_arr = fltarr(ngroup)+1
    b_fix_arr = dblarr(ngroup)
    b_val_arr = fltarr(ngroup)+50
    v_fix_arr = dblarr(ngroup)
    v_val_arr = fltarr(ngroup)
    log_n_fix_arr = dblarr(nspeciesGal)
    log_n_val_arr = fltarr(nspeciesGal) + 15.
    log_n_lim_arr = fltarr(nspeciesGal) + 19.
    indexspec = 1
    indexspecMW = 1
    
    for kk = 0, groups_copie.count()-1 DO BEGIN 
        group_it = groups_copie[kk]
        for ii = 0, n_elements(group_it.species)-1 do begin 
            group_arr[where(species eq group_it.species[ii])] = kk 
           if tag_exist(group_it, 'log_n_fix') then log_n_fix_arr[indexspec-1] = group_it.log_n_fix 
           if tag_exist(group_it, 'log_n_val') then log_n_val_arr[indexspec-1]= group_it.log_n_val  
           if tag_exist(group_it, 'log_n_lim') then log_n_lim_arr[indexspec-1] = group_it.log_n_lim 
           if total(species eq group_it.species[ii] and index_arr ne 0) ne 0 then begin
           index_arr[where(species eq group_it.species[ii] and index_arr ne 0)] = indexspec 
           indexspec = indexspec +1
           endif
        endfor 
         if tag_exist(group_it, 'cf_fix') then cf_fix_arr[kk] = group_it.cf_fix 
         if tag_exist(group_it, 'cf_lim') then cf_lim_arr[kk] = group_it.cf_lim
         if tag_exist(group_it, 'cf_val') then cf_val_arr[kk] = group_it.cf_val
         if tag_exist(group_it, 'b_fix') then b_fix_arr[kk] = group_it.b_fix 
         if tag_exist(group_it, 'b_val') then b_val_arr[kk] = group_it.b_val
         if tag_exist(group_it, 'v_fix') then v_fix_arr[kk] = group_it.v_fix 
         if tag_exist(group_it, 'v_val') then v_val_arr[kk] = group_it.v_val
    endfor
    
    for ii = 0, n_elements(uniq(species))-1 do begin
           if total(species eq species_uniq[ii] and index_MW_arr ne 0) ne 0 then begin
           index_MW_arr[where(species eq species_uniq[ii] and index_MW_arr ne 0)] = indexspecMW
           indexspecMW = indexspecMW +1
           endif
    endfor

    lines_fit = {name: name, wave: wave, f: fcoef, a:acoef, species:species, index_arr:index_arr , index_MW_arr:index_MW_arr, group_arr:group_arr}
    
    if fitchoice eq 2 then begin
        options = {name:'Options for the fitting',$
        fitChoice:fitChoice,$ ; 1; fitting of stellar continuum and absorption lines, 2; fitting only stellar continuum to get absorption spectrum, 3; Fitting absorption spectru,
        z:s.z,$
        ebv:ebvlaw, $; choice of extinction law: 1; Calzetti for lam>12 microns, 2; leitherer02, 3; Calzetti from Reddy16, 4; Reddy from Reddy16
        lines:lines_fit,$
        nspeciesGal:nspeciesGal,$
        nspeciesMW:nspeciesMW,$
        ngroup:ngroup,$
        group_arr:group_arr,$
        index_arr:index_arr,$
        index_MW_arr:index_MW_arr,$
        cf_fix_arr:cf_fix_arr,$
        cf_lim_arr:cf_lim_arr,$
        cf_val_arr:cf_val_arr,$
        b_val_arr:b_val_arr,$
        b_fix_arr:b_fix_arr,$
        v_val_arr:v_val_arr,$
        v_fix_arr:v_fix_arr,$
        log_n_fix_arr:log_n_fix_arr,$
        log_n_val_arr:log_n_val_arr,$
        log_n_lim_arr:log_n_lim_arr,$
        light_arr:params.light_arr,$
        fixstell: fixstell,$
        ebv_coef:params.ebv_coef,$
        fixebv:fixebv,$
        MW : MWinclude,$
        dust_model :dust_model}
        
        cont_params = s99_continuum_o6(models, s.wave, s.flux, s.err, good_reg, vdisp, options, yfit = cont_fit)
    endif
    
    if fitchoice eq 3 then begin
        options = {name:'Options for the fitting',$
        fitChoice:fitChoice,$ ; 1; fitting of stellar continuum and absorption lines, 2; fitting only stellar continuum to get absorption spectrum, 3; Fitting absorption spectru,
        z:s.z,$
        lines:lines_fit,$
        nspeciesGal:nspeciesGal,$
        nspeciesMW:nspeciesMW,$
        ngroup:ngroup,$
        group_arr:group_arr,$
        index_arr:index_arr,$
        index_MW_arr:index_MW_arr,$
        cf_fix_arr:cf_fix_arr,$
        cf_lim_arr:cf_lim_arr,$
        cf_val_arr:cf_val_arr,$  
        b_val_arr:b_val_arr,$
        b_fix_arr:b_fix_arr,$
        v_val_arr:v_val_arr,$
        v_fix_arr:v_fix_arr,$  
        log_n_fix_arr:log_n_fix_arr,$
        log_n_val_arr:log_n_val_arr,$
        log_n_lim_arr:log_n_lim_arr,$
        splineMod: 0,$
         light_arr:params.light_arr,$
        fixstell: fixstell,$
        ebv_coef:params.ebv_coef,$
        fixebv:fixebv,$
        MW : MWinclude,$
        ebv: ebvlaw}; 0; no spline correction, 1; spline correction 

        abs_dat =  Absspec(s.wave, s.flux, s.err, models, light_arr, ebv_coef, vdisp)
        abs_dat = create_struct(abs_dat, 'z', s.z)
        cont_params = s99_continuum_o6(models, abs_dat.wave, abs_dat.flux, abs_dat.err, good_reg, vdisp, options, yfit = cont_fit)
         cont_params.light_frac = light_arr
        cont_params.ebv = ebv_coef 
    endif

fit_result = CREATE_STRUCT('lines', lines_fit, 'speciesGal', species_include, 'speciesMW', species_MW_include, cont_params, 'fit', cont_fit)

endelse
return, fit_result
end
;