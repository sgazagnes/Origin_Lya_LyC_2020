; Wavelist:
; 
; GP0911+1831 Stellar Z02 :  list([934,935],[939,942],[947,948],[951,955],[956.5,958],[978,987], [991,997], [1000,1009],[1022,1023], [1026,1029], [1042,1050], [1060,1080],[1087,1108],[1113,1120]);
;             Lines:         list([927.5,939.2],[946,951],[971.4, 972.9], [985,992],[1023.1,1026],[1026.72,1030],[1038,1045])
;             All : list([927.5,939.2],[947,948],[946,955],[956.5,958],[971.4, 972.9], [978,992], [991,997], [1000,1009],[1022,1023], [1023.1,1026], [1026,1029],[1038,1045], [1042,1050], [1060,1080],[1087,1108],[1113,1120]);
;
; GP1054+5238 : Stellar Z02 :  list([939,945],[980,987],[993,1003], [1007,1017],[1047,1050],[1060,1064],[1070,1100],[1130,1135]); 
;               Lines:         list([935.3,938.5],[944.5,955],[985,992], [1000,1015],[1022.8,1026.5],[1027,1027.3],[1027.95,1028],[1028.55,1028.8])
;               All  :         list([925.3,938.5],[939,945],[945,955],[980,992],[993,1015], [1007,1017],[1022.8,1026.5],[1027,1027.3],[1027.95,1028],[1028.55,1028.8],[1047,1050],[1060,1064],[1070,1100],[1130,1135]);

; J1429+0643  : Stellar Z04:   list([981,985],[994,1009],[1021,1023], [1028.5,1029.5],[1045,1060],[1064,1072],[1075,1081],[1086,1087],[1124,1135],[1140,1170])
;                              s.err[where(s.wave gt 1028.5 and s.wave lt 1030)] = 0.05               
;               Lines          list([982,1021.5],[1023.5,1032],[1042,1060])
;               All :          list([981,1032],[1042,1060],[1064,1072],[1075,1081],[1086,1087],[1124,1135],[1140,1170])
;                               s.err[where(s.wave gt 1024.5 and s.wave lt 1030)] = 0.05
;                        
; J0926+4427 : Stellar Z02 :   list([978,986],[991,1009],[1012,1015],[1018,1020],[1041,1060],[1069,1090],[1100,1129],[1133,1173],[1179,1186])
;              Lines:          list([970,1000],[1017,1026.5],[1037,1060])
;                              s.err[where(s.wave gt 1037 and s.wave lt 1042)] = 0.03
;              ALL: list([970,1009],[1012,1015],[1017,1026.5],[1037,1060],[1069,1090],[1100,1129],[1133,1173],[1179,1186])
;              s.err[where(s.wave gt 1037 and s.wave lt 1042)] = 0.03

; J0921+4509  Stellar Z:      list([951.5,954],[1002,1008],[1018,1019],[1021.5, 1023],[1028,1030.5], [1041,1050],[1090,1120],[1130,1170])
;             Lines           list([1018,1026.6],[1027.5, 1038],[1039.1,1039.9],[1042,1050])
;             All:            list([951.5,954],[1002,1008],[1018,1026.6],[1027.5,1038], [1039.1,1039.9] ,[1041,1050],[1090,1150])


; GP1244+0216 : Stellar Z02: list([952,958],[985,987],[992,999],[1000,1008],[1013.5,1015],[1028,1031],[1032.5,1035],[1041,1050],[1086,1095],[1100,1120],[1140,1170]) 
;               Lines:       list([955,960],[970.5,973.05],[974.1,974.2],[974.5,974.6],[1011,1013.2],[1019.2,1021.3],[1022.1,1027.4],[1032,1037.5],[1038,1050]); 
;               All : list([952,960],[970.5,973.05],[974.1,974.2],[974.5,974.6],[985,987],[992,999],[1000,1008],[1011,1013.2],[1013.5,1015],[1019.2,1021.3],[1022.1,1027.4],[1028,1031],[1032.5,1037.5],[1038,1050],[1086,1095],[1100,1120],[1140,1170])


; GP0303-0759 : Stellar Z005 :  list([978,987],[991,1008],[1013,1014],[1016.5,1021],[1022.5,1023.5],[1027.5,1029],[1031,1034],[1051,1060],[1066,1080],[1087,1091],[1125,1143],[1150,1171],[1180,1185])
;               Lines:        list([980,995],[1018,1028.5],[1051,1056])
;               All :   list([978,991],[991,1008],[1013,1014],[1016.5,1029],[1031,1034],[1051,1060],[1066,1080],[1087,1091],[1125,1143],[1150,1171],[1180,1185])

;
; S1226+2152 : Stellar Z02: list([961,964],[980,982],[997,999],[1000,1001],[1002.5,1006],[1013,1015],[1018.5,1019],[1032,1033],[1044.2,1044.5],[1045.2,1045.6],[1048.5,1049],$
 ;                               [1051,1052.2],[1055,1056],[1059,1061],[1064,1070],[1086.5,1087],[1089.5,1091],[1100,1104],[1110.5,1111.5],[1125,1128],[1130,1139],[1148,1149.5],[1151,1154],[1157,1161],$
  ;                              [1194,1197],[1235,1255],[1270,1290],[1306,1316],[1319,1331],[1339,1385],[1430,1475],[1510,1520],[1570,1600],[1620,1660],[1690,1800])
;              Lines        list([929,931.2],[935.5,938.1],[947,947.15],[947.8,951],[968.5,968.7],[969.9,973.4],[974.22,974.35],$
 ;                              [1023.5,1027.5],[1029,1040])
;                            s.err[where(s.wave gt 1028 and s.wave lt 1041)] = 0.05
;             All              list([929,931.2],[935.5,938.1],[947,947.15],[947.8,951],[961,964],[968.5,968.7],[969.9,973.4],[974.22,974.35],[980,982],[997,999],[1000,1001],[1002.5,1006],[1013,1015],[1018.5,1019],[1023.5,1027.5],[1029,1040],[1044.2,1044.5],[1045.2,1045.6],[1048.5,1049],$
;                               [1051,1052.2],[1055,1056],[1059,1061],[1064,1070],[1086.5,1087],[1089.5,1091],[1100,1104],[1110.5,1111.5],[1125,1128],[1130,1139],[1148,1149.5],[1151,1154],[1157,1161],$
;                                [1194,1197],[1235,1255],[1270,1290],[1306,1316],[1319,1331],[1339,1385],[1430,1475],[1510,1520],[1570,1600],[1620,1660],[1690,1800])

;
; S1527         Stellar Z : list([943,944.5],[1000,1007],[1011,1012],[1013.8,1014.8],[1028,1030],[1032,1033],[1040.5,1045.5],[1050,1056],[1068,1074],[1090,1098],[1105,1120],[1180,1185],[1194,1195],[1243,1253],$
;                                [1270,1330],[1340,1350],[1365,1390],[1410,1455],[1470,1480],[1490,1660],[1680,1690],[1710,1900],[1950,2000])             
;                Lines      list([938.8,938.9],[948.8,950.28],[950.63,950.7],[951.4,952], [970.3,970.37], [970.7,973.79],$
;                                [974.4,974.5],[1000,1010],[1021.5,1022.7],[1022.8,1026.3],[1027.35,1027.6],[1027.8,1027.9],$
;                                [1028.39,1028.5],[1028.75,1029.9],[1030,1032.5],[1034.5,1047],[1051,1056]) 
;               All        list([938.8,938.9],[943,944.5],[948.8,950.28],[950.63,950.7],[951.4,952], [970.3,970.37], [970.7,973.79], [974.4,974.5],[1000,1007],[1011,1012],[1013.8,1014.8],[1021.5,1022.7],$
;                          [1022.8,1026.3],[1027.35,1027.6],[1027.8,1027.9],[1028,1033],[1034.5,1047],[1050,1056],[1068,1074],[1090,1098],[1105,1120],[1180,1185],[1194,1195],[1243,1253],$
;                          [1270,1330],[1340,1350],[1365,1390],[1410,1455],[1470,1480],[1490,1660],[1680,1690],[1710,1900],[1950,2000])

; Cosmic eye :  Stellar Z : list([957,958],[983,985],[1002.5,1008],[1010.8,1011.5],[1016,1019],[1044.5,1045.5],[1052,1054],[1074,1077],[1080,1080],[1119,1120],[1138.1,1140.5],[1245,1255],[1280,1295],[1320,1330],$
;                                [1340,1350],[1365,1390],[1410,1455],[1470,1480],[1490,1660],[1680,1690])
;
;               Lines:        list([935,943],[947.2,947.3],[947.75,947.81],[948.25,951.3],[970.6,972.9],[1018,1019.6],[1022.1,1028.89],$
;                                [1029.5,1032.4],[1033,1041])
;               All : list([935,943],[947.2,947.3],[947.75,947.81],[948.25,951.3],[957,958],[970.6,972.9],[983,985],[1002.5,1008],[1010.8,1011.5],[1016,1019.6],[1022.1,1028.89], [1029.5,1032.4],[1033,1041],[1044.5,1045.5],[1052,1054],[1074,1077],[1080,1080],[1119,1120],[1138.1,1140.5],[1245,1255],[1280,1295],[1320,1330],$
;               [1340,1350],[1365,1390],[1410,1455],[1470,1480],[1490,1660],[1680,1690])
;
;
;J1503 z = 0.3557: Stellar Z02 list([934,936],[940,947.5],[952,970], [979,983],[992,1009],[1015,1020],[1022,1023],[1027.5,1027.8],[1029, 1030.5],[1034.3,1035.1],[1039,1041],[1048,1060],$
;                                   [1065,1100],[1125,1140],[1147,1153],[1160,1183],[1230,1258],[1270,1300]);,[1175,1082])  ;,[1170,1210]
;                              s.err[where(s.wave gt 1028 and s.wave lt 1041)] = 0.05
;                  Lines       list([932,953],[965,980],[980.5,991],[1018,1038],[1038,1045])
;                  All :       list([932,970], [965,980],[980.5,991],[992,1009],[1015,1038],[1038,1045],[1048,1060],$
;                  [1065,1100],[1125,1140],[1147,1153],[1160,1183],[1230,1258],[1270,1300]);,[1175,1082])  ;,[1170,1210]
;                   s.err[where(s.wave gt 1028 and s.wave lt 1041)] = 0.05
;
;J0925 z = 0.3013 Stellar Z02 : list([980,985],[992,1000],[1003,1006],[1013,1023.4],[1028,1028.8],[1033.5,1034.5],[1040,1047],[1049.5,1050],$
 ;                                   [1055,1056],[1080,1165],[1180,1200],[1235,1280])
  ;                              s.err[where(s.wave gt 1023 and s.wave lt 1041)] = 0.1
;                                s.err[where(s.wave gt 990 and s.wave lt 1010)] = 0.1
;                 Lines          list([980,1010],[1019,1040],[1040,1060])
;                   All           list([980,1010],[1013,1040],[1040,1047],[1049.5,1050],$
;                               [1055,1056],[1080,1165],[1180,1200],[1235,1280])

;
;J1152 z = 0.3419 Stellar Z02:  list([955,968],[981,985],[993,1003],[1017,1019.5],[1026.9,1027.1],[1027.7,1028.3],[1032,1034.5],[1039.5,1042],$
;                                    [1048,1049],[1056,1082.5],[1085.7,1086.2],[1095,1150],[1170,1185],[1240,1300]);
;                               s.err[where(s.wave gt 1023 and s.wave lt 1041)] = 0.1
;                 Lines         list([960,974],[980,995],[1018,1028],[1038,1060])
;                 All          list([955,974],[980,995],[995,1003],[1017,1028.3],[1032,1034.5],[1038,1060],$
;                               [1060,1082.5],[1085.7,1086.2],[1095,1150],[1170,1185],[1240,1300]);
;                                s.err[where(s.wave gt 1023 and s.wave lt 1041)] = 0.05
; 
; 
;J1333 z = 0.3181 Stellar Z005; list([945.5,947],[953,954],[960,967],[984,986],[995.5,996],[997.5,1006],[1016,1018.8],[1028.8, 1029.3], [1030.5,1035],[1039.5,1044.5],$
;                                   [1049,1050], [1056,1061],[1078,1100],[1108,1200],[1230,1250])         
;                 Lines        list([948,950.5],[966.5,967],[969.5,991],[1000,1021],[1023,1030.5],[1035,1050])
;                 All         list([945.5,950.5],[953,954],[960,967],[969.5,991],[995.5,996],[997.5,1006],[1006,1021],[1023, 1035],[1035,1049],$
;                               [1049,1050], [1056,1061],[1078,1100],[1108,1200],[1230,1250])
;
;J1442 z = 0.2937 Stellar Z02  list([953,968],[982,986],[995,1005],[1015,1022.5],[1027,1028.8],[1033, 1034], [1039,1060],$
    ;                               [1065,1100],[1106,1109],[1116,1130],[1140,1151],[1160,1200],[1240,1300])
;                              s.err[where(s.wave gt 1022 and s.wave lt 1041)] = 0.05;
;                 Lines        list([965,982],[980,1000],[1020,1029])
;                    All         list([953,982],[982,995],[995,1005],[1015,1029],[1033, 1034], [1039,1060],$
;                               [1065,1100],[1106,1109],[1116,1130],[1140,1151],[1160,1200],[1230,1300])
;                         change v MW -200
;
;J1154 z = 0.3690 smooth 4 Stellar Z02  list([960,963],[966,967],[978,980],[982,983],[993,999],[1012,1017],[1037,1039],[1041,1041.5],[1043.2,1043.7],$
;                                       [1047,1049],[1067,1068],[1076,1080],[1094,1098],[1150,1160])       
;              Lines :list([935,941],[969.5,980])
;              All :  list([935,941],[960,980],[982,999],[1015,1017],[1029,1035], [1039,1041.5],[1043.2,1043.7],$
                  ; [1047,1049],[1067,1068],[1076,1080],[1094,1098],[1150,1180],[1235,1270])  
;J0901+2119 z = 0.2993 smooth 5 Stellar Z02 list([954,956],[960,968],[975,984],[1016,1017],[1021,1022.5],[1029.5,1033.5],[1040,1045],[1072,1100], [1110,1140], [1230,1260])
;                                             Lines list([960,980], [1020,1050])
;                             All : list([954,958],[960,975],[975,984],[1016,1045],[1072,1100], [1110,1140],[1260,1300])
;                             
;                             
; J1011+1947 z = 0.3322 smooth 5 Stellar Z02 list([940,945],[953,970],[993,1000],[1004,1011],[1040,1045],[1072,1100], [1110,1140], [1230,1260])
;                                Lines :    list([935,941],[970,973.5],[1010,1015],[1020,1026.5],[1030,1043])  
;                             All :  list([933,955],[968,973],[995,1000],[1006,1027],[1030,1039],[1039,1054],[1069,1080],[1088,1100],[1110,1120],[1130,1155],[1240,1300]) 
 ;                           
; J1243+4646  z = 0.4317 smooth 5 Stellar Z005  list([946,948],[960,965],[980,987],[1000,1015],[1021,1021.5],[1038.5,1039],[1042,1060],[1085,1090],[1100,1110],[1125,1131],[1136,1150],[1235,1250])
;                                                     s.err[where(s.wave gt 1038 and s.wave lt 1060)] = 0.1; 
;      
; J1248+4259 z = 0.3629 smooth 5 Stellar Z02 list([942,946],[965,970],[975,987],[990,997],[1004,1011],[1028,1030],[1054,1070],[1087,1095],[1230,1250])
 ;                                 Lines list([930,945],[970,975],[988,991],[1010,1030])
;                                 All  list([930,947],[964,975],[988,1004],[1003,1050],[1054,1070],[1087,1095],[1100,1130],[1230,1250])

; J1256+4509 z = 0.353 smooth 5 Stellar Z02 list([942,948],[995,1004],[1004,1023.5],[1033,1034],[1040,1060],[1070,1095],[1230,1250])
;                                           s.err[where(s.wave gt 1023 and s.wave lt 1034)] = 0.05
;                               Lines       list([920,955],[988,991],[1010,1050])

;                                     All  list([935,960],[980,1050],[1070,1195],[1230,1250])
;  
;  
;Tol1247-232 z = 0.0482 Stellar Z02  list([934.3,936.8],[940,948], [952.5,964.5],[965,970], [995,1012],[1018,1023.8],[1030,1030.5],[1040.5,1058],[1076,1080],[1095,1099],[1110,1120]); 
;                       Lines         list([936.7,941],[949,953],[987,998], [1019.5,1045])
;   s.err[where(s.wave gt 935 and s.wave lt 955)] = 0.05;  
;                       All : list([934.3,941],[941,948], [949,964.5],[965,970], [987,1012],[1018,1045],[1045,1058],[1076,1080],[1095,1099],[1110,1120]);

;Tol0440-381 z = 0.0410 Stellar Z02   list([941,947],[952,967],[993,998],[1001,1018],[1043,1080],[1090,1094],[1100,1109],[1117,1127])
                                      ;s.err[where(s.wave gt 1043 and s.wave lt 1044)] = 0.05;   
                         ; All        list([941,947],[952,960],[993,998],[1001,1043],[1043,1080],[1090,1094],[1100,1109],[1117,1127])
                  
;
;mrk54 z = 0.0451 Stellar Z list([955,967],[998,1004],[1012,1019],[1029,1031],[1043,1060],[1076,1079],[1095,1104],[1115,1121]) 

;
;---------------------------------------------------------------------------------------------
;
; +++++++++++++++++++++++++++++++++++     Fitting routine     ++++++++++++++++++++++++++++++++
; 
;---------------------------------------------------------------------------------------------

galaxy = 'J1248+4259' ; Galaxy to be fit

;------------------------------------
; +++    Milky Way attemuation    +++ 
;------------------------------------
if galaxy eq 'J0921+4509' then ebvMW = 0.016
if galaxy eq 'J1503' then ebvMW = 0.013
if galaxy eq 'J0925' then ebvMW = 0.028
if galaxy eq 'J1152' then ebvMW = 0.017
if galaxy eq 'J1333' then ebvMW = 0.018
if galaxy eq 'J1442' then ebvMW = 0.048
if galaxy eq 'J1154' then ebvMW = 0.016
if galaxy eq 'J0901+2119' then ebvMW = 0.025
if galaxy eq 'J1011+1947' then ebvMW = 0.025
if galaxy eq 'J1243+4646' then ebvMW = 0.012
if galaxy eq 'J1248+4259' then ebvMW = 0.021
if galaxy eq 'J1256+4509' then ebvMW = 0.018
if galaxy eq 'tol1247-232' then ebvMW = 0.078
if galaxy eq 'tol0440-381' then ebvMW = 0.016
if galaxy eq 'mrk54' then ebvMW = 0.014
if galaxy eq 'J0926+4427' then ebvMW = 0.02
if galaxy eq 'J1429+0643' then ebvMW = 0.022
if galaxy eq 'GP0303-0759' then ebvMW = 0.10
if galaxy eq 'GP1244+0216' then ebvMW = 0.020
if galaxy eq 'GP1054+5238' then ebvMW = 0.010
if galaxy eq 'GP0911+1831' then ebvMW = 0.030
if galaxy eq 'S1226+2152' then ebvMW = 0.0213
if galaxy eq 'S1527' then ebvMW = 0.0503
if galaxy eq 'cosmic' then ebvMW = 0.0475

print, 'Fitting '+galaxy+' E(B-V) (MW) = '+string(ebvMW)

;---------------------------------
; +++    Reading data files    +++
;---------------------------------

wlnormaliz_low  = 1047
wlnormaliz_high = 1050

; ++ For fits file/COS files
;
;galaxyfile = galaxy +'/'+galaxy+'.fits'
;s= mrdfits(galaxyfile, 1, header);
;ccm_unred, s.wave*(1+s.z), s.flux, ebvMW, funred
;ccm_unred, s.wave*(1+s.z), s.err, ebvMW, errunred
;s.flux = funred
;s.err = errunred
;s.err = s.err/median(s.flux[where(s.wave gt wlnormaliz_low and s.wave lt wlnormaliz_high)])
;s.flux = s.flux/median(s.flux[where(s.wave gt wlnormaliz_low and s.wave lt wlnormaliz_high)]) ;17-20 or 47-50
;;s.flux = gconv(s.flux,2.5)

; ++ For Izotov files

;RESTORE, 'sTemplate.sav'
;data = READ_ASCII( galaxy +'/'+galaxy+'_g140l_bin3_box5_normalized_err.txt', TEMPLATE = sTemplate)
;z=0.3690; Do't forget to change
;x= data.wave/(1+z)
;flux = data.flux
;err= data.err
;s = {wave:x,flux:flux,err:err,z:z}
;ccm_unred, s.wave*(1+s.z), s.err, ebvMW, errunred
;ccm_unred, s.wave*(1+s.z), s.flux, ebvMW, funred
;s.flux = funred
;s.err = errunred
;s.err = s.err/median(s.flux[where(s.wave gt wlnormaliz_low and s.wave lt wlnormaliz_high)])
;s.flux = s.flux/median(s.flux[where(s.wave gt wlnormaliz_low and s.wave lt wlnormaliz_high)])


; ++ For Leitherer or new leakers

;s= mrdfits(galaxy+'/'+galaxy+'g140lbbin3.fits', 1, header) ; Leitherer
s= mrdfits(galaxy+'/'+galaxy+'g140lbin3.fits', 1, header) ; new leakers
;s= mrdfits(galaxy+'/'+galaxy+'g140la0bin3.fits', 1, header) ; new leakers
z=0.3629
; s= mrdfits(galaxy+'/'+galaxy+'g160mbbin3.fits', 1, header)
s = {wave:s.wave/(1+z),flux:s.flux,err:s.sigma_flux,z:z};
s.flux = smooth(s.flux,3);
s.err = smooth(s.err,3)
s.err = s.err/median(s.flux[where(s.wave gt wlnormaliz_low and s.wave lt wlnormaliz_high)])
s.flux = s.flux/median(s.flux[where(s.wave gt wlnormaliz_low and s.wave lt wlnormaliz_high)])
ccm_unred, s.wave*(1+s.z), s.err, ebvMW, errunred
ccm_unred, s.wave*(1+s.z), s.flux, ebvMW, funred
s.flux = funred
s.err =errunred
s.err = s.err/median(s.flux[where(s.wave gt wlnormaliz_low and s.wave lt wlnormaliz_high)])
s.flux = s.flux/median(s.flux[where(s.wave gt wlnormaliz_low and s.wave lt wlnormaliz_high)])

plot, s.wave, s.flux,  yr =[0,2], xr = [900,1250]
;plot, s.wave, s.flux,  yr =[0,0], xr = [1200,1250]

linefile = 'linelist.csv' ; List of lines to include

;------------------------------------
; +++    Parameters definition    +++
;------------------------------------

groups = list({species:'HI',   cf_fix:0, cf_val :1.,   log_n_fix:0, log_n_val:16, log_n_lim:22 , b_fix :0., b_val :50., v_fix:0,v_val :-0.},$
             {species:'OVI',  cf_fix:1, cf_val :1, log_n_fix:0., log_n_val:14, log_n_lim:18,  b_fix :0., b_val :50. ,v_fix:0,v_val :0.},$
            {species:'OI',   cf_fix:1.,cf_val :1, log_n_fix:0, log_n_val:14., log_n_lim:18,  b_fix :0., b_val :50., v_fix:0,v_val :00.},$
            {species:'CI',  cf_fix:1, cf_val :1, log_n_fix:0, log_n_val:14, log_n_lim:18, b_fix :0., b_val :50.,v_fix:0,v_val :0.},$
              {species:'CII',  cf_fix:1, cf_val :1, log_n_fix:0, log_n_val:14, log_n_lim:18, b_fix :0., b_val :50.,v_fix:0,v_val :0.},$
             {species:'CIII', cf_fix:0, cf_val :1, log_n_fix:0, log_n_val:14.,log_n_lim:18, b_fix :0., b_val :50.,v_fix:0,v_val :0.},$
              {species:'SiII', cf_fix:1, cf_val :1, log_n_fix:0, log_n_val:14., log_n_lim:18, b_fix :0., b_val :50.,v_fix:0,v_val :0.},$
              {species:'SiIII',cf_fix:1},$
              {species:'SiIV', cf_fix:1},$
              {species:'SIII', cf_fix:1})

           
wltoinclude=  list([930,947],[964,970.5],[971.6,975],[988,1004],[1003,1050],[1054,1070],[1087,1095],[1100,1130],[1230,1250])
       s.err[where(s.wave gt 937 and s.wave lt 939)] = 0.15;  
       s.err[where(s.wave gt 1025 and s.wave lt 1026.7)] = 0.15;

params = {fitchoice :2,$ ; 1; Stellar continuum only, 2: Stellar with lines, 3: Lines on removed stellar continuum spectrum1
          vdisp:200./2.3548,$ ; Velocity resolution
          solarmodels: 'Z02',$ ; Stellar model (Z005, Z02, Z04, Z, 2Z)
         ;removelist : ['HI1025', 'CII1036'],$ ; to remove particular lines (name in linelist file)
          light_arr:fltarr(10),$; Initialization of stellar continuum
          fixstell:0,$ ; fixing stellar continuum 
          ebv_coef: fltarr(2),$; Initialization of E(B-V)
          fixebv : 0.,$ ; fixing E(B-V) in gas  (only with fitchoice 2 or 3)
          s:s,$   ; Structure with wavelengths, data, error and z
          MW:1.,$ ;Include  Milky Way Line
          dust_model:0,$ ; 0: screen, 1: no dust in holes ; 2: different ebv in gas or holes
          ebvlaw:4}  ;choice of extinction law: 1; Calzetti for lam>12 microns, 2; leitherer02, 3; Calzetti from Reddy16, 4; Reddy from Reddy16 

;if isa(params_out) ne 0 && params.fitchoice ne 1  then params.light_arr = params_out.light_frac ; Change initialisation of stellar continuum for value of previous fit
;if isa(params_out) ne 0 && params.fitchoice ne 1  then params.ebv_coef = params_out.ebv ; Change initialisation of E(B-V) for value of previous fit
;params.ebv_coef[1] = params.ebv_coef[0]/5;
; Load stellar models 

if params.solarmodels eq 'Z005' then models = mrdfits('Models/sb99001.fits', 1) 
if params.solarmodels eq 'Z02' then models = mrdfits('Models/sb99004.fits', 1) 
if params.solarmodels eq 'Z04' then models = mrdfits('Models/sb99008.fits', 1) 
if params.solarmodels eq 'Z' then models = mrdfits('Models/models.fits', 1)
if params.solarmodels eq '2Z' then models = mrdfits('Models/sb9904.fits', 1)
nmodels = n_elements(models.age)
for ii = 0, nmodels - 1 do begin & $  
    models.flux[*,ii] = models.flux[*,ii]/median(models.flux[where(models.wave gt wlnormaliz_low and models.wave lt wlnormaliz_high),ii]) & $ 
endfor

; Call fitting method

params_out = fitting_main(galaxyfile, linefile, groups, wltoinclude, params, abs_dat = abs_dat)
if params.fitchoice eq 1 then plotfit, s, params_out, [900,1290], params.vdisp, 1, 0, 0 ;
if params.fitchoice eq 1 then stell = params_out ;
if params.fitchoice eq 2 then plotfit, s, params_out, [910,1150], params.vdisp, 1, 1, 1  ;plotfit function to plot all fits. last three digits to display (if 1): fit, H lines, Other lines 
;plotfit, s, params_out, [1010,1050], params.vdisp, 1, 1, 1



exage = total(params_out.light_frac*models.age)/total(params_out.light_frac)
exage = total(params_out.light_frac[0:9]*models.age[0:9])/total(params_out.light_frac[0:9])

print, 'Age of the continuum: ' + string(exage/1e6) +' Myr'
print, 'E(B-V) stell = ' + string(params_out.ebv[0]) + string(params_out.ebv_err[0])
print, 'E(B-V) holes = ' + string(params_out.ebv[1]) + string(params_out.ebv_err[1])

if tag_exist(params_out, 'speciesgal') then print, 'Log(N('+ string(params_out.speciesgal)+')) =' + string(params_out.log_n) +' +- ' + string(params_out.log_n_err)+ ', '
if tag_exist(params_out, 'speciesgal') then print, string(params_out.speciesgal[0]) + ' with covering fraction of ' + string(params_out.fcov[0])+ ' +- ' + string(params_out.fcov_err[0])
if tag_exist(params_out, 'speciesgal') then print, 'B('+ string(params_out.speciesgal)+') =' + string(params_out.b) +' +- ' + string(params_out.b_err)+ ', '
if tag_exist(params_out, 'speciesgal') then print, 'V('+ string(params_out.speciesgal)+') =' + string(params_out.v) +' +- ' + string(params_out.v_err)+ ', '

    
; Continuum removed spectra

light_arr = params_out.light_frac
ebv_coef = params_out.ebv
absorp =  AbsSpec(s.wave, s.flux, s.err, models, light_arr, ebv_coef, params.ebvlaw, params.vdisp) 
absorp = create_struct(absorp, 'z',s.z)


; To save main output results
;
;top = median(s.flux[where(s.wave gt 920 and s.wave lt 1150)]/s.err[where(s.wave gt 920 and s.wave lt 1150)]) ; S/N 
;if (params.fitchoice eq 1) or (params.fixstell eq 0 and params.fixebv eq 0) then begin &$
;light_arr = params_out.light_frac
;light_arr_err = params_out.light_frac_err
;exage = total(params_out.light_frac*models.age)/total(params_out.light_frac) ; Age of stellar continuum
;exage_err=0 &$
;for ii = 0, 9 do begin & $
;tot_temp = 0 &$
;for jj = 0,9 do begin & $
;if jj ne ii then tot_temp = tot_temp + light_arr[jj] &$
;endfor &$
;exage_err = exage_err + (light_arr_err[ii]*models.age[ii]*tot_temp)^2 &$
;endfor &$
;exage_err = sqrt(exage_err)/total(light_arr)^2 &$ ; Error on age of stellar continuum
;ebv_coef = params_out.ebv &$ ; E(B-V) coef
; ebv_err = params_out.ebv_err &$ ; Error of E(B-V)
;endif
;
;if params.fitchoice ne 1 then begin &$
;fcovstring = 'fcov('+params_out.speciesgal+')' &$ 
;lognstring = 'log_n('+params_out.speciesgal+')' &$
;bstring = 'b('+params_out.speciesgal+')' &$
;vstring ='v('+params_out.speciesgal+')' &$
;;if params_out.speciesMW ne 0 then MWlognstring = 'MilkyW_log_n('+params_out.speciesmw+')' &$
;endif

;Save in csv and ps files:
;
;headl = ['Parameter', 'Value', 'Error']
;allstring = [['redshift'],['S/N'],['vdisp'],['Stellar'], ['E(B-V)'],[transpose(fcovstring)],[transpose(lognstring)],[transpose(bstring)],[transpose(vstring)]]
;value_arr = [[s.z],[top],[params.vdisp],[exage],[ebv_coef],[transpose(params_out.fcov)],[transpose(params_out.log_n)],$
;[transpose(params_out.b)],[transpose(params_out.v)]]
;err_arr = [[0],[0],[0],[exage_err],[ebv_err],[transpose(params_out.fcov_err)],[transpose(params_out.log_n_err)],[transpose(params_out.b_err)],[transpose(params_out.v_err)]];
;write_csv, galaxy+'_parameters_free.csv', transpose(allstring), transpose(value_arr),transpose(err_arr), header =headl 
;;write_csv, galaxy+'_parameters_fixNH.csv', transpose(allstring), transpose(value_arr),transpose(err_arr), header =headl 
;;
;lim1=[910,960]
;lim2=[960,1010]
;lim3 =[1010,1060]
;
;;lim1=[900,1000]
;;lim2=[1000,1100]
;;lim3 =[1100,1200]
;
;dfpsplot, galaxy + 'fitA.ps', /landscape, /color
;ang = cgsymbol("angstrom") 
;bet = textoidl('\beta')
;net = textoidl('\neta')
;esp = textoidl('\epsilon')
;delt = textoidl('\delta')
;gam = cgsymbol("gamma") 
;multiplot,/reset, /default
;!p.charthick = 4
;!p.font = 0
;multiplot, [1,3], ygap = 0.03,mXtitle="Wavelength ("+ang+")",mxTitSize=1.5, mxTitOffset=1.4, mYtitle='Normalized Flux',myTitSize=1.5,myTitOffset=1.1,/doxaxis
;plot, s.wave, s.flux, xr = lim1, /xs, yr = [0,2], thick = 8
;djs_oplot, s.wave, params_out.fit, color = 'red', thick =8
;       djs_oplot, s.wave, s.err, color = 'green', thick =4
;
;multiplot, /doxaxis
;plot, s.wave, s.flux, xr = lim2, /xs, yr = [0,2], thick = 8
;djs_oplot, s.wave,params_out.fit, color = 'red', thick =8
;djs_oplot, s.wave, s.err, color = 'green', thick =4
;
;multiplot
;plot, s.wave, s.flux, xr = lim3, /xs, yr = [0,2], thick = 8
;djs_oplot, s.wave, params_out.fit, color = 'red', thick =8
;djs_oplot, s.wave, s.err, color = 'green', thick =4
;
;dfpsclose
; multiplot,/reset, /default 

;---------------------------------------------------------------------------------------------
;
; ++++++++++++++++++++++++++++++++   Measuring Line depths     +++++++++++++++++++++++++++++++
; 
;---------------------------------------------------------------------------------------------

;
;vmin = -300
;vmax = 100
;vlyb = (absorp.wave/1025.762 -1) * 2.99e5
;plot, vlyb, absorp.flux, xr=[-1000,1000]
;djs_oplot, [vmin,vmin],[-1,2], color = 'red'
;djs_oplot, [vmax,vmax],[-1,2], color = 'red'
;lybcf = median(1-absorp.flux[where(vlyb gt vmin  and vlyb lt vmax and absorp.flux ge 0)])
; lybcf_err = sqrt(1/total(1/absorp.err[where(vlyb gt vmin and vlyb lt vmax and absorp.flux ge 0)]^2)) 
;print, string(lybcf) +'+-'+ string(lybcf_err)

;;;
;vmin = -400
;vmax = -0
;vlyg = (s.wave/972.5368 -1) * 2.99e5
;plot, vlyg, s.flux, xr=[-1000,1000]
;djs_oplot, [vmin,vmin],[-1,2], color = 'red'
;djs_oplot, [vmax,vmax],[-1,2], color = 'red'
;lygcf = median(1-s.flux[where(vlyg gt vmin and vlyg lt vmax and s.flux ge 0)])
;lygcf_err = sqrt(1/total(1/s.err[where(vlyg gt vmin and vlyg lt vmax and s.flux ge 0)]^2))

;print, string(lygcf) +'+-'+ string(lygcf_err)
;;
;vmin = -450
;vmax = -100
;vlyd = (absorp.wave/949.7431 -1) * 2.99e5
;plot, vlyd, absorp.flux, xr=[-1000,1000]
;djs_oplot, [vmin,vmin],[-1,2], color = 'red'
;djs_oplot, [vmax,vmax],[-1,2], color = 'red'
;  lydcf = median(1-absorp.flux[where(vlyd gt vmin and vlyd lt vmax and absorp.flux ge 0)])
; lydcf_err = sqrt(1/total(1/absorp.err[where(vlyd gt vmin and vlyd lt vmax and absorp.flux ge 0)]^2))
; print, string(lydcf) +'+-'+ string(lydcf_err)
; 
; 
; vmin = -100
;vmax = 100
;vly5 = (absorp.wave/937.8035 -1) * 2.99e5
;plot, vly5, absorp.flux, xr=[-1000,1000]
;djs_oplot, [vmin,vmin],[-1,2], color = 'red'
;djs_oplot, [vmax,vmax],[-1,2], color = 'red'
;  ly5cf = median(1-absorp.flux[where(vly5 gt vmin and vly5 lt vmax and absorp.flux ge 0)])
; ly5cf_err = sqrt(1/total(1/absorp.err[where(vly5 gt vmin and vly5 lt vmax and absorp.flux ge 0)]^2))
; print, string(ly5cf) +'+-'+ string(ly5cf_err)
; 
;
;    
  
end




