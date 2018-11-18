set Eventos;
set EventosDeporteArqueria;
set EventosDeporteAtletismo;
set EventosDeporteBadminton;
set EventosDeporteBaileDeportivo;
set EventosDeporteBasquet;
set EventosDeporteVoleyPlaya;
set EventosDeporteBoxeo;
set EventosDeporteCiclismo;
set EventosDeporteEquitacion;
set EventosDeporteEscalada;
set EventosDeporteEsgrima;
set EventosDeporteFutsal;
set EventosDeporteGimnasia;
set EventosDeporteGolf;
set EventosDeporteHalterofilia;
set EventosDeporteHockey;
set EventosDeporteJudo;
set EventosDeporteKarate;
set EventosDeporteLuchaLibre;
set EventosDeporteNatacion;
set EventosDeportePentatlon;
set EventosDeporteRemo;
set EventosDeporteRugby7;
set EventosDeporteTaekwondo;
set EventosDeporteTenis;
set EventosDeporteTenisDeMesa;
set EventosDeporteTiroYVariantes;
set EventosDeporteTriatlon;
set EventosDeporteNavegacionAVela;
set EventosDeporteHandballPlaya;
set FinalDeporteArqueria;
set FinalDeporteAtletismo;
set FinalDeporteBadminton;
set FinalDeporteBaileDeportivo;
set FinalDeporteBasquet;
set FinalDeporteVoleyPlaya;
set FinalDeporteBoxeo;
set FinalDeporteCiclismo;
set FinalDeporteEquitacion;
set FinalDeporteEscalada;
set FinalDeporteEsgrima;
set FinalDeporteFutsal;
set FinalDeporteGimnasia;
set FinalDeporteGolf;
set FinalDeporteHalterofilia;
set FinalDeporteHockey;
set FinalDeporteJudo;
set FinalDeporteKarate;
set FinalDeporteLuchaLibre;
set FinalDeporteNatacion;
set FinalDeportePentatlon;
set FinalDeporteRemo;
set FinalDeporteRugby7;
set FinalDeporteTaekwondo;
set FinalDeporteTenis;
set FinalDeporteTenisDeMesa;
set FinalDeporteTiroYVariantes;
set FinalDeporteTriatlon;
set FinalDeporteNavegacionAVela;
set FinalDeporteHandballPlaya;
set Equipos;
set Sedes;
set Jornadas;
set Deportes;
set Canales;
param Calidad_T{d in Deportes};
param Calidad_E{d in Deportes};
param Calidad_F{d in Deportes};
param Especialista{i in Equipos, d in Deportes};
param Cubre{i in Equipos, d in Deportes};
var Y_{e in Eventos}, binary;
var Y_EQ_{e in Eventos, i in Equipos}, binary;
var T_{e in Eventos, c in Canales}, binary;
var E_{i in Equipos, s in Sedes, j in Jornadas}, binary;
maximize z: sum{e in EventosDeporteArqueria, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Arqueria"] + Calidad_E["Arqueria"] * Especialista[i, "Arqueria"])) + sum{e in FinalDeporteArqueria} (Y_[e] * Calidad_F["Arqueria"])
	+ sum{e in EventosDeporteAtletismo, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Atletismo"] + Calidad_E["Atletismo"] * Especialista[i, "Atletismo"])) + sum{e in FinalDeporteAtletismo} (Y_[e] * Calidad_F["Atletismo"])
	+ sum{e in EventosDeporteBadminton, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Badminton"] + Calidad_E["Badminton"] * Especialista[i, "Badminton"])) + sum{e in FinalDeporteBadminton} (Y_[e] * Calidad_F["Badminton"])
	+ sum{e in EventosDeporteBaileDeportivo, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["BaileDeportivo"] + Calidad_E["BaileDeportivo"] * Especialista[i, "BaileDeportivo"])) + sum{e in FinalDeporteBaileDeportivo} (Y_[e] * Calidad_F["BaileDeportivo"])
	+ sum{e in EventosDeporteBasquet, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Basquet"] + Calidad_E["Basquet"] * Especialista[i, "Basquet"])) + sum{e in FinalDeporteBasquet} (Y_[e] * Calidad_F["Basquet"])
	+ sum{e in EventosDeporteVoleyPlaya, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["VoleyPlaya"] + Calidad_E["VoleyPlaya"] * Especialista[i, "VoleyPlaya"])) + sum{e in FinalDeporteVoleyPlaya} (Y_[e] * Calidad_F["VoleyPlaya"])
	+ sum{e in EventosDeporteBoxeo, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Boxeo"] + Calidad_E["Boxeo"] * Especialista[i, "Boxeo"])) + sum{e in FinalDeporteBoxeo} (Y_[e] * Calidad_F["Boxeo"])
	+ sum{e in EventosDeporteCiclismo, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Ciclismo"] + Calidad_E["Ciclismo"] * Especialista[i, "Ciclismo"])) + sum{e in FinalDeporteCiclismo} (Y_[e] * Calidad_F["Ciclismo"])
	+ sum{e in EventosDeporteEquitacion, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Equitacion"] + Calidad_E["Equitacion"] * Especialista[i, "Equitacion"])) + sum{e in FinalDeporteEquitacion} (Y_[e] * Calidad_F["Equitacion"])
	+ sum{e in EventosDeporteEscalada, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Escalada"] + Calidad_E["Escalada"] * Especialista[i, "Escalada"])) + sum{e in FinalDeporteEscalada} (Y_[e] * Calidad_F["Escalada"])
	+ sum{e in EventosDeporteEsgrima, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Esgrima"] + Calidad_E["Esgrima"] * Especialista[i, "Esgrima"])) + sum{e in FinalDeporteEsgrima} (Y_[e] * Calidad_F["Esgrima"])
	+ sum{e in EventosDeporteFutsal, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Futsal"] + Calidad_E["Futsal"] * Especialista[i, "Futsal"])) + sum{e in FinalDeporteFutsal} (Y_[e] * Calidad_F["Futsal"])
	+ sum{e in EventosDeporteGimnasia, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Gimnasia"] + Calidad_E["Gimnasia"] * Especialista[i, "Gimnasia"])) + sum{e in FinalDeporteGimnasia} (Y_[e] * Calidad_F["Gimnasia"])
	+ sum{e in EventosDeporteGolf, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Golf"] + Calidad_E["Golf"] * Especialista[i, "Golf"])) + sum{e in FinalDeporteGolf} (Y_[e] * Calidad_F["Golf"])
	+ sum{e in EventosDeporteHalterofilia, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Halterofilia"] + Calidad_E["Halterofilia"] * Especialista[i, "Halterofilia"])) + sum{e in FinalDeporteHalterofilia} (Y_[e] * Calidad_F["Halterofilia"])
	+ sum{e in EventosDeporteHockey, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Hockey"] + Calidad_E["Hockey"] * Especialista[i, "Hockey"])) + sum{e in FinalDeporteHockey} (Y_[e] * Calidad_F["Hockey"])
	+ sum{e in EventosDeporteJudo, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Judo"] + Calidad_E["Judo"] * Especialista[i, "Judo"])) + sum{e in FinalDeporteJudo} (Y_[e] * Calidad_F["Judo"])
	+ sum{e in EventosDeporteKarate, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Karate"] + Calidad_E["Karate"] * Especialista[i, "Karate"])) + sum{e in FinalDeporteKarate} (Y_[e] * Calidad_F["Karate"])
	+ sum{e in EventosDeporteLuchaLibre, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["LuchaLibre"] + Calidad_E["LuchaLibre"] * Especialista[i, "LuchaLibre"])) + sum{e in FinalDeporteLuchaLibre} (Y_[e] * Calidad_F["LuchaLibre"])
	+ sum{e in EventosDeporteNatacion, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Natacion"] + Calidad_E["Natacion"] * Especialista[i, "Natacion"])) + sum{e in FinalDeporteNatacion} (Y_[e] * Calidad_F["Natacion"])
	+ sum{e in EventosDeportePentatlon, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Pentatlon"] + Calidad_E["Pentatlon"] * Especialista[i, "Pentatlon"])) + sum{e in FinalDeportePentatlon} (Y_[e] * Calidad_F["Pentatlon"])
	+ sum{e in EventosDeporteRemo, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Remo"] + Calidad_E["Remo"] * Especialista[i, "Remo"])) + sum{e in FinalDeporteRemo} (Y_[e] * Calidad_F["Remo"])
	+ sum{e in EventosDeporteRugby7, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Rugby7"] + Calidad_E["Rugby7"] * Especialista[i, "Rugby7"])) + sum{e in FinalDeporteRugby7} (Y_[e] * Calidad_F["Rugby7"])
	+ sum{e in EventosDeporteTaekwondo, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Taekwondo"] + Calidad_E["Taekwondo"] * Especialista[i, "Taekwondo"])) + sum{e in FinalDeporteTaekwondo} (Y_[e] * Calidad_F["Taekwondo"])
	+ sum{e in EventosDeporteTenis, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Tenis"] + Calidad_E["Tenis"] * Especialista[i, "Tenis"])) + sum{e in FinalDeporteTenis} (Y_[e] * Calidad_F["Tenis"])
	+ sum{e in EventosDeporteTenisDeMesa, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["TenisDeMesa"] + Calidad_E["TenisDeMesa"] * Especialista[i, "TenisDeMesa"])) + sum{e in FinalDeporteTenisDeMesa} (Y_[e] * Calidad_F["TenisDeMesa"])
	+ sum{e in EventosDeporteTiroYVariantes, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["TiroYVariantes"] + Calidad_E["TiroYVariantes"] * Especialista[i, "TiroYVariantes"])) + sum{e in FinalDeporteTiroYVariantes} (Y_[e] * Calidad_F["TiroYVariantes"])
	+ sum{e in EventosDeporteTriatlon, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["Triatlon"] + Calidad_E["Triatlon"] * Especialista[i, "Triatlon"])) + sum{e in FinalDeporteTriatlon} (Y_[e] * Calidad_F["Triatlon"])
	+ sum{e in EventosDeporteNavegacionAVela, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["NavegacionAVela"] + Calidad_E["NavegacionAVela"] * Especialista[i, "NavegacionAVela"])) + sum{e in FinalDeporteNavegacionAVela} (Y_[e] * Calidad_F["NavegacionAVela"])
	+ sum{e in EventosDeporteHandballPlaya, i in Equipos}(Y_EQ_[e, i]*(Calidad_T["HandballPlaya"] + Calidad_E["HandballPlaya"] * Especialista[i, "HandballPlaya"])) + sum{e in FinalDeporteHandballPlaya} (Y_[e] * Calidad_F["HandballPlaya"])
;
s.t. def_Y_{e in Eventos}: Y_[e] = sum{i in Equipos}Y_EQ_[e,i];
s.t. cubr_eq_dep_Arqueria{i in Equipos, e in EventosDeporteArqueria}:Y_EQ_[e, i] <= Cubre[i, "Arqueria"];
s.t. cubr_eq_dep_Atletismo{i in Equipos, e in EventosDeporteAtletismo}:Y_EQ_[e, i] <= Cubre[i, "Atletismo"];
s.t. cubr_eq_dep_Badminton{i in Equipos, e in EventosDeporteBadminton}:Y_EQ_[e, i] <= Cubre[i, "Badminton"];
s.t. cubr_eq_dep_BaileDeportivo{i in Equipos, e in EventosDeporteBaileDeportivo}:Y_EQ_[e, i] <= Cubre[i, "BaileDeportivo"];
s.t. cubr_eq_dep_Basquet{i in Equipos, e in EventosDeporteBasquet}:Y_EQ_[e, i] <= Cubre[i, "Basquet"];
s.t. cubr_eq_dep_VoleyPlaya{i in Equipos, e in EventosDeporteVoleyPlaya}:Y_EQ_[e, i] <= Cubre[i, "VoleyPlaya"];
s.t. cubr_eq_dep_Boxeo{i in Equipos, e in EventosDeporteBoxeo}:Y_EQ_[e, i] <= Cubre[i, "Boxeo"];
s.t. cubr_eq_dep_Ciclismo{i in Equipos, e in EventosDeporteCiclismo}:Y_EQ_[e, i] <= Cubre[i, "Ciclismo"];
s.t. cubr_eq_dep_Equitacion{i in Equipos, e in EventosDeporteEquitacion}:Y_EQ_[e, i] <= Cubre[i, "Equitacion"];
s.t. cubr_eq_dep_Escalada{i in Equipos, e in EventosDeporteEscalada}:Y_EQ_[e, i] <= Cubre[i, "Escalada"];
s.t. cubr_eq_dep_Esgrima{i in Equipos, e in EventosDeporteEsgrima}:Y_EQ_[e, i] <= Cubre[i, "Esgrima"];
s.t. cubr_eq_dep_Futsal{i in Equipos, e in EventosDeporteFutsal}:Y_EQ_[e, i] <= Cubre[i, "Futsal"];
s.t. cubr_eq_dep_Gimnasia{i in Equipos, e in EventosDeporteGimnasia}:Y_EQ_[e, i] <= Cubre[i, "Gimnasia"];
s.t. cubr_eq_dep_Golf{i in Equipos, e in EventosDeporteGolf}:Y_EQ_[e, i] <= Cubre[i, "Golf"];
s.t. cubr_eq_dep_Halterofilia{i in Equipos, e in EventosDeporteHalterofilia}:Y_EQ_[e, i] <= Cubre[i, "Halterofilia"];
s.t. cubr_eq_dep_Hockey{i in Equipos, e in EventosDeporteHockey}:Y_EQ_[e, i] <= Cubre[i, "Hockey"];
s.t. cubr_eq_dep_Judo{i in Equipos, e in EventosDeporteJudo}:Y_EQ_[e, i] <= Cubre[i, "Judo"];
s.t. cubr_eq_dep_Karate{i in Equipos, e in EventosDeporteKarate}:Y_EQ_[e, i] <= Cubre[i, "Karate"];
s.t. cubr_eq_dep_LuchaLibre{i in Equipos, e in EventosDeporteLuchaLibre}:Y_EQ_[e, i] <= Cubre[i, "LuchaLibre"];
s.t. cubr_eq_dep_Natacion{i in Equipos, e in EventosDeporteNatacion}:Y_EQ_[e, i] <= Cubre[i, "Natacion"];
s.t. cubr_eq_dep_Pentatlon{i in Equipos, e in EventosDeportePentatlon}:Y_EQ_[e, i] <= Cubre[i, "Pentatlon"];
s.t. cubr_eq_dep_Remo{i in Equipos, e in EventosDeporteRemo}:Y_EQ_[e, i] <= Cubre[i, "Remo"];
s.t. cubr_eq_dep_Rugby7{i in Equipos, e in EventosDeporteRugby7}:Y_EQ_[e, i] <= Cubre[i, "Rugby7"];
s.t. cubr_eq_dep_Taekwondo{i in Equipos, e in EventosDeporteTaekwondo}:Y_EQ_[e, i] <= Cubre[i, "Taekwondo"];
s.t. cubr_eq_dep_Tenis{i in Equipos, e in EventosDeporteTenis}:Y_EQ_[e, i] <= Cubre[i, "Tenis"];
s.t. cubr_eq_dep_TenisDeMesa{i in Equipos, e in EventosDeporteTenisDeMesa}:Y_EQ_[e, i] <= Cubre[i, "TenisDeMesa"];
s.t. cubr_eq_dep_TiroYVariantes{i in Equipos, e in EventosDeporteTiroYVariantes}:Y_EQ_[e, i] <= Cubre[i, "TiroYVariantes"];
s.t. cubr_eq_dep_Triatlon{i in Equipos, e in EventosDeporteTriatlon}:Y_EQ_[e, i] <= Cubre[i, "Triatlon"];
s.t. cubr_eq_dep_NavegacionAVela{i in Equipos, e in EventosDeporteNavegacionAVela}:Y_EQ_[e, i] <= Cubre[i, "NavegacionAVela"];
s.t. cubr_eq_dep_HandballPlaya{i in Equipos, e in EventosDeporteHandballPlaya}:Y_EQ_[e, i] <= Cubre[i, "HandballPlaya"];
s.t. e_i_GREEN_7_inf{i in Equipos}: E_[i, "GREEN", 7]<= Y_["7_VoleyPlaya_9.00_16.50"] + Y_["7_Tenis_10.00_18.00"] + Y_["7_Triatlon_11.00_13.00"];
s.t. e_i_GREEN_7_sup{i in Equipos}: Y_["7_VoleyPlaya_9.00_16.50"] + Y_["7_Tenis_10.00_18.00"] + Y_["7_Triatlon_11.00_13.00"] <= 3 * E_[i, "GREEN", 7];
s.t. e_i_GREEN_8_inf{i in Equipos}: E_[i, "GREEN", 8]<= Y_["8_VoleyPlaya_9.00_16.50"] + Y_["8_Equitacion_14.00_15.30"] + Y_["8_Tenis_10.00_18.00"] + Y_["8_Triatlon_11.00_13.00"];
s.t. e_i_GREEN_8_sup{i in Equipos}: Y_["8_VoleyPlaya_9.00_16.50"] + Y_["8_Equitacion_14.00_15.30"] + Y_["8_Tenis_10.00_18.00"] + Y_["8_Triatlon_11.00_13.00"] <= 4 * E_[i, "GREEN", 8];
s.t. e_i_GREEN_9_inf{i in Equipos}: E_[i, "GREEN", 9]<= Y_["9_VoleyPlaya_9.00_16.50"] + Y_["9_Equitacion_14.00_16.00"] + Y_["9_Tenis_10.00_18.00"];
s.t. e_i_GREEN_9_sup{i in Equipos}: Y_["9_VoleyPlaya_9.00_16.50"] + Y_["9_Equitacion_14.00_16.00"] + Y_["9_Tenis_10.00_18.00"] <= 3 * E_[i, "GREEN", 9];
s.t. e_i_GREEN_10_inf{i in Equipos}: E_[i, "GREEN", 10]<= Y_["10_VoleyPlaya_9.00_16.50"] + Y_["10_Tenis_10.00_18.00"];
s.t. e_i_GREEN_10_sup{i in Equipos}: Y_["10_VoleyPlaya_9.00_16.50"] + Y_["10_Tenis_10.00_18.00"] <= 2 * E_[i, "GREEN", 10];
s.t. e_i_GREEN_11_inf{i in Equipos}: E_[i, "GREEN", 11]<= Y_["11_VoleyPlaya_9.00_16.50"] + Y_["11_Tenis_10.00_18.00"] + Y_["11_Triatlon_11.00_13.30"];
s.t. e_i_GREEN_11_sup{i in Equipos}: Y_["11_VoleyPlaya_9.00_16.50"] + Y_["11_Tenis_10.00_18.00"] + Y_["11_Triatlon_11.00_13.30"] <= 3 * E_[i, "GREEN", 11];
s.t. e_i_GREEN_12_inf{i in Equipos}: E_[i, "GREEN", 12]<= Y_["12_VoleyPlaya_9.00_16.50"] + Y_["12_Equitacion_14.00_15.30"] + Y_["12_Tenis_10.00_18.00"];
s.t. e_i_GREEN_12_sup{i in Equipos}: Y_["12_VoleyPlaya_9.00_16.50"] + Y_["12_Equitacion_14.00_15.30"] + Y_["12_Tenis_10.00_18.00"] <= 3 * E_[i, "GREEN", 12];
s.t. e_i_GREEN_13_inf{i in Equipos}: E_[i, "GREEN", 13]<= Y_["13_VoleyPlaya_9.00_16.50"] + Y_["13_Ciclismo_11.00_13.00"] + Y_["13_Equitacion_14.00_16.00"] + Y_["13_Tenis_10.00_18.00"];
s.t. e_i_GREEN_13_sup{i in Equipos}: Y_["13_VoleyPlaya_9.00_16.50"] + Y_["13_Ciclismo_11.00_13.00"] + Y_["13_Equitacion_14.00_16.00"] + Y_["13_Tenis_10.00_18.00"] <= 4 * E_[i, "GREEN", 13];
s.t. e_i_GREEN_14_inf{i in Equipos}: E_[i, "GREEN", 14]<= Y_["14_VoleyPlaya_9.00_16.50"] + Y_["14_Ciclismo_11.00_15.30"] + Y_["14_Tenis_10.00_18.00"];
s.t. e_i_GREEN_14_sup{i in Equipos}: Y_["14_VoleyPlaya_9.00_16.50"] + Y_["14_Ciclismo_11.00_15.30"] + Y_["14_Tenis_10.00_18.00"] <= 3 * E_[i, "GREEN", 14];
s.t. e_i_GREEN_15_inf{i in Equipos}: E_[i, "GREEN", 15]<= Y_["15_VoleyPlaya_9.00_16.50"] + Y_["15_Ciclismo_11.00_13.45"];
s.t. e_i_GREEN_15_sup{i in Equipos}: Y_["15_VoleyPlaya_9.00_16.50"] + Y_["15_Ciclismo_11.00_13.45"] <= 2 * E_[i, "GREEN", 15];
s.t. e_i_GREEN_16_inf{i in Equipos}: E_[i, "GREEN", 16]<= Y_["16_VoleyPlaya_10.00_11.50"] + Y_["16_VoleyPlaya_15.00_16.50"] + Y_["16_Ciclismo_11.00_13.00"];
s.t. e_i_GREEN_16_sup{i in Equipos}: Y_["16_VoleyPlaya_10.00_11.50"] + Y_["16_VoleyPlaya_15.00_16.50"] + Y_["16_Ciclismo_11.00_13.00"] <= 3 * E_[i, "GREEN", 16];
s.t. e_i_GREEN_17_inf{i in Equipos}: E_[i, "GREEN", 17]<= Y_["17_VoleyPlaya_10.00_12.35"] + Y_["17_VoleyPlaya_14.00_16.35"] + Y_["17_Ciclismo_11.00_14.40"];
s.t. e_i_GREEN_17_sup{i in Equipos}: Y_["17_VoleyPlaya_10.00_12.35"] + Y_["17_VoleyPlaya_14.00_16.35"] + Y_["17_Ciclismo_11.00_14.40"] <= 3 * E_[i, "GREEN", 17];
s.t. e_i_SAV_7_inf{i in Equipos}: E_[i, "SAV", 7]<= Y_["7_NavegacionAVela_12.00_18.00"];
s.t. e_i_SAV_7_sup{i in Equipos}: Y_["7_NavegacionAVela_12.00_18.00"] <= 1 * E_[i, "SAV", 7];
s.t. e_i_SAV_8_inf{i in Equipos}: E_[i, "SAV", 8]<= Y_["8_NavegacionAVela_12.00_18.00"];
s.t. e_i_SAV_8_sup{i in Equipos}: Y_["8_NavegacionAVela_12.00_18.00"] <= 1 * E_[i, "SAV", 8];
s.t. e_i_SAV_9_inf{i in Equipos}: E_[i, "SAV", 9]<= Y_["9_Golf_8.30_17.00"] + Y_["9_NavegacionAVela_12.00_18.00"];
s.t. e_i_SAV_9_sup{i in Equipos}: Y_["9_Golf_8.30_17.00"] + Y_["9_NavegacionAVela_12.00_18.00"] <= 2 * E_[i, "SAV", 9];
s.t. e_i_SAV_10_inf{i in Equipos}: E_[i, "SAV", 10]<= Y_["10_Golf_8.30_17.00"] + Y_["10_NavegacionAVela_12.00_18.00"];
s.t. e_i_SAV_10_sup{i in Equipos}: Y_["10_Golf_8.30_17.00"] + Y_["10_NavegacionAVela_12.00_18.00"] <= 2 * E_[i, "SAV", 10];
s.t. e_i_SAV_11_inf{i in Equipos}: E_[i, "SAV", 11]<= Y_["11_Golf_8.30_17.20"] + Y_["11_NavegacionAVela_12.00_18.00"];
s.t. e_i_SAV_11_sup{i in Equipos}: Y_["11_Golf_8.30_17.20"] + Y_["11_NavegacionAVela_12.00_18.00"] <= 2 * E_[i, "SAV", 11];
s.t. e_i_SAV_12_inf{i in Equipos}: E_[i, "SAV", 12]<= Y_["12_NavegacionAVela_12.00_18.00"];
s.t. e_i_SAV_12_sup{i in Equipos}: Y_["12_NavegacionAVela_12.00_18.00"] <= 1 * E_[i, "SAV", 12];
s.t. e_i_SAV_13_inf{i in Equipos}: E_[i, "SAV", 13]<= Y_["13_Golf_8.30_14.40"] + Y_["13_Rugby7_12.00_14.30"] + Y_["13_Rugby7_15.05_17.35"] + Y_["13_NavegacionAVela_12.00_18.00"];
s.t. e_i_SAV_13_sup{i in Equipos}: Y_["13_Golf_8.30_14.40"] + Y_["13_Rugby7_12.00_14.30"] + Y_["13_Rugby7_15.05_17.35"] + Y_["13_NavegacionAVela_12.00_18.00"] <= 4 * E_[i, "SAV", 13];
s.t. e_i_SAV_14_inf{i in Equipos}: E_[i, "SAV", 14]<= Y_["14_Golf_8.30_16.30"] + Y_["14_Rugby7_12.00_14.30"] + Y_["14_Rugby7_15.05_17.35"];
s.t. e_i_SAV_14_sup{i in Equipos}: Y_["14_Golf_8.30_16.30"] + Y_["14_Rugby7_12.00_14.30"] + Y_["14_Rugby7_15.05_17.35"] <= 3 * E_[i, "SAV", 14];
s.t. e_i_SAV_15_inf{i in Equipos}: E_[i, "SAV", 15]<= Y_["15_Golf_8.30_16.45"] + Y_["15_Rugby7_9.00_11.30"] + Y_["15_Rugby7_13.30_17.00"];
s.t. e_i_SAV_15_sup{i in Equipos}: Y_["15_Golf_8.30_16.45"] + Y_["15_Rugby7_9.00_11.30"] + Y_["15_Rugby7_13.30_17.00"] <= 3 * E_[i, "SAV", 15];
s.t. e_i_TECNO_7_inf{i in Equipos}: E_[i, "TECNO", 7]<= Y_["7_Badminton_9.00_12.30"] + Y_["7_Badminton_13.30_17.00"] + Y_["7_Badminton_18.00_21.00"] + Y_["7_Futsal_14.00_22.00"] + Y_["7_TenisDeMesa_10.00_14.30"] + Y_["7_TenisDeMesa_16.00_20.30"] + Y_["7_TiroYVariantes_9.00_12.15"];
s.t. e_i_TECNO_7_sup{i in Equipos}: Y_["7_Badminton_9.00_12.30"] + Y_["7_Badminton_13.30_17.00"] + Y_["7_Badminton_18.00_21.00"] + Y_["7_Futsal_14.00_22.00"] + Y_["7_TenisDeMesa_10.00_14.30"] + Y_["7_TenisDeMesa_16.00_20.30"] + Y_["7_TiroYVariantes_9.00_12.15"] <= 7 * E_[i, "TECNO", 7];
s.t. e_i_TECNO_8_inf{i in Equipos}: E_[i, "TECNO", 8]<= Y_["8_Badminton_9.00_12.30"] + Y_["8_Badminton_13.30_17.00"] + Y_["8_Badminton_18.00_21.00"] + Y_["8_Futsal_14.00_22.00"] + Y_["8_TenisDeMesa_10.00_14.30"] + Y_["8_TenisDeMesa_16.00_20.30"] + Y_["8_TiroYVariantes_9.00_12.15"] + Y_["8_HandballPlaya_10.00_13.20"] + Y_["8_HandballPlaya_14.30_17.50"];
s.t. e_i_TECNO_8_sup{i in Equipos}: Y_["8_Badminton_9.00_12.30"] + Y_["8_Badminton_13.30_17.00"] + Y_["8_Badminton_18.00_21.00"] + Y_["8_Futsal_14.00_22.00"] + Y_["8_TenisDeMesa_10.00_14.30"] + Y_["8_TenisDeMesa_16.00_20.30"] + Y_["8_TiroYVariantes_9.00_12.15"] + Y_["8_HandballPlaya_10.00_13.20"] + Y_["8_HandballPlaya_14.30_17.50"] <= 9 * E_[i, "TECNO", 8];
s.t. e_i_TECNO_9_inf{i in Equipos}: E_[i, "TECNO", 9]<= Y_["9_Badminton_9.00_12.30"] + Y_["9_Badminton_13.30_17.00"] + Y_["9_Badminton_18.00_21.00"] + Y_["9_Futsal_14.00_22.00"] + Y_["9_TenisDeMesa_10.00_13.00"] + Y_["9_TenisDeMesa_15.00_21.00"] + Y_["9_TiroYVariantes_9.00_12.15"] + Y_["9_HandballPlaya_10.00_13.20"] + Y_["9_HandballPlaya_14.30_17.50"];
s.t. e_i_TECNO_9_sup{i in Equipos}: Y_["9_Badminton_9.00_12.30"] + Y_["9_Badminton_13.30_17.00"] + Y_["9_Badminton_18.00_21.00"] + Y_["9_Futsal_14.00_22.00"] + Y_["9_TenisDeMesa_10.00_13.00"] + Y_["9_TenisDeMesa_15.00_21.00"] + Y_["9_TiroYVariantes_9.00_12.15"] + Y_["9_HandballPlaya_10.00_13.20"] + Y_["9_HandballPlaya_14.30_17.50"] <= 9 * E_[i, "TECNO", 9];
s.t. e_i_TECNO_10_inf{i in Equipos}: E_[i, "TECNO", 10]<= Y_["10_Badminton_14.00_16.15"] + Y_["10_Badminton_18.00_21.00"] + Y_["10_Futsal_14.00_22.00"] + Y_["10_TenisDeMesa_10.00_13.00"] + Y_["10_TenisDeMesa_16.00_19.30"] + Y_["10_TiroYVariantes_9.00_12.15"] + Y_["10_TiroYVariantes_13.15_15.30"] + Y_["10_HandballPlaya_10.00_13.20"];
s.t. e_i_TECNO_10_sup{i in Equipos}: Y_["10_Badminton_14.00_16.15"] + Y_["10_Badminton_18.00_21.00"] + Y_["10_Futsal_14.00_22.00"] + Y_["10_TenisDeMesa_10.00_13.00"] + Y_["10_TenisDeMesa_16.00_19.30"] + Y_["10_TiroYVariantes_9.00_12.15"] + Y_["10_TiroYVariantes_13.15_15.30"] + Y_["10_HandballPlaya_10.00_13.20"] <= 8 * E_[i, "TECNO", 10];
s.t. e_i_TECNO_11_inf{i in Equipos}: E_[i, "TECNO", 11]<= Y_["11_Badminton_12.00_15.20"] + Y_["11_Badminton_18.00_21.00"] + Y_["11_Futsal_14.00_22.00"] + Y_["11_TiroYVariantes_9.00_12.30"] + Y_["11_TiroYVariantes_13.45_16.00"] + Y_["11_HandballPlaya_10.00_13.20"] + Y_["11_HandballPlaya_14.30_17.50"];
s.t. e_i_TECNO_11_sup{i in Equipos}: Y_["11_Badminton_12.00_15.20"] + Y_["11_Badminton_18.00_21.00"] + Y_["11_Futsal_14.00_22.00"] + Y_["11_TiroYVariantes_9.00_12.30"] + Y_["11_TiroYVariantes_13.45_16.00"] + Y_["11_HandballPlaya_10.00_13.20"] + Y_["11_HandballPlaya_14.30_17.50"] <= 7 * E_[i, "TECNO", 11];
s.t. e_i_TECNO_12_inf{i in Equipos}: E_[i, "TECNO", 12]<= Y_["12_Arqueria_10.00_13.00"] + Y_["12_Badminton_11.00_12.40"] + Y_["12_Badminton_13.30_15.00"] + Y_["12_Badminton_15.30_19.15"] + Y_["12_Futsal_14.00_22.00"] + Y_["12_TenisDeMesa_10.00_14.30"] + Y_["12_TenisDeMesa_16.00_20.30"] + Y_["12_TiroYVariantes_9.00_12.30"] + Y_["12_TiroYVariantes_13.45_16.00"] + Y_["12_HandballPlaya_10.00_13.20"] + Y_["12_HandballPlaya_14.30_17.50"];
s.t. e_i_TECNO_12_sup{i in Equipos}: Y_["12_Arqueria_10.00_13.00"] + Y_["12_Badminton_11.00_12.40"] + Y_["12_Badminton_13.30_15.00"] + Y_["12_Badminton_15.30_19.15"] + Y_["12_Futsal_14.00_22.00"] + Y_["12_TenisDeMesa_10.00_14.30"] + Y_["12_TenisDeMesa_16.00_20.30"] + Y_["12_TiroYVariantes_9.00_12.30"] + Y_["12_TiroYVariantes_13.45_16.00"] + Y_["12_HandballPlaya_10.00_13.20"] + Y_["12_HandballPlaya_14.30_17.50"] <= 11 * E_[i, "TECNO", 12];
s.t. e_i_TECNO_13_inf{i in Equipos}: E_[i, "TECNO", 13]<= Y_["13_Arqueria_9.00_13.00"] + Y_["13_Futsal_14.00_22.00"] + Y_["13_TenisDeMesa_10.00_14.30"] + Y_["13_TenisDeMesa_16.00_20.30"] + Y_["13_HandballPlaya_9.30_12.50"] + Y_["13_HandballPlaya_14.10_18.00"];
s.t. e_i_TECNO_13_sup{i in Equipos}: Y_["13_Arqueria_9.00_13.00"] + Y_["13_Futsal_14.00_22.00"] + Y_["13_TenisDeMesa_10.00_14.30"] + Y_["13_TenisDeMesa_16.00_20.30"] + Y_["13_HandballPlaya_9.30_12.50"] + Y_["13_HandballPlaya_14.10_18.00"] <= 6 * E_[i, "TECNO", 13];
s.t. e_i_TECNO_14_inf{i in Equipos}: E_[i, "TECNO", 14]<= Y_["14_Arqueria_9.00_11.25"] + Y_["14_Arqueria_14.00_16.45"] + Y_["14_TenisDeMesa_10.00_13.00"] + Y_["14_TenisDeMesa_17.00_20.00"];
s.t. e_i_TECNO_14_sup{i in Equipos}: Y_["14_Arqueria_9.00_11.25"] + Y_["14_Arqueria_14.00_16.45"] + Y_["14_TenisDeMesa_10.00_13.00"] + Y_["14_TenisDeMesa_17.00_20.00"] <= 4 * E_[i, "TECNO", 14];
s.t. e_i_TECNO_15_inf{i in Equipos}: E_[i, "TECNO", 15]<= Y_["15_Arqueria_9.00_12.45"] + Y_["15_Arqueria_14.00_17.45"] + Y_["15_Futsal_14.00_22.00"] + Y_["15_TenisDeMesa_10.00_13.00"] + Y_["15_TenisDeMesa_17.00_20.15"];
s.t. e_i_TECNO_15_sup{i in Equipos}: Y_["15_Arqueria_9.00_12.45"] + Y_["15_Arqueria_14.00_17.45"] + Y_["15_Futsal_14.00_22.00"] + Y_["15_TenisDeMesa_10.00_13.00"] + Y_["15_TenisDeMesa_17.00_20.15"] <= 5 * E_[i, "TECNO", 15];
s.t. e_i_TECNO_16_inf{i in Equipos}: E_[i, "TECNO", 16]<= Y_["16_Arqueria_10.00_11.55"] + Y_["16_Arqueria_14.00_16.15"];
s.t. e_i_TECNO_16_sup{i in Equipos}: Y_["16_Arqueria_10.00_11.55"] + Y_["16_Arqueria_14.00_16.15"] <= 2 * E_[i, "TECNO", 16];
s.t. e_i_TECNO_17_inf{i in Equipos}: E_[i, "TECNO", 17]<= Y_["17_Arqueria_10.00_11.55"] + Y_["17_Arqueria_14.00_16.15"] + Y_["17_Futsal_14.00_20.30"];
s.t. e_i_TECNO_17_sup{i in Equipos}: Y_["17_Arqueria_10.00_11.55"] + Y_["17_Arqueria_14.00_16.15"] + Y_["17_Futsal_14.00_20.30"] <= 3 * E_[i, "TECNO", 17];
s.t. e_i_TECNO_18_inf{i in Equipos}: E_[i, "TECNO", 18]<= Y_["18_Futsal_9.00_15.30"];
s.t. e_i_TECNO_18_sup{i in Equipos}: Y_["18_Futsal_9.00_15.30"] <= 1 * E_[i, "TECNO", 18];
s.t. e_i_URBAN_7_inf{i in Equipos}: E_[i, "URBAN", 7]<= Y_["7_BaileDeportivo_15.15_18.00"] + Y_["7_Basquet_9.00_14.00"] + Y_["7_Escalada_9.00_9.25"] + Y_["7_Escalada_12.00_14.10"] + Y_["7_Escalada_15.00_16.20"] + Y_["7_Remo_15.30_17.05"];
s.t. e_i_URBAN_7_sup{i in Equipos}: Y_["7_BaileDeportivo_15.15_18.00"] + Y_["7_Basquet_9.00_14.00"] + Y_["7_Escalada_9.00_9.25"] + Y_["7_Escalada_12.00_14.10"] + Y_["7_Escalada_15.00_16.20"] + Y_["7_Remo_15.30_17.05"] <= 6 * E_[i, "URBAN", 7];
s.t. e_i_URBAN_8_inf{i in Equipos}: E_[i, "URBAN", 8]<= Y_["8_BaileDeportivo_15.15_18.00"] + Y_["8_Basquet_9.00_14.00"] + Y_["8_Escalada_9.00_9.25"] + Y_["8_Escalada_12.00_14.10"] + Y_["8_Escalada_15.00_16.20"] + Y_["8_Remo_13.00_14.30"] + Y_["8_Remo_15.30_17.00"];
s.t. e_i_URBAN_8_sup{i in Equipos}: Y_["8_BaileDeportivo_15.15_18.00"] + Y_["8_Basquet_9.00_14.00"] + Y_["8_Escalada_9.00_9.25"] + Y_["8_Escalada_12.00_14.10"] + Y_["8_Escalada_15.00_16.20"] + Y_["8_Remo_13.00_14.30"] + Y_["8_Remo_15.30_17.00"] <= 7 * E_[i, "URBAN", 8];
s.t. e_i_URBAN_9_inf{i in Equipos}: E_[i, "URBAN", 9]<= Y_["9_Basquet_9.00_14.00"] + Y_["9_Escalada_10.00_10.20"] + Y_["9_Escalada_12.00_13.15"] + Y_["9_Escalada_16.00_16.40"] + Y_["9_Remo_15.00_17.25"];
s.t. e_i_URBAN_9_sup{i in Equipos}: Y_["9_Basquet_9.00_14.00"] + Y_["9_Escalada_10.00_10.20"] + Y_["9_Escalada_12.00_13.15"] + Y_["9_Escalada_16.00_16.40"] + Y_["9_Remo_15.00_17.25"] <= 5 * E_[i, "URBAN", 9];
s.t. e_i_URBAN_10_inf{i in Equipos}: E_[i, "URBAN", 10]<= Y_["10_BaileDeportivo_16.30_18.00"] + Y_["10_Basquet_9.00_14.00"] + Y_["10_Escalada_10.00_10.20"] + Y_["10_Escalada_12.00_13.15"] + Y_["10_Escalada_16.00_16.40"] + Y_["10_Remo_14.45_17.25"];
s.t. e_i_URBAN_10_sup{i in Equipos}: Y_["10_BaileDeportivo_16.30_18.00"] + Y_["10_Basquet_9.00_14.00"] + Y_["10_Escalada_10.00_10.20"] + Y_["10_Escalada_12.00_13.15"] + Y_["10_Escalada_16.00_16.40"] + Y_["10_Remo_14.45_17.25"] <= 6 * E_[i, "URBAN", 10];
s.t. e_i_URBAN_11_inf{i in Equipos}: E_[i, "URBAN", 11]<= Y_["11_BaileDeportivo_16.15_17.55"] + Y_["11_Basquet_10.00_15.00"];
s.t. e_i_URBAN_11_sup{i in Equipos}: Y_["11_BaileDeportivo_16.15_17.55"] + Y_["11_Basquet_10.00_15.00"] <= 2 * E_[i, "URBAN", 11];
s.t. e_i_URBAN_12_inf{i in Equipos}: E_[i, "URBAN", 12]<= Y_["12_Basquet_10.00_15.00"];
s.t. e_i_URBAN_12_sup{i in Equipos}: Y_["12_Basquet_10.00_15.00"] <= 1 * E_[i, "URBAN", 12];
s.t. e_i_URBAN_13_inf{i in Equipos}: E_[i, "URBAN", 13]<= Y_["13_Basquet_10.00_15.00"];
s.t. e_i_URBAN_13_sup{i in Equipos}: Y_["13_Basquet_10.00_15.00"] <= 1 * E_[i, "URBAN", 13];
s.t. e_i_URBAN_14_inf{i in Equipos}: E_[i, "URBAN", 14]<= Y_["14_Basquet_10.00_15.00"];
s.t. e_i_URBAN_14_sup{i in Equipos}: Y_["14_Basquet_10.00_15.00"] <= 1 * E_[i, "URBAN", 14];
s.t. e_i_URBAN_15_inf{i in Equipos}: E_[i, "URBAN", 15]<= Y_["15_Basquet_13.30_17.15"];
s.t. e_i_URBAN_15_sup{i in Equipos}: Y_["15_Basquet_13.30_17.15"] <= 1 * E_[i, "URBAN", 15];
s.t. e_i_URBAN_16_inf{i in Equipos}: E_[i, "URBAN", 16]<= Y_["16_Basquet_12.00_14.00"] + Y_["16_Basquet_15.00_17.00"];
s.t. e_i_URBAN_16_sup{i in Equipos}: Y_["16_Basquet_12.00_14.00"] + Y_["16_Basquet_15.00_17.00"] <= 2 * E_[i, "URBAN", 16];
s.t. e_i_URBAN_17_inf{i in Equipos}: E_[i, "URBAN", 17]<= Y_["17_Basquet_11.00_15.30"];
s.t. e_i_URBAN_17_sup{i in Equipos}: Y_["17_Basquet_11.00_15.30"] <= 1 * E_[i, "URBAN", 17];
s.t. e_i_YOP_7_inf{i in Equipos}: E_[i, "YOP", 7]<= Y_["7_Esgrima_9.00_13.35"] + Y_["7_Esgrima_16.30_19.40"] + Y_["7_Gimnasia_14.00_16.55"] + Y_["7_Gimnasia_19.00_21.50"] + Y_["7_Halterofilia_16.00_17.30"] + Y_["7_Halterofilia_20.00_21.30"] + Y_["7_Hockey_9.30_18.30"] + Y_["7_Judo_10.00_12.25"] + Y_["7_Judo_15.00_16.00"] + Y_["7_Natacion_10.00_11.30"] + Y_["7_Natacion_18.00_19.15"] + Y_["7_Taekwondo_14.00_17.00"] + Y_["7_Taekwondo_19.00_21.00"];
s.t. e_i_YOP_7_sup{i in Equipos}: Y_["7_Esgrima_9.00_13.35"] + Y_["7_Esgrima_16.30_19.40"] + Y_["7_Gimnasia_14.00_16.55"] + Y_["7_Gimnasia_19.00_21.50"] + Y_["7_Halterofilia_16.00_17.30"] + Y_["7_Halterofilia_20.00_21.30"] + Y_["7_Hockey_9.30_18.30"] + Y_["7_Judo_10.00_12.25"] + Y_["7_Judo_15.00_16.00"] + Y_["7_Natacion_10.00_11.30"] + Y_["7_Natacion_18.00_19.15"] + Y_["7_Taekwondo_14.00_17.00"] + Y_["7_Taekwondo_19.00_21.00"] <= 13 * E_[i, "YOP", 7];
s.t. e_i_YOP_8_inf{i in Equipos}: E_[i, "YOP", 8]<= Y_["8_Esgrima_9.00_13.45"] + Y_["8_Esgrima_17.00_20.10"] + Y_["8_Gimnasia_14.00_16.45"] + Y_["8_Gimnasia_19.00_21.25"] + Y_["8_Halterofilia_16.00_17.30"] + Y_["8_Halterofilia_20.00_21.30"] + Y_["8_Hockey_9.30_18.30"] + Y_["8_Judo_10.00_12.25"] + Y_["8_Judo_15.00_16.00"] + Y_["8_Natacion_10.00_11.30"] + Y_["8_Natacion_18.00_19.55"] + Y_["8_Taekwondo_14.00_17.00"] + Y_["8_Taekwondo_19.00_21.00"];
s.t. e_i_YOP_8_sup{i in Equipos}: Y_["8_Esgrima_9.00_13.45"] + Y_["8_Esgrima_17.00_20.10"] + Y_["8_Gimnasia_14.00_16.45"] + Y_["8_Gimnasia_19.00_21.25"] + Y_["8_Halterofilia_16.00_17.30"] + Y_["8_Halterofilia_20.00_21.30"] + Y_["8_Hockey_9.30_18.30"] + Y_["8_Judo_10.00_12.25"] + Y_["8_Judo_15.00_16.00"] + Y_["8_Natacion_10.00_11.30"] + Y_["8_Natacion_18.00_19.55"] + Y_["8_Taekwondo_14.00_17.00"] + Y_["8_Taekwondo_19.00_21.00"] <= 13 * E_[i, "YOP", 8];
s.t. e_i_YOP_9_inf{i in Equipos}: E_[i, "YOP", 9]<= Y_["9_Esgrima_9.00_13.25"] + Y_["9_Esgrima_16.30_19.35"] + Y_["9_Gimnasia_14.00_16.50"] + Y_["9_Gimnasia_19.00_21.50"] + Y_["9_Halterofilia_14.30_16.00"] + Y_["9_Halterofilia_18.00_19.30"] + Y_["9_Hockey_9.30_18.30"] + Y_["9_Judo_10.00_11.40"] + Y_["9_Judo_15.00_15.40"] + Y_["9_Natacion_10.00_11.30"] + Y_["9_Natacion_18.00_19.40"] + Y_["9_Taekwondo_14.00_17.00"] + Y_["9_Taekwondo_19.00_21.00"];
s.t. e_i_YOP_9_sup{i in Equipos}: Y_["9_Esgrima_9.00_13.25"] + Y_["9_Esgrima_16.30_19.35"] + Y_["9_Gimnasia_14.00_16.50"] + Y_["9_Gimnasia_19.00_21.50"] + Y_["9_Halterofilia_14.30_16.00"] + Y_["9_Halterofilia_18.00_19.30"] + Y_["9_Hockey_9.30_18.30"] + Y_["9_Judo_10.00_11.40"] + Y_["9_Judo_15.00_15.40"] + Y_["9_Natacion_10.00_11.30"] + Y_["9_Natacion_18.00_19.40"] + Y_["9_Taekwondo_14.00_17.00"] + Y_["9_Taekwondo_19.00_21.00"] <= 13 * E_[i, "YOP", 9];
s.t. e_i_YOP_10_inf{i in Equipos}: E_[i, "YOP", 10]<= Y_["10_Esgrima_9.30_15.05"] + Y_["10_Gimnasia_14.00_16.50"] + Y_["10_Gimnasia_19.00_22.10"] + Y_["10_Hockey_9.30_18.30"] + Y_["10_Judo_10.00_13.15"] + Y_["10_Judo_15.00_16.30"] + Y_["10_Natacion_10.00_11.30"] + Y_["10_Natacion_18.00_19.40"] + Y_["10_Taekwondo_14.00_17.00"] + Y_["10_Taekwondo_19.00_21.00"];
s.t. e_i_YOP_10_sup{i in Equipos}: Y_["10_Esgrima_9.30_15.05"] + Y_["10_Gimnasia_14.00_16.50"] + Y_["10_Gimnasia_19.00_22.10"] + Y_["10_Hockey_9.30_18.30"] + Y_["10_Judo_10.00_13.15"] + Y_["10_Judo_15.00_16.30"] + Y_["10_Natacion_10.00_11.30"] + Y_["10_Natacion_18.00_19.40"] + Y_["10_Taekwondo_14.00_17.00"] + Y_["10_Taekwondo_19.00_21.00"] <= 10 * E_[i, "YOP", 10];
s.t. e_i_YOP_11_inf{i in Equipos}: E_[i, "YOP", 11]<= Y_["11_Atletismo_14.30_17.25"] + Y_["11_Gimnasia_17.00_21.05"] + Y_["11_Halterofilia_14.30_16.00"] + Y_["11_Halterofilia_18.00_19.30"] + Y_["11_Hockey_9.30_18.30"] + Y_["11_Natacion_10.00_11.30"] + Y_["11_Natacion_18.00_19.30"] + Y_["11_Taekwondo_14.00_17.00"] + Y_["11_Taekwondo_19.00_21.00"];
s.t. e_i_YOP_11_sup{i in Equipos}: Y_["11_Atletismo_14.30_17.25"] + Y_["11_Gimnasia_17.00_21.05"] + Y_["11_Halterofilia_14.30_16.00"] + Y_["11_Halterofilia_18.00_19.30"] + Y_["11_Hockey_9.30_18.30"] + Y_["11_Natacion_10.00_11.30"] + Y_["11_Natacion_18.00_19.30"] + Y_["11_Taekwondo_14.00_17.00"] + Y_["11_Taekwondo_19.00_21.00"] <= 9 * E_[i, "YOP", 11];
s.t. e_i_YOP_12_inf{i in Equipos}: E_[i, "YOP", 12]<= Y_["12_Atletismo_14.30_17.30"] + Y_["12_Gimnasia_17.00_19.25"] + Y_["12_Halterofilia_14.30_16.00"] + Y_["12_Halterofilia_18.00_19.30"] + Y_["12_Hockey_8.00_18.00"] + Y_["12_LuchaLibre_10.00_11.15"] + Y_["12_LuchaLibre_17.00_19.30"] + Y_["12_Natacion_10.00_11.30"] + Y_["12_Natacion_18.00_19.50"] + Y_["12_Pentatlon_10.00_11.45"] + Y_["12_Pentatlon_14.00_15.45"];
s.t. e_i_YOP_12_sup{i in Equipos}: Y_["12_Atletismo_14.30_17.30"] + Y_["12_Gimnasia_17.00_19.25"] + Y_["12_Halterofilia_14.30_16.00"] + Y_["12_Halterofilia_18.00_19.30"] + Y_["12_Hockey_8.00_18.00"] + Y_["12_LuchaLibre_10.00_11.15"] + Y_["12_LuchaLibre_17.00_19.30"] + Y_["12_Natacion_10.00_11.30"] + Y_["12_Natacion_18.00_19.50"] + Y_["12_Pentatlon_10.00_11.45"] + Y_["12_Pentatlon_14.00_15.45"] <= 11 * E_[i, "YOP", 12];
s.t. e_i_YOP_13_inf{i in Equipos}: E_[i, "YOP", 13]<= Y_["13_Atletismo_14.30_17.50"] + Y_["13_Gimnasia_17.00_20.00"] + Y_["13_Halterofilia_14.30_16.00"] + Y_["13_Halterofilia_18.00_19.30"] + Y_["13_Hockey_8.00_18.00"] + Y_["13_LuchaLibre_10.00_14.10"] + Y_["13_LuchaLibre_17.00_19.55"] + Y_["13_Pentatlon_12.00_12.30"] + Y_["13_Pentatlon_14.30_16.55"];
s.t. e_i_YOP_13_sup{i in Equipos}: Y_["13_Atletismo_14.30_17.50"] + Y_["13_Gimnasia_17.00_20.00"] + Y_["13_Halterofilia_14.30_16.00"] + Y_["13_Halterofilia_18.00_19.30"] + Y_["13_Hockey_8.00_18.00"] + Y_["13_LuchaLibre_10.00_14.10"] + Y_["13_LuchaLibre_17.00_19.55"] + Y_["13_Pentatlon_12.00_12.30"] + Y_["13_Pentatlon_14.30_16.55"] <= 9 * E_[i, "YOP", 13];
s.t. e_i_YOP_14_inf{i in Equipos}: E_[i, "YOP", 14]<= Y_["14_Atletismo_14.00_17.50"] + Y_["14_Boxeo_13.00_16.15"] + Y_["14_Boxeo_18.00_20.45"] + Y_["14_Gimnasia_17.00_19.55"] + Y_["14_Hockey_8.30_12.30"] + Y_["14_Hockey_13.00_18.00"] + Y_["14_LuchaLibre_10.00_11.15"] + Y_["14_LuchaLibre_17.00_19.30"] + Y_["14_Pentatlon_12.00_12.30"] + Y_["14_Pentatlon_14.30_16.55"];
s.t. e_i_YOP_14_sup{i in Equipos}: Y_["14_Atletismo_14.00_17.50"] + Y_["14_Boxeo_13.00_16.15"] + Y_["14_Boxeo_18.00_20.45"] + Y_["14_Gimnasia_17.00_19.55"] + Y_["14_Hockey_8.30_12.30"] + Y_["14_Hockey_13.00_18.00"] + Y_["14_LuchaLibre_10.00_11.15"] + Y_["14_LuchaLibre_17.00_19.30"] + Y_["14_Pentatlon_12.00_12.30"] + Y_["14_Pentatlon_14.30_16.55"] <= 10 * E_[i, "YOP", 14];
s.t. e_i_YOP_15_inf{i in Equipos}: E_[i, "YOP", 15]<= Y_["15_Atletismo_10.00_10.45"] + Y_["15_Atletismo_13.35_18.00"] + Y_["15_Boxeo_13.00_16.15"] + Y_["15_Boxeo_18.00_20.45"] + Y_["15_Gimnasia_17.00_20.50"] + Y_["15_Pentatlon_12.00_15.00"];
s.t. e_i_YOP_15_sup{i in Equipos}: Y_["15_Atletismo_10.00_10.45"] + Y_["15_Atletismo_13.35_18.00"] + Y_["15_Boxeo_13.00_16.15"] + Y_["15_Boxeo_18.00_20.45"] + Y_["15_Gimnasia_17.00_20.50"] + Y_["15_Pentatlon_12.00_15.00"] <= 6 * E_[i, "YOP", 15];
s.t. e_i_YOP_16_inf{i in Equipos}: E_[i, "YOP", 16]<= Y_["16_Atletismo_13.45_18.10"] + Y_["16_Boxeo_13.00_16.30"] + Y_["16_Boxeo_18.00_21.00"] + Y_["16_Gimnasia_17.00_19.15"] + Y_["16_Pentatlon_12.00_12.30"] + Y_["16_Pentatlon_14.30_16.55"];
s.t. e_i_YOP_16_sup{i in Equipos}: Y_["16_Atletismo_13.45_18.10"] + Y_["16_Boxeo_13.00_16.30"] + Y_["16_Boxeo_18.00_21.00"] + Y_["16_Gimnasia_17.00_19.15"] + Y_["16_Pentatlon_12.00_12.30"] + Y_["16_Pentatlon_14.30_16.55"] <= 6 * E_[i, "YOP", 16];
s.t. e_i_YOP_17_inf{i in Equipos}: E_[i, "YOP", 17]<= Y_["17_Boxeo_13.00_16.25"] + Y_["17_Boxeo_18.00_21.25"] + Y_["17_Karate_10.00_13.10"] + Y_["17_Karate_15.00_16.25"];
s.t. e_i_YOP_17_sup{i in Equipos}: Y_["17_Boxeo_13.00_16.25"] + Y_["17_Boxeo_18.00_21.25"] + Y_["17_Karate_10.00_13.10"] + Y_["17_Karate_15.00_16.25"] <= 4 * E_[i, "YOP", 17];
s.t. e_i_YOP_18_inf{i in Equipos}: E_[i, "YOP", 18]<= Y_["18_Boxeo_13.00_17.05"] + Y_["18_Karate_9.00_12.10"] + Y_["18_Karate_14.00_15.25"];
s.t. e_i_YOP_18_sup{i in Equipos}: Y_["18_Boxeo_13.00_17.05"] + Y_["18_Karate_9.00_12.10"] + Y_["18_Karate_14.00_15.25"] <= 3 * E_[i, "YOP", 18];
s.t. excl_E_i_s_j{i in Equipos, j in Jornadas}: sum{s in Sedes} E_[i,s,j] <= 1;
s.t. final_especialista_depArqueria_{e in FinalDeporteArqueria, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Arqueria"];
s.t. final_especialista_depAtletismo_{e in FinalDeporteAtletismo, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Atletismo"];
s.t. final_especialista_depBadminton_{e in FinalDeporteBadminton, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Badminton"];
s.t. final_especialista_depBaileDeportivo_{e in FinalDeporteBaileDeportivo, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "BaileDeportivo"];
s.t. final_especialista_depBasquet_{e in FinalDeporteBasquet, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Basquet"];
s.t. final_especialista_depVoleyPlaya_{e in FinalDeporteVoleyPlaya, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "VoleyPlaya"];
s.t. final_especialista_depBoxeo_{e in FinalDeporteBoxeo, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Boxeo"];
s.t. final_especialista_depCiclismo_{e in FinalDeporteCiclismo, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Ciclismo"];
s.t. final_especialista_depEquitacion_{e in FinalDeporteEquitacion, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Equitacion"];
s.t. final_especialista_depEscalada_{e in FinalDeporteEscalada, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Escalada"];
s.t. final_especialista_depEsgrima_{e in FinalDeporteEsgrima, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Esgrima"];
s.t. final_especialista_depFutsal_{e in FinalDeporteFutsal, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Futsal"];
s.t. final_especialista_depGimnasia_{e in FinalDeporteGimnasia, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Gimnasia"];
s.t. final_especialista_depGolf_{e in FinalDeporteGolf, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Golf"];
s.t. final_especialista_depHalterofilia_{e in FinalDeporteHalterofilia, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Halterofilia"];
s.t. final_especialista_depHockey_{e in FinalDeporteHockey, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Hockey"];
s.t. final_especialista_depJudo_{e in FinalDeporteJudo, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Judo"];
s.t. final_especialista_depKarate_{e in FinalDeporteKarate, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Karate"];
s.t. final_especialista_depLuchaLibre_{e in FinalDeporteLuchaLibre, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "LuchaLibre"];
s.t. final_especialista_depNatacion_{e in FinalDeporteNatacion, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Natacion"];
s.t. final_especialista_depPentatlon_{e in FinalDeportePentatlon, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Pentatlon"];
s.t. final_especialista_depRemo_{e in FinalDeporteRemo, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Remo"];
s.t. final_especialista_depRugby7_{e in FinalDeporteRugby7, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Rugby7"];
s.t. final_especialista_depTaekwondo_{e in FinalDeporteTaekwondo, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Taekwondo"];
s.t. final_especialista_depTenis_{e in FinalDeporteTenis, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Tenis"];
s.t. final_especialista_depTenisDeMesa_{e in FinalDeporteTenisDeMesa, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "TenisDeMesa"];
s.t. final_especialista_depTiroYVariantes_{e in FinalDeporteTiroYVariantes, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "TiroYVariantes"];
s.t. final_especialista_depTriatlon_{e in FinalDeporteTriatlon, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "Triatlon"];
s.t. final_especialista_depNavegacionAVela_{e in FinalDeporteNavegacionAVela, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "NavegacionAVela"];
s.t. final_especialista_depHandballPlaya_{e in FinalDeporteHandballPlaya, i in Equipos}: Y_EQ_[e, i] <= Especialista[i, "HandballPlaya"];
s.t. transmision{e in Eventos}: Y_[e] = sum{c in Canales} T_[e, c];
s.t. transm_0{c in Canales}: T_["7_Badminton_9.00_12.30", c]*2 + T_["7_Basquet_9.00_14.00", c]*2 + T_["7_VoleyPlaya_9.00_16.50", c]*2 + T_["7_Escalada_9.00_9.25", c]*1 + T_["7_Esgrima_9.00_13.35", c]*2 + T_["7_TiroYVariantes_9.00_12.15", c]*1<= 2;
s.t. transm_1{c in Canales}: T_["7_Badminton_9.00_12.30", c]*2 + T_["7_Basquet_9.00_14.00", c]*2 + T_["7_VoleyPlaya_9.00_16.50", c]*2 + T_["7_Esgrima_9.00_13.35", c]*2 + T_["7_Hockey_9.30_18.30", c]*2 + T_["7_Judo_10.00_12.25", c]*2 + T_["7_Natacion_10.00_11.30", c]*1 + T_["7_Tenis_10.00_18.00", c]*2 + T_["7_TenisDeMesa_10.00_14.30", c]*2 + T_["7_TiroYVariantes_9.00_12.15", c]*1 + T_["7_Triatlon_11.00_13.00", c]*1<= 2;
s.t. transm_2{c in Canales}: T_["7_Badminton_9.00_12.30", c]*2 + T_["7_Basquet_9.00_14.00", c]*2 + T_["7_VoleyPlaya_9.00_16.50", c]*2 + T_["7_Escalada_12.00_14.10", c]*1 + T_["7_Esgrima_9.00_13.35", c]*2 + T_["7_Hockey_9.30_18.30", c]*2 + T_["7_Judo_10.00_12.25", c]*2 + T_["7_Tenis_10.00_18.00", c]*2 + T_["7_TenisDeMesa_10.00_14.30", c]*2 + T_["7_TiroYVariantes_9.00_12.15", c]*1 + T_["7_Triatlon_11.00_13.00", c]*1 + T_["7_NavegacionAVela_12.00_18.00", c]*1<= 2;
s.t. transm_3{c in Canales}: T_["7_Badminton_13.30_17.00", c]*2 + T_["7_Basquet_9.00_14.00", c]*2 + T_["7_VoleyPlaya_9.00_16.50", c]*2 + T_["7_Escalada_12.00_14.10", c]*1 + T_["7_Esgrima_9.00_13.35", c]*2 + T_["7_Hockey_9.30_18.30", c]*2 + T_["7_Tenis_10.00_18.00", c]*2 + T_["7_TenisDeMesa_10.00_14.30", c]*2 + T_["7_NavegacionAVela_12.00_18.00", c]*1<= 2;
s.t. transm_4{c in Canales}: T_["7_Badminton_13.30_17.00", c]*2 + T_["7_VoleyPlaya_9.00_16.50", c]*2 + T_["7_Escalada_12.00_14.10", c]*1 + T_["7_Futsal_14.00_22.00", c]*2 + T_["7_Gimnasia_14.00_16.55", c]*1 + T_["7_Hockey_9.30_18.30", c]*2 + T_["7_Taekwondo_14.00_17.00", c]*2 + T_["7_Tenis_10.00_18.00", c]*2 + T_["7_TenisDeMesa_10.00_14.30", c]*2 + T_["7_NavegacionAVela_12.00_18.00", c]*1<= 2;
s.t. transm_5{c in Canales}: T_["7_Badminton_13.30_17.00", c]*2 + T_["7_BaileDeportivo_15.15_18.00", c]*1 + T_["7_VoleyPlaya_9.00_16.50", c]*2 + T_["7_Escalada_15.00_16.20", c]*1 + T_["7_Futsal_14.00_22.00", c]*2 + T_["7_Gimnasia_14.00_16.55", c]*1 + T_["7_Hockey_9.30_18.30", c]*2 + T_["7_Judo_15.00_16.00", c]*2 + T_["7_Remo_15.30_17.05", c]*1 + T_["7_Taekwondo_14.00_17.00", c]*2 + T_["7_Tenis_10.00_18.00", c]*2 + T_["7_NavegacionAVela_12.00_18.00", c]*1<= 2;
s.t. transm_6{c in Canales}: T_["7_Badminton_13.30_17.00", c]*2 + T_["7_BaileDeportivo_15.15_18.00", c]*1 + T_["7_VoleyPlaya_9.00_16.50", c]*2 + T_["7_Escalada_15.00_16.20", c]*1 + T_["7_Futsal_14.00_22.00", c]*2 + T_["7_Gimnasia_14.00_16.55", c]*1 + T_["7_Halterofilia_16.00_17.30", c]*1 + T_["7_Hockey_9.30_18.30", c]*2 + T_["7_Remo_15.30_17.05", c]*1 + T_["7_Taekwondo_14.00_17.00", c]*2 + T_["7_Tenis_10.00_18.00", c]*2 + T_["7_TenisDeMesa_16.00_20.30", c]*2 + T_["7_NavegacionAVela_12.00_18.00", c]*1<= 2;
s.t. transm_7{c in Canales}: T_["7_Badminton_13.30_17.00", c]*2 + T_["7_BaileDeportivo_15.15_18.00", c]*1 + T_["7_VoleyPlaya_9.00_16.50", c]*2 + T_["7_Esgrima_16.30_19.40", c]*2 + T_["7_Futsal_14.00_22.00", c]*2 + T_["7_Gimnasia_14.00_16.55", c]*1 + T_["7_Halterofilia_16.00_17.30", c]*1 + T_["7_Hockey_9.30_18.30", c]*2 + T_["7_Remo_15.30_17.05", c]*1 + T_["7_Taekwondo_14.00_17.00", c]*2 + T_["7_Tenis_10.00_18.00", c]*2 + T_["7_TenisDeMesa_16.00_20.30", c]*2 + T_["7_NavegacionAVela_12.00_18.00", c]*1<= 2;
s.t. transm_8{c in Canales}: T_["7_Badminton_18.00_21.00", c]*2 + T_["7_Esgrima_16.30_19.40", c]*2 + T_["7_Futsal_14.00_22.00", c]*2 + T_["7_Hockey_9.30_18.30", c]*2 + T_["7_Natacion_18.00_19.15", c]*1 + T_["7_TenisDeMesa_16.00_20.30", c]*2<= 2;
s.t. transm_9{c in Canales}: T_["7_Badminton_18.00_21.00", c]*2 + T_["7_Esgrima_16.30_19.40", c]*2 + T_["7_Futsal_14.00_22.00", c]*2 + T_["7_Gimnasia_19.00_21.50", c]*1 + T_["7_Natacion_18.00_19.15", c]*1 + T_["7_Taekwondo_19.00_21.00", c]*2 + T_["7_TenisDeMesa_16.00_20.30", c]*2<= 2;
s.t. transm_10{c in Canales}: T_["7_Badminton_18.00_21.00", c]*2 + T_["7_Futsal_14.00_22.00", c]*2 + T_["7_Gimnasia_19.00_21.50", c]*1 + T_["7_Halterofilia_20.00_21.30", c]*1 + T_["7_Taekwondo_19.00_21.00", c]*2 + T_["7_TenisDeMesa_16.00_20.30", c]*2<= 2;
s.t. transm_11{c in Canales}: T_["8_Badminton_9.00_12.30", c]*2 + T_["8_Basquet_9.00_14.00", c]*2 + T_["8_VoleyPlaya_9.00_16.50", c]*2 + T_["8_Escalada_9.00_9.25", c]*1 + T_["8_Esgrima_9.00_13.45", c]*2 + T_["8_TiroYVariantes_9.00_12.15", c]*1<= 2;
s.t. transm_12{c in Canales}: T_["8_Badminton_9.00_12.30", c]*2 + T_["8_Basquet_9.00_14.00", c]*2 + T_["8_VoleyPlaya_9.00_16.50", c]*2 + T_["8_Esgrima_9.00_13.45", c]*2 + T_["8_Hockey_9.30_18.30", c]*2 + T_["8_Judo_10.00_12.25", c]*2 + T_["8_Natacion_10.00_11.30", c]*1 + T_["8_Tenis_10.00_18.00", c]*2 + T_["8_TenisDeMesa_10.00_14.30", c]*2 + T_["8_TiroYVariantes_9.00_12.15", c]*1 + T_["8_Triatlon_11.00_13.00", c]*1 + T_["8_HandballPlaya_10.00_13.20", c]*2<= 2;
s.t. transm_13{c in Canales}: T_["8_Badminton_9.00_12.30", c]*2 + T_["8_Basquet_9.00_14.00", c]*2 + T_["8_VoleyPlaya_9.00_16.50", c]*2 + T_["8_Escalada_12.00_14.10", c]*1 + T_["8_Esgrima_9.00_13.45", c]*2 + T_["8_Hockey_9.30_18.30", c]*2 + T_["8_Judo_10.00_12.25", c]*2 + T_["8_Tenis_10.00_18.00", c]*2 + T_["8_TenisDeMesa_10.00_14.30", c]*2 + T_["8_TiroYVariantes_9.00_12.15", c]*1 + T_["8_Triatlon_11.00_13.00", c]*1 + T_["8_NavegacionAVela_12.00_18.00", c]*1 + T_["8_HandballPlaya_10.00_13.20", c]*2<= 2;
s.t. transm_14{c in Canales}: T_["8_Basquet_9.00_14.00", c]*2 + T_["8_VoleyPlaya_9.00_16.50", c]*2 + T_["8_Escalada_12.00_14.10", c]*1 + T_["8_Esgrima_9.00_13.45", c]*2 + T_["8_Hockey_9.30_18.30", c]*2 + T_["8_Remo_13.00_14.30", c]*1 + T_["8_Tenis_10.00_18.00", c]*2 + T_["8_TenisDeMesa_10.00_14.30", c]*2 + T_["8_NavegacionAVela_12.00_18.00", c]*1 + T_["8_HandballPlaya_10.00_13.20", c]*2<= 2;
s.t. transm_15{c in Canales}: T_["8_Badminton_13.30_17.00", c]*2 + T_["8_Basquet_9.00_14.00", c]*2 + T_["8_VoleyPlaya_9.00_16.50", c]*2 + T_["8_Escalada_12.00_14.10", c]*1 + T_["8_Esgrima_9.00_13.45", c]*2 + T_["8_Hockey_9.30_18.30", c]*2 + T_["8_Remo_13.00_14.30", c]*1 + T_["8_Tenis_10.00_18.00", c]*2 + T_["8_TenisDeMesa_10.00_14.30", c]*2 + T_["8_NavegacionAVela_12.00_18.00", c]*1<= 2;
s.t. transm_16{c in Canales}: T_["8_Badminton_13.30_17.00", c]*2 + T_["8_VoleyPlaya_9.00_16.50", c]*2 + T_["8_Equitacion_14.00_15.30", c]*1 + T_["8_Escalada_12.00_14.10", c]*1 + T_["8_Futsal_14.00_22.00", c]*2 + T_["8_Gimnasia_14.00_16.45", c]*1 + T_["8_Hockey_9.30_18.30", c]*2 + T_["8_Remo_13.00_14.30", c]*1 + T_["8_Taekwondo_14.00_17.00", c]*2 + T_["8_Tenis_10.00_18.00", c]*2 + T_["8_TenisDeMesa_10.00_14.30", c]*2 + T_["8_NavegacionAVela_12.00_18.00", c]*1<= 2;
s.t. transm_17{c in Canales}: T_["8_Badminton_13.30_17.00", c]*2 + T_["8_BaileDeportivo_15.15_18.00", c]*1 + T_["8_VoleyPlaya_9.00_16.50", c]*2 + T_["8_Equitacion_14.00_15.30", c]*1 + T_["8_Escalada_15.00_16.20", c]*1 + T_["8_Futsal_14.00_22.00", c]*2 + T_["8_Gimnasia_14.00_16.45", c]*1 + T_["8_Hockey_9.30_18.30", c]*2 + T_["8_Judo_15.00_16.00", c]*2 + T_["8_Taekwondo_14.00_17.00", c]*2 + T_["8_Tenis_10.00_18.00", c]*2 + T_["8_NavegacionAVela_12.00_18.00", c]*1 + T_["8_HandballPlaya_14.30_17.50", c]*2<= 2;
s.t. transm_18{c in Canales}: T_["8_Badminton_13.30_17.00", c]*2 + T_["8_BaileDeportivo_15.15_18.00", c]*1 + T_["8_VoleyPlaya_9.00_16.50", c]*2 + T_["8_Escalada_15.00_16.20", c]*1 + T_["8_Futsal_14.00_22.00", c]*2 + T_["8_Gimnasia_14.00_16.45", c]*1 + T_["8_Hockey_9.30_18.30", c]*2 + T_["8_Judo_15.00_16.00", c]*2 + T_["8_Remo_15.30_17.00", c]*1 + T_["8_Taekwondo_14.00_17.00", c]*2 + T_["8_Tenis_10.00_18.00", c]*2 + T_["8_NavegacionAVela_12.00_18.00", c]*1 + T_["8_HandballPlaya_14.30_17.50", c]*2<= 2;
s.t. transm_19{c in Canales}: T_["8_Badminton_13.30_17.00", c]*2 + T_["8_BaileDeportivo_15.15_18.00", c]*1 + T_["8_VoleyPlaya_9.00_16.50", c]*2 + T_["8_Escalada_15.00_16.20", c]*1 + T_["8_Futsal_14.00_22.00", c]*2 + T_["8_Gimnasia_14.00_16.45", c]*1 + T_["8_Halterofilia_16.00_17.30", c]*1 + T_["8_Hockey_9.30_18.30", c]*2 + T_["8_Remo_15.30_17.00", c]*1 + T_["8_Taekwondo_14.00_17.00", c]*2 + T_["8_Tenis_10.00_18.00", c]*2 + T_["8_TenisDeMesa_16.00_20.30", c]*2 + T_["8_NavegacionAVela_12.00_18.00", c]*1 + T_["8_HandballPlaya_14.30_17.50", c]*2<= 2;
s.t. transm_20{c in Canales}: T_["8_BaileDeportivo_15.15_18.00", c]*1 + T_["8_Esgrima_17.00_20.10", c]*2 + T_["8_Futsal_14.00_22.00", c]*2 + T_["8_Halterofilia_16.00_17.30", c]*1 + T_["8_Hockey_9.30_18.30", c]*2 + T_["8_Tenis_10.00_18.00", c]*2 + T_["8_TenisDeMesa_16.00_20.30", c]*2 + T_["8_NavegacionAVela_12.00_18.00", c]*1 + T_["8_HandballPlaya_14.30_17.50", c]*2<= 2;
s.t. transm_21{c in Canales}: T_["8_Badminton_18.00_21.00", c]*2 + T_["8_Esgrima_17.00_20.10", c]*2 + T_["8_Futsal_14.00_22.00", c]*2 + T_["8_Hockey_9.30_18.30", c]*2 + T_["8_Natacion_18.00_19.55", c]*1 + T_["8_TenisDeMesa_16.00_20.30", c]*2<= 2;
s.t. transm_22{c in Canales}: T_["8_Badminton_18.00_21.00", c]*2 + T_["8_Esgrima_17.00_20.10", c]*2 + T_["8_Futsal_14.00_22.00", c]*2 + T_["8_Gimnasia_19.00_21.25", c]*1 + T_["8_Natacion_18.00_19.55", c]*1 + T_["8_Taekwondo_19.00_21.00", c]*2 + T_["8_TenisDeMesa_16.00_20.30", c]*2<= 2;
s.t. transm_23{c in Canales}: T_["8_Badminton_18.00_21.00", c]*2 + T_["8_Esgrima_17.00_20.10", c]*2 + T_["8_Futsal_14.00_22.00", c]*2 + T_["8_Gimnasia_19.00_21.25", c]*1 + T_["8_Halterofilia_20.00_21.30", c]*1 + T_["8_Taekwondo_19.00_21.00", c]*2 + T_["8_TenisDeMesa_16.00_20.30", c]*2<= 2;
s.t. transm_24{c in Canales}: T_["9_Badminton_9.00_12.30", c]*2 + T_["9_Basquet_9.00_14.00", c]*2 + T_["9_VoleyPlaya_9.00_16.50", c]*2 + T_["9_Escalada_10.00_10.20", c]*1 + T_["9_Esgrima_9.00_13.25", c]*2 + T_["9_Golf_8.30_17.00", c]*1 + T_["9_Hockey_9.30_18.30", c]*2 + T_["9_Judo_10.00_11.40", c]*2 + T_["9_Natacion_10.00_11.30", c]*1 + T_["9_Tenis_10.00_18.00", c]*2 + T_["9_TenisDeMesa_10.00_13.00", c]*2 + T_["9_TiroYVariantes_9.00_12.15", c]*1 + T_["9_HandballPlaya_10.00_13.20", c]*2<= 2;
s.t. transm_25{c in Canales}: T_["9_Badminton_9.00_12.30", c]*2 + T_["9_Basquet_9.00_14.00", c]*2 + T_["9_VoleyPlaya_9.00_16.50", c]*2 + T_["9_Escalada_12.00_13.15", c]*1 + T_["9_Esgrima_9.00_13.25", c]*2 + T_["9_Golf_8.30_17.00", c]*1 + T_["9_Hockey_9.30_18.30", c]*2 + T_["9_Tenis_10.00_18.00", c]*2 + T_["9_TenisDeMesa_10.00_13.00", c]*2 + T_["9_TiroYVariantes_9.00_12.15", c]*1 + T_["9_NavegacionAVela_12.00_18.00", c]*1 + T_["9_HandballPlaya_10.00_13.20", c]*2<= 2;
s.t. transm_26{c in Canales}: T_["9_Badminton_13.30_17.00", c]*2 + T_["9_Basquet_9.00_14.00", c]*2 + T_["9_VoleyPlaya_9.00_16.50", c]*2 + T_["9_Golf_8.30_17.00", c]*1 + T_["9_Hockey_9.30_18.30", c]*2 + T_["9_Tenis_10.00_18.00", c]*2 + T_["9_NavegacionAVela_12.00_18.00", c]*1<= 2;
s.t. transm_27{c in Canales}: T_["9_Badminton_13.30_17.00", c]*2 + T_["9_VoleyPlaya_9.00_16.50", c]*2 + T_["9_Equitacion_14.00_16.00", c]*1 + T_["9_Futsal_14.00_22.00", c]*2 + T_["9_Gimnasia_14.00_16.50", c]*1 + T_["9_Golf_8.30_17.00", c]*1 + T_["9_Halterofilia_14.30_16.00", c]*1 + T_["9_Hockey_9.30_18.30", c]*2 + T_["9_Judo_15.00_15.40", c]*2 + T_["9_Remo_15.00_17.25", c]*1 + T_["9_Taekwondo_14.00_17.00", c]*2 + T_["9_Tenis_10.00_18.00", c]*2 + T_["9_TenisDeMesa_15.00_21.00", c]*2 + T_["9_NavegacionAVela_12.00_18.00", c]*1 + T_["9_HandballPlaya_14.30_17.50", c]*2<= 2;
s.t. transm_28{c in Canales}: T_["9_Badminton_13.30_17.00", c]*2 + T_["9_VoleyPlaya_9.00_16.50", c]*2 + T_["9_Escalada_16.00_16.40", c]*1 + T_["9_Esgrima_16.30_19.35", c]*2 + T_["9_Futsal_14.00_22.00", c]*2 + T_["9_Gimnasia_14.00_16.50", c]*1 + T_["9_Golf_8.30_17.00", c]*1 + T_["9_Hockey_9.30_18.30", c]*2 + T_["9_Remo_15.00_17.25", c]*1 + T_["9_Taekwondo_14.00_17.00", c]*2 + T_["9_Tenis_10.00_18.00", c]*2 + T_["9_TenisDeMesa_15.00_21.00", c]*2 + T_["9_NavegacionAVela_12.00_18.00", c]*1 + T_["9_HandballPlaya_14.30_17.50", c]*2<= 2;
s.t. transm_29{c in Canales}: T_["9_Badminton_18.00_21.00", c]*2 + T_["9_Esgrima_16.30_19.35", c]*2 + T_["9_Futsal_14.00_22.00", c]*2 + T_["9_Halterofilia_18.00_19.30", c]*1 + T_["9_Hockey_9.30_18.30", c]*2 + T_["9_Natacion_18.00_19.40", c]*1 + T_["9_TenisDeMesa_15.00_21.00", c]*2<= 2;
s.t. transm_30{c in Canales}: T_["9_Badminton_18.00_21.00", c]*2 + T_["9_Esgrima_16.30_19.35", c]*2 + T_["9_Futsal_14.00_22.00", c]*2 + T_["9_Gimnasia_19.00_21.50", c]*1 + T_["9_Halterofilia_18.00_19.30", c]*1 + T_["9_Natacion_18.00_19.40", c]*1 + T_["9_Taekwondo_19.00_21.00", c]*2 + T_["9_TenisDeMesa_15.00_21.00", c]*2<= 2;
s.t. transm_31{c in Canales}: T_["10_Basquet_9.00_14.00", c]*2 + T_["10_VoleyPlaya_9.00_16.50", c]*2 + T_["10_Escalada_10.00_10.20", c]*1 + T_["10_Esgrima_9.30_15.05", c]*2 + T_["10_Golf_8.30_17.00", c]*1 + T_["10_Hockey_9.30_18.30", c]*2 + T_["10_Judo_10.00_13.15", c]*2 + T_["10_Natacion_10.00_11.30", c]*1 + T_["10_Tenis_10.00_18.00", c]*2 + T_["10_TenisDeMesa_10.00_13.00", c]*2 + T_["10_TiroYVariantes_9.00_12.15", c]*1 + T_["10_HandballPlaya_10.00_13.20", c]*2<= 2;
s.t. transm_32{c in Canales}: T_["10_Basquet_9.00_14.00", c]*2 + T_["10_VoleyPlaya_9.00_16.50", c]*2 + T_["10_Escalada_12.00_13.15", c]*1 + T_["10_Esgrima_9.30_15.05", c]*2 + T_["10_Golf_8.30_17.00", c]*1 + T_["10_Hockey_9.30_18.30", c]*2 + T_["10_Judo_10.00_13.15", c]*2 + T_["10_Tenis_10.00_18.00", c]*2 + T_["10_TenisDeMesa_10.00_13.00", c]*2 + T_["10_TiroYVariantes_9.00_12.15", c]*1 + T_["10_NavegacionAVela_12.00_18.00", c]*1 + T_["10_HandballPlaya_10.00_13.20", c]*2<= 2;
s.t. transm_33{c in Canales}: T_["10_Basquet_9.00_14.00", c]*2 + T_["10_VoleyPlaya_9.00_16.50", c]*2 + T_["10_Esgrima_9.30_15.05", c]*2 + T_["10_Golf_8.30_17.00", c]*1 + T_["10_Hockey_9.30_18.30", c]*2 + T_["10_Tenis_10.00_18.00", c]*2 + T_["10_TiroYVariantes_13.15_15.30", c]*1 + T_["10_NavegacionAVela_12.00_18.00", c]*1 + T_["10_HandballPlaya_10.00_13.20", c]*2<= 2;
s.t. transm_34{c in Canales}: T_["10_Badminton_14.00_16.15", c]*2 + T_["10_VoleyPlaya_9.00_16.50", c]*2 + T_["10_Esgrima_9.30_15.05", c]*2 + T_["10_Futsal_14.00_22.00", c]*2 + T_["10_Gimnasia_14.00_16.50", c]*1 + T_["10_Golf_8.30_17.00", c]*1 + T_["10_Hockey_9.30_18.30", c]*2 + T_["10_Judo_15.00_16.30", c]*2 + T_["10_Remo_14.45_17.25", c]*1 + T_["10_Taekwondo_14.00_17.00", c]*2 + T_["10_Tenis_10.00_18.00", c]*2 + T_["10_TiroYVariantes_13.15_15.30", c]*1 + T_["10_NavegacionAVela_12.00_18.00", c]*1<= 2;
s.t. transm_35{c in Canales}: T_["10_Badminton_14.00_16.15", c]*2 + T_["10_VoleyPlaya_9.00_16.50", c]*2 + T_["10_Escalada_16.00_16.40", c]*1 + T_["10_Futsal_14.00_22.00", c]*2 + T_["10_Gimnasia_14.00_16.50", c]*1 + T_["10_Golf_8.30_17.00", c]*1 + T_["10_Hockey_9.30_18.30", c]*2 + T_["10_Judo_15.00_16.30", c]*2 + T_["10_Remo_14.45_17.25", c]*1 + T_["10_Taekwondo_14.00_17.00", c]*2 + T_["10_Tenis_10.00_18.00", c]*2 + T_["10_TenisDeMesa_16.00_19.30", c]*2 + T_["10_NavegacionAVela_12.00_18.00", c]*1<= 2;
s.t. transm_36{c in Canales}: T_["10_BaileDeportivo_16.30_18.00", c]*1 + T_["10_VoleyPlaya_9.00_16.50", c]*2 + T_["10_Escalada_16.00_16.40", c]*1 + T_["10_Futsal_14.00_22.00", c]*2 + T_["10_Gimnasia_14.00_16.50", c]*1 + T_["10_Golf_8.30_17.00", c]*1 + T_["10_Hockey_9.30_18.30", c]*2 + T_["10_Remo_14.45_17.25", c]*1 + T_["10_Taekwondo_14.00_17.00", c]*2 + T_["10_Tenis_10.00_18.00", c]*2 + T_["10_TenisDeMesa_16.00_19.30", c]*2 + T_["10_NavegacionAVela_12.00_18.00", c]*1<= 2;
s.t. transm_37{c in Canales}: T_["10_Badminton_18.00_21.00", c]*2 + T_["10_Futsal_14.00_22.00", c]*2 + T_["10_Hockey_9.30_18.30", c]*2 + T_["10_Natacion_18.00_19.40", c]*1 + T_["10_TenisDeMesa_16.00_19.30", c]*2<= 2;
s.t. transm_38{c in Canales}: T_["10_Badminton_18.00_21.00", c]*2 + T_["10_Futsal_14.00_22.00", c]*2 + T_["10_Gimnasia_19.00_22.10", c]*1 + T_["10_Natacion_18.00_19.40", c]*1 + T_["10_Taekwondo_19.00_21.00", c]*2 + T_["10_TenisDeMesa_16.00_19.30", c]*2<= 2;
s.t. transm_39{c in Canales}: T_["11_Basquet_10.00_15.00", c]*2 + T_["11_VoleyPlaya_9.00_16.50", c]*2 + T_["11_Golf_8.30_17.20", c]*1 + T_["11_Hockey_9.30_18.30", c]*2 + T_["11_Natacion_10.00_11.30", c]*1 + T_["11_Tenis_10.00_18.00", c]*2 + T_["11_TiroYVariantes_9.00_12.30", c]*1 + T_["11_Triatlon_11.00_13.30", c]*1 + T_["11_HandballPlaya_10.00_13.20", c]*2<= 2;
s.t. transm_40{c in Canales}: T_["11_Badminton_12.00_15.20", c]*2 + T_["11_Basquet_10.00_15.00", c]*2 + T_["11_VoleyPlaya_9.00_16.50", c]*2 + T_["11_Golf_8.30_17.20", c]*1 + T_["11_Hockey_9.30_18.30", c]*2 + T_["11_Tenis_10.00_18.00", c]*2 + T_["11_TiroYVariantes_9.00_12.30", c]*1 + T_["11_Triatlon_11.00_13.30", c]*1 + T_["11_NavegacionAVela_12.00_18.00", c]*1 + T_["11_HandballPlaya_10.00_13.20", c]*2<= 2;
s.t. transm_41{c in Canales}: T_["11_Atletismo_14.30_17.25", c]*1 + T_["11_Badminton_12.00_15.20", c]*2 + T_["11_Basquet_10.00_15.00", c]*2 + T_["11_VoleyPlaya_9.00_16.50", c]*2 + T_["11_Futsal_14.00_22.00", c]*2 + T_["11_Golf_8.30_17.20", c]*1 + T_["11_Halterofilia_14.30_16.00", c]*1 + T_["11_Hockey_9.30_18.30", c]*2 + T_["11_Taekwondo_14.00_17.00", c]*2 + T_["11_Tenis_10.00_18.00", c]*2 + T_["11_TiroYVariantes_13.45_16.00", c]*1 + T_["11_NavegacionAVela_12.00_18.00", c]*1 + T_["11_HandballPlaya_14.30_17.50", c]*2<= 2;
s.t. transm_42{c in Canales}: T_["11_Atletismo_14.30_17.25", c]*1 + T_["11_BaileDeportivo_16.15_17.55", c]*1 + T_["11_VoleyPlaya_9.00_16.50", c]*2 + T_["11_Futsal_14.00_22.00", c]*2 + T_["11_Golf_8.30_17.20", c]*1 + T_["11_Hockey_9.30_18.30", c]*2 + T_["11_Taekwondo_14.00_17.00", c]*2 + T_["11_Tenis_10.00_18.00", c]*2 + T_["11_NavegacionAVela_12.00_18.00", c]*1 + T_["11_HandballPlaya_14.30_17.50", c]*2<= 2;
s.t. transm_43{c in Canales}: T_["11_Atletismo_14.30_17.25", c]*1 + T_["11_BaileDeportivo_16.15_17.55", c]*1 + T_["11_Futsal_14.00_22.00", c]*2 + T_["11_Gimnasia_17.00_21.05", c]*1 + T_["11_Golf_8.30_17.20", c]*1 + T_["11_Hockey_9.30_18.30", c]*2 + T_["11_Tenis_10.00_18.00", c]*2 + T_["11_NavegacionAVela_12.00_18.00", c]*1 + T_["11_HandballPlaya_14.30_17.50", c]*2<= 2;
s.t. transm_44{c in Canales}: T_["11_Badminton_18.00_21.00", c]*2 + T_["11_Futsal_14.00_22.00", c]*2 + T_["11_Gimnasia_17.00_21.05", c]*1 + T_["11_Halterofilia_18.00_19.30", c]*1 + T_["11_Hockey_9.30_18.30", c]*2 + T_["11_Natacion_18.00_19.30", c]*1<= 2;
s.t. transm_45{c in Canales}: T_["11_Badminton_18.00_21.00", c]*2 + T_["11_Futsal_14.00_22.00", c]*2 + T_["11_Gimnasia_17.00_21.05", c]*1 + T_["11_Halterofilia_18.00_19.30", c]*1 + T_["11_Natacion_18.00_19.30", c]*1 + T_["11_Taekwondo_19.00_21.00", c]*2<= 2;
s.t. transm_46{c in Canales}: T_["12_Arqueria_10.00_13.00", c]*1 + T_["12_Badminton_11.00_12.40", c]*2 + T_["12_Basquet_10.00_15.00", c]*2 + T_["12_VoleyPlaya_9.00_16.50", c]*2 + T_["12_Hockey_8.00_18.00", c]*2 + T_["12_LuchaLibre_10.00_11.15", c]*2 + T_["12_Natacion_10.00_11.30", c]*1 + T_["12_Pentatlon_10.00_11.45", c]*1 + T_["12_Tenis_10.00_18.00", c]*2 + T_["12_TenisDeMesa_10.00_14.30", c]*2 + T_["12_TiroYVariantes_9.00_12.30", c]*1 + T_["12_HandballPlaya_10.00_13.20", c]*2<= 2;
s.t. transm_47{c in Canales}: T_["12_Arqueria_10.00_13.00", c]*1 + T_["12_Badminton_11.00_12.40", c]*2 + T_["12_Basquet_10.00_15.00", c]*2 + T_["12_VoleyPlaya_9.00_16.50", c]*2 + T_["12_Hockey_8.00_18.00", c]*2 + T_["12_Tenis_10.00_18.00", c]*2 + T_["12_TenisDeMesa_10.00_14.30", c]*2 + T_["12_TiroYVariantes_9.00_12.30", c]*1 + T_["12_NavegacionAVela_12.00_18.00", c]*1 + T_["12_HandballPlaya_10.00_13.20", c]*2<= 2;
s.t. transm_48{c in Canales}: T_["12_Badminton_13.30_15.00", c]*2 + T_["12_Basquet_10.00_15.00", c]*2 + T_["12_VoleyPlaya_9.00_16.50", c]*2 + T_["12_Equitacion_14.00_15.30", c]*1 + T_["12_Futsal_14.00_22.00", c]*2 + T_["12_Hockey_8.00_18.00", c]*2 + T_["12_Pentatlon_14.00_15.45", c]*1 + T_["12_Tenis_10.00_18.00", c]*2 + T_["12_TenisDeMesa_10.00_14.30", c]*2 + T_["12_TiroYVariantes_13.45_16.00", c]*1 + T_["12_NavegacionAVela_12.00_18.00", c]*1<= 2;
s.t. transm_49{c in Canales}: T_["12_Atletismo_14.30_17.30", c]*1 + T_["12_Badminton_13.30_15.00", c]*2 + T_["12_Basquet_10.00_15.00", c]*2 + T_["12_VoleyPlaya_9.00_16.50", c]*2 + T_["12_Equitacion_14.00_15.30", c]*1 + T_["12_Futsal_14.00_22.00", c]*2 + T_["12_Halterofilia_14.30_16.00", c]*1 + T_["12_Hockey_8.00_18.00", c]*2 + T_["12_Pentatlon_14.00_15.45", c]*1 + T_["12_Tenis_10.00_18.00", c]*2 + T_["12_TiroYVariantes_13.45_16.00", c]*1 + T_["12_NavegacionAVela_12.00_18.00", c]*1 + T_["12_HandballPlaya_14.30_17.50", c]*2<= 2;
s.t. transm_50{c in Canales}: T_["12_Atletismo_14.30_17.30", c]*1 + T_["12_Badminton_15.30_19.15", c]*2 + T_["12_VoleyPlaya_9.00_16.50", c]*2 + T_["12_Futsal_14.00_22.00", c]*2 + T_["12_Halterofilia_14.30_16.00", c]*1 + T_["12_Hockey_8.00_18.00", c]*2 + T_["12_Pentatlon_14.00_15.45", c]*1 + T_["12_Tenis_10.00_18.00", c]*2 + T_["12_TiroYVariantes_13.45_16.00", c]*1 + T_["12_NavegacionAVela_12.00_18.00", c]*1 + T_["12_HandballPlaya_14.30_17.50", c]*2<= 2;
s.t. transm_51{c in Canales}: T_["12_Atletismo_14.30_17.30", c]*1 + T_["12_Badminton_15.30_19.15", c]*2 + T_["12_VoleyPlaya_9.00_16.50", c]*2 + T_["12_Futsal_14.00_22.00", c]*2 + T_["12_Hockey_8.00_18.00", c]*2 + T_["12_Tenis_10.00_18.00", c]*2 + T_["12_TenisDeMesa_16.00_20.30", c]*2 + T_["12_NavegacionAVela_12.00_18.00", c]*1 + T_["12_HandballPlaya_14.30_17.50", c]*2<= 2;
s.t. transm_52{c in Canales}: T_["12_Atletismo_14.30_17.30", c]*1 + T_["12_Badminton_15.30_19.15", c]*2 + T_["12_Futsal_14.00_22.00", c]*2 + T_["12_Gimnasia_17.00_19.25", c]*1 + T_["12_Hockey_8.00_18.00", c]*2 + T_["12_LuchaLibre_17.00_19.30", c]*2 + T_["12_Tenis_10.00_18.00", c]*2 + T_["12_TenisDeMesa_16.00_20.30", c]*2 + T_["12_NavegacionAVela_12.00_18.00", c]*1 + T_["12_HandballPlaya_14.30_17.50", c]*2<= 2;
s.t. transm_53{c in Canales}: T_["12_Badminton_15.30_19.15", c]*2 + T_["12_Futsal_14.00_22.00", c]*2 + T_["12_Gimnasia_17.00_19.25", c]*1 + T_["12_Halterofilia_18.00_19.30", c]*1 + T_["12_LuchaLibre_17.00_19.30", c]*2 + T_["12_Natacion_18.00_19.50", c]*1 + T_["12_TenisDeMesa_16.00_20.30", c]*2<= 2;
s.t. transm_54{c in Canales}: T_["13_Arqueria_9.00_13.00", c]*1 + T_["13_Basquet_10.00_15.00", c]*2 + T_["13_VoleyPlaya_9.00_16.50", c]*2 + T_["13_Ciclismo_11.00_13.00", c]*1 + T_["13_Golf_8.30_14.40", c]*1 + T_["13_Hockey_8.00_18.00", c]*2 + T_["13_LuchaLibre_10.00_14.10", c]*2 + T_["13_Pentatlon_12.00_12.30", c]*1 + T_["13_Rugby7_12.00_14.30", c]*2 + T_["13_Tenis_10.00_18.00", c]*2 + T_["13_TenisDeMesa_10.00_14.30", c]*2 + T_["13_NavegacionAVela_12.00_18.00", c]*1 + T_["13_HandballPlaya_9.30_12.50", c]*2<= 2;
s.t. transm_55{c in Canales}: T_["13_Basquet_10.00_15.00", c]*2 + T_["13_VoleyPlaya_9.00_16.50", c]*2 + T_["13_Equitacion_14.00_16.00", c]*1 + T_["13_Futsal_14.00_22.00", c]*2 + T_["13_Golf_8.30_14.40", c]*1 + T_["13_Hockey_8.00_18.00", c]*2 + T_["13_LuchaLibre_10.00_14.10", c]*2 + T_["13_Rugby7_12.00_14.30", c]*2 + T_["13_Tenis_10.00_18.00", c]*2 + T_["13_TenisDeMesa_10.00_14.30", c]*2 + T_["13_NavegacionAVela_12.00_18.00", c]*1<= 2;
s.t. transm_56{c in Canales}: T_["13_Basquet_10.00_15.00", c]*2 + T_["13_VoleyPlaya_9.00_16.50", c]*2 + T_["13_Equitacion_14.00_16.00", c]*1 + T_["13_Futsal_14.00_22.00", c]*2 + T_["13_Golf_8.30_14.40", c]*1 + T_["13_Hockey_8.00_18.00", c]*2 + T_["13_Rugby7_12.00_14.30", c]*2 + T_["13_Tenis_10.00_18.00", c]*2 + T_["13_TenisDeMesa_10.00_14.30", c]*2 + T_["13_NavegacionAVela_12.00_18.00", c]*1 + T_["13_HandballPlaya_14.10_18.00", c]*2<= 2;
s.t. transm_57{c in Canales}: T_["13_Atletismo_14.30_17.50", c]*1 + T_["13_Basquet_10.00_15.00", c]*2 + T_["13_VoleyPlaya_9.00_16.50", c]*2 + T_["13_Equitacion_14.00_16.00", c]*1 + T_["13_Futsal_14.00_22.00", c]*2 + T_["13_Golf_8.30_14.40", c]*1 + T_["13_Halterofilia_14.30_16.00", c]*1 + T_["13_Hockey_8.00_18.00", c]*2 + T_["13_Pentatlon_14.30_16.55", c]*1 + T_["13_Tenis_10.00_18.00", c]*2 + T_["13_NavegacionAVela_12.00_18.00", c]*1 + T_["13_HandballPlaya_14.10_18.00", c]*2<= 2;
s.t. transm_58{c in Canales}: T_["13_Atletismo_14.30_17.50", c]*1 + T_["13_VoleyPlaya_9.00_16.50", c]*2 + T_["13_Equitacion_14.00_16.00", c]*1 + T_["13_Futsal_14.00_22.00", c]*2 + T_["13_Halterofilia_14.30_16.00", c]*1 + T_["13_Hockey_8.00_18.00", c]*2 + T_["13_Pentatlon_14.30_16.55", c]*1 + T_["13_Rugby7_15.05_17.35", c]*2 + T_["13_Tenis_10.00_18.00", c]*2 + T_["13_NavegacionAVela_12.00_18.00", c]*1 + T_["13_HandballPlaya_14.10_18.00", c]*2<= 2;
s.t. transm_59{c in Canales}: T_["13_Atletismo_14.30_17.50", c]*1 + T_["13_VoleyPlaya_9.00_16.50", c]*2 + T_["13_Futsal_14.00_22.00", c]*2 + T_["13_Hockey_8.00_18.00", c]*2 + T_["13_Pentatlon_14.30_16.55", c]*1 + T_["13_Rugby7_15.05_17.35", c]*2 + T_["13_Tenis_10.00_18.00", c]*2 + T_["13_TenisDeMesa_16.00_20.30", c]*2 + T_["13_NavegacionAVela_12.00_18.00", c]*1 + T_["13_HandballPlaya_14.10_18.00", c]*2<= 2;
s.t. transm_60{c in Canales}: T_["13_Atletismo_14.30_17.50", c]*1 + T_["13_Futsal_14.00_22.00", c]*2 + T_["13_Gimnasia_17.00_20.00", c]*1 + T_["13_Hockey_8.00_18.00", c]*2 + T_["13_LuchaLibre_17.00_19.55", c]*2 + T_["13_Rugby7_15.05_17.35", c]*2 + T_["13_Tenis_10.00_18.00", c]*2 + T_["13_TenisDeMesa_16.00_20.30", c]*2 + T_["13_NavegacionAVela_12.00_18.00", c]*1 + T_["13_HandballPlaya_14.10_18.00", c]*2<= 2;
s.t. transm_61{c in Canales}: T_["13_Futsal_14.00_22.00", c]*2 + T_["13_Gimnasia_17.00_20.00", c]*1 + T_["13_Halterofilia_18.00_19.30", c]*1 + T_["13_LuchaLibre_17.00_19.55", c]*2 + T_["13_TenisDeMesa_16.00_20.30", c]*2<= 2;
s.t. transm_62{c in Canales}: T_["14_Arqueria_9.00_11.25", c]*1 + T_["14_Basquet_10.00_15.00", c]*2 + T_["14_VoleyPlaya_9.00_16.50", c]*2 + T_["14_Ciclismo_11.00_15.30", c]*1 + T_["14_Golf_8.30_16.30", c]*1 + T_["14_Hockey_8.30_12.30", c]*2 + T_["14_LuchaLibre_10.00_11.15", c]*2 + T_["14_Tenis_10.00_18.00", c]*2 + T_["14_TenisDeMesa_10.00_13.00", c]*2<= 2;
s.t. transm_63{c in Canales}: T_["14_Basquet_10.00_15.00", c]*2 + T_["14_VoleyPlaya_9.00_16.50", c]*2 + T_["14_Ciclismo_11.00_15.30", c]*1 + T_["14_Golf_8.30_16.30", c]*1 + T_["14_Hockey_8.30_12.30", c]*2 + T_["14_Pentatlon_12.00_12.30", c]*1 + T_["14_Rugby7_12.00_14.30", c]*2 + T_["14_Tenis_10.00_18.00", c]*2 + T_["14_TenisDeMesa_10.00_13.00", c]*2<= 2;
s.t. transm_64{c in Canales}: T_["14_Arqueria_14.00_16.45", c]*1 + T_["14_Atletismo_14.00_17.50", c]*1 + T_["14_Basquet_10.00_15.00", c]*2 + T_["14_VoleyPlaya_9.00_16.50", c]*2 + T_["14_Boxeo_13.00_16.15", c]*2 + T_["14_Ciclismo_11.00_15.30", c]*1 + T_["14_Golf_8.30_16.30", c]*1 + T_["14_Hockey_13.00_18.00", c]*2 + T_["14_Rugby7_12.00_14.30", c]*2 + T_["14_Tenis_10.00_18.00", c]*2<= 2;
s.t. transm_65{c in Canales}: T_["14_Arqueria_14.00_16.45", c]*1 + T_["14_Atletismo_14.00_17.50", c]*1 + T_["14_Basquet_10.00_15.00", c]*2 + T_["14_VoleyPlaya_9.00_16.50", c]*2 + T_["14_Boxeo_13.00_16.15", c]*2 + T_["14_Ciclismo_11.00_15.30", c]*1 + T_["14_Golf_8.30_16.30", c]*1 + T_["14_Hockey_13.00_18.00", c]*2 + T_["14_Pentatlon_14.30_16.55", c]*1 + T_["14_Tenis_10.00_18.00", c]*2<= 2;
s.t. transm_66{c in Canales}: T_["14_Arqueria_14.00_16.45", c]*1 + T_["14_Atletismo_14.00_17.50", c]*1 + T_["14_VoleyPlaya_9.00_16.50", c]*2 + T_["14_Boxeo_13.00_16.15", c]*2 + T_["14_Ciclismo_11.00_15.30", c]*1 + T_["14_Golf_8.30_16.30", c]*1 + T_["14_Hockey_13.00_18.00", c]*2 + T_["14_Pentatlon_14.30_16.55", c]*1 + T_["14_Rugby7_15.05_17.35", c]*2 + T_["14_Tenis_10.00_18.00", c]*2<= 2;
s.t. transm_67{c in Canales}: T_["14_Atletismo_14.00_17.50", c]*1 + T_["14_Gimnasia_17.00_19.55", c]*1 + T_["14_Hockey_13.00_18.00", c]*2 + T_["14_LuchaLibre_17.00_19.30", c]*2 + T_["14_Rugby7_15.05_17.35", c]*2 + T_["14_Tenis_10.00_18.00", c]*2 + T_["14_TenisDeMesa_17.00_20.00", c]*2<= 2;
s.t. transm_68{c in Canales}: T_["14_Boxeo_18.00_20.45", c]*2 + T_["14_Gimnasia_17.00_19.55", c]*1 + T_["14_LuchaLibre_17.00_19.30", c]*2 + T_["14_TenisDeMesa_17.00_20.00", c]*2<= 2;
s.t. transm_69{c in Canales}: T_["15_Arqueria_9.00_12.45", c]*1 + T_["15_Atletismo_10.00_10.45", c]*1 + T_["15_VoleyPlaya_9.00_16.50", c]*2 + T_["15_Golf_8.30_16.45", c]*1 + T_["15_Rugby7_9.00_11.30", c]*2 + T_["15_TenisDeMesa_10.00_13.00", c]*2<= 2;
s.t. transm_70{c in Canales}: T_["15_Arqueria_9.00_12.45", c]*1 + T_["15_VoleyPlaya_9.00_16.50", c]*2 + T_["15_Ciclismo_11.00_13.45", c]*1 + T_["15_Golf_8.30_16.45", c]*1 + T_["15_Rugby7_9.00_11.30", c]*2 + T_["15_TenisDeMesa_10.00_13.00", c]*2<= 2;
s.t. transm_71{c in Canales}: T_["15_Arqueria_9.00_12.45", c]*1 + T_["15_VoleyPlaya_9.00_16.50", c]*2 + T_["15_Ciclismo_11.00_13.45", c]*1 + T_["15_Golf_8.30_16.45", c]*1 + T_["15_Pentatlon_12.00_15.00", c]*1 + T_["15_TenisDeMesa_10.00_13.00", c]*2<= 2;
s.t. transm_72{c in Canales}: T_["15_Atletismo_13.35_18.00", c]*1 + T_["15_Basquet_13.30_17.15", c]*2 + T_["15_VoleyPlaya_9.00_16.50", c]*2 + T_["15_Boxeo_13.00_16.15", c]*2 + T_["15_Ciclismo_11.00_13.45", c]*1 + T_["15_Golf_8.30_16.45", c]*1 + T_["15_Pentatlon_12.00_15.00", c]*1 + T_["15_Rugby7_13.30_17.00", c]*2<= 2;
s.t. transm_73{c in Canales}: T_["15_Arqueria_14.00_17.45", c]*1 + T_["15_Atletismo_13.35_18.00", c]*1 + T_["15_Basquet_13.30_17.15", c]*2 + T_["15_VoleyPlaya_9.00_16.50", c]*2 + T_["15_Boxeo_13.00_16.15", c]*2 + T_["15_Futsal_14.00_22.00", c]*2 + T_["15_Golf_8.30_16.45", c]*1 + T_["15_Pentatlon_12.00_15.00", c]*1 + T_["15_Rugby7_13.30_17.00", c]*2<= 2;
s.t. transm_74{c in Canales}: T_["15_Arqueria_14.00_17.45", c]*1 + T_["15_Atletismo_13.35_18.00", c]*1 + T_["15_Basquet_13.30_17.15", c]*2 + T_["15_Futsal_14.00_22.00", c]*2 + T_["15_Gimnasia_17.00_20.50", c]*1 + T_["15_TenisDeMesa_17.00_20.15", c]*2<= 2;
s.t. transm_75{c in Canales}: T_["15_Boxeo_18.00_20.45", c]*2 + T_["15_Futsal_14.00_22.00", c]*2 + T_["15_Gimnasia_17.00_20.50", c]*1 + T_["15_TenisDeMesa_17.00_20.15", c]*2<= 2;
s.t. transm_76{c in Canales}: T_["16_Arqueria_10.00_11.55", c]*1 + T_["16_VoleyPlaya_10.00_11.50", c]*2 + T_["16_Ciclismo_11.00_13.00", c]*1<= 2;
s.t. transm_77{c in Canales}: T_["16_Basquet_12.00_14.00", c]*2 + T_["16_Ciclismo_11.00_13.00", c]*1 + T_["16_Pentatlon_12.00_12.30", c]*1<= 2;
s.t. transm_78{c in Canales}: T_["16_Atletismo_13.45_18.10", c]*1 + T_["16_Basquet_12.00_14.00", c]*2 + T_["16_Boxeo_13.00_16.30", c]*2<= 2;
s.t. transm_79{c in Canales}: T_["16_Arqueria_14.00_16.15", c]*1 + T_["16_Atletismo_13.45_18.10", c]*1 + T_["16_Basquet_15.00_17.00", c]*2 + T_["16_VoleyPlaya_15.00_16.50", c]*2 + T_["16_Boxeo_13.00_16.30", c]*2 + T_["16_Pentatlon_14.30_16.55", c]*1<= 2;
s.t. transm_80{c in Canales}: T_["16_Atletismo_13.45_18.10", c]*1 + T_["16_Boxeo_18.00_21.00", c]*2 + T_["16_Gimnasia_17.00_19.15", c]*1<= 2;
s.t. transm_81{c in Canales}: T_["17_Arqueria_10.00_11.55", c]*1 + T_["17_Basquet_11.00_15.30", c]*2 + T_["17_VoleyPlaya_10.00_12.35", c]*2 + T_["17_Ciclismo_11.00_14.40", c]*1 + T_["17_Karate_10.00_13.10", c]*2<= 2;
s.t. transm_82{c in Canales}: T_["17_Basquet_11.00_15.30", c]*2 + T_["17_Boxeo_13.00_16.25", c]*2 + T_["17_Ciclismo_11.00_14.40", c]*1 + T_["17_Karate_10.00_13.10", c]*2<= 2;
s.t. transm_83{c in Canales}: T_["17_Arqueria_14.00_16.15", c]*1 + T_["17_Basquet_11.00_15.30", c]*2 + T_["17_VoleyPlaya_14.00_16.35", c]*2 + T_["17_Boxeo_13.00_16.25", c]*2 + T_["17_Ciclismo_11.00_14.40", c]*1 + T_["17_Futsal_14.00_20.30", c]*2<= 2;
s.t. transm_84{c in Canales}: T_["17_Arqueria_14.00_16.15", c]*1 + T_["17_Basquet_11.00_15.30", c]*2 + T_["17_VoleyPlaya_14.00_16.35", c]*2 + T_["17_Boxeo_13.00_16.25", c]*2 + T_["17_Futsal_14.00_20.30", c]*2 + T_["17_Karate_15.00_16.25", c]*2<= 2;
s.t. transm_85{c in Canales}: T_["17_Boxeo_18.00_21.25", c]*2 + T_["17_Futsal_14.00_20.30", c]*2<= 2;
s.t. transm_86{c in Canales}: T_["18_Futsal_9.00_15.30", c]*2 + T_["18_Karate_9.00_12.10", c]*2<= 2;
s.t. transm_87{c in Canales}: T_["18_Boxeo_13.00_17.05", c]*2 + T_["18_Futsal_9.00_15.30", c]*2 + T_["18_Karate_14.00_15.25", c]*2<= 2;
s.t. final_0_Arqueria_14: Y_["12_Arqueria_10.00_13.00"] + Y_["13_Arqueria_9.00_13.00"] + Y_["14_Arqueria_9.00_11.25"] >= Y_["14_Arqueria_14.00_16.45"];
s.t. final_1_Arqueria_16: Y_["12_Arqueria_10.00_13.00"] + Y_["13_Arqueria_9.00_13.00"] + Y_["14_Arqueria_9.00_11.25"] + Y_["15_Arqueria_9.00_12.45"] + Y_["15_Arqueria_14.00_17.45"] + Y_["16_Arqueria_10.00_11.55"] >= Y_["16_Arqueria_14.00_16.15"];
s.t. final_2_Arqueria_17: Y_["12_Arqueria_10.00_13.00"] + Y_["13_Arqueria_9.00_13.00"] + Y_["14_Arqueria_9.00_11.25"] + Y_["15_Arqueria_9.00_12.45"] + Y_["15_Arqueria_14.00_17.45"] + Y_["16_Arqueria_10.00_11.55"] + Y_["17_Arqueria_10.00_11.55"] >= Y_["17_Arqueria_14.00_16.15"];
s.t. final_3_Atletismo_14: Y_["11_Atletismo_14.30_17.25"] + Y_["12_Atletismo_14.30_17.30"] + Y_["13_Atletismo_14.30_17.50"] >= Y_["14_Atletismo_14.00_17.50"];
s.t. final_4_Atletismo_15: Y_["11_Atletismo_14.30_17.25"] + Y_["12_Atletismo_14.30_17.30"] + Y_["13_Atletismo_14.30_17.50"] + Y_["15_Atletismo_10.00_10.45"] >= Y_["15_Atletismo_13.35_18.00"];
s.t. final_5_Atletismo_16: Y_["11_Atletismo_14.30_17.25"] + Y_["12_Atletismo_14.30_17.30"] + Y_["13_Atletismo_14.30_17.50"] + Y_["15_Atletismo_10.00_10.45"] >= Y_["16_Atletismo_13.45_18.10"];
s.t. final_6_Badminton_12: Y_["7_Badminton_9.00_12.30"] + Y_["7_Badminton_13.30_17.00"] + Y_["7_Badminton_18.00_21.00"] + Y_["8_Badminton_9.00_12.30"] + Y_["8_Badminton_13.30_17.00"] + Y_["8_Badminton_18.00_21.00"] + Y_["9_Badminton_9.00_12.30"] + Y_["9_Badminton_13.30_17.00"] + Y_["9_Badminton_18.00_21.00"] + Y_["10_Badminton_14.00_16.15"] + Y_["10_Badminton_18.00_21.00"] + Y_["11_Badminton_12.00_15.20"] + Y_["11_Badminton_18.00_21.00"] + Y_["12_Badminton_11.00_12.40"] + Y_["12_Badminton_13.30_15.00"] >= Y_["12_Badminton_15.30_19.15"];
s.t. final_7_BaileDeportivo_8: Y_["7_BaileDeportivo_15.15_18.00"] >= Y_["8_BaileDeportivo_15.15_18.00"];
s.t. final_8_BaileDeportivo_11: Y_["7_BaileDeportivo_15.15_18.00"] + Y_["10_BaileDeportivo_16.30_18.00"] >= Y_["11_BaileDeportivo_16.15_17.55"];
s.t. final_9_Basquet_15: Y_["7_Basquet_9.00_14.00"] + Y_["8_Basquet_9.00_14.00"] + Y_["9_Basquet_9.00_14.00"] + Y_["10_Basquet_9.00_14.00"] + Y_["11_Basquet_10.00_15.00"] + Y_["12_Basquet_10.00_15.00"] + Y_["13_Basquet_10.00_15.00"] + Y_["14_Basquet_10.00_15.00"] >= Y_["15_Basquet_13.30_17.15"];
s.t. final_10_Basquet_17: Y_["7_Basquet_9.00_14.00"] + Y_["8_Basquet_9.00_14.00"] + Y_["9_Basquet_9.00_14.00"] + Y_["10_Basquet_9.00_14.00"] + Y_["11_Basquet_10.00_15.00"] + Y_["12_Basquet_10.00_15.00"] + Y_["13_Basquet_10.00_15.00"] + Y_["14_Basquet_10.00_15.00"] + Y_["16_Basquet_12.00_14.00"] + Y_["16_Basquet_15.00_17.00"] >= Y_["17_Basquet_11.00_15.30"];
s.t. final_11_VoleyPlaya_17: Y_["7_VoleyPlaya_9.00_16.50"] + Y_["8_VoleyPlaya_9.00_16.50"] + Y_["9_VoleyPlaya_9.00_16.50"] + Y_["10_VoleyPlaya_9.00_16.50"] + Y_["11_VoleyPlaya_9.00_16.50"] + Y_["12_VoleyPlaya_9.00_16.50"] + Y_["13_VoleyPlaya_9.00_16.50"] + Y_["14_VoleyPlaya_9.00_16.50"] + Y_["15_VoleyPlaya_9.00_16.50"] + Y_["16_VoleyPlaya_10.00_11.50"] + Y_["16_VoleyPlaya_15.00_16.50"] >= Y_["17_VoleyPlaya_10.00_12.35"];
s.t. final_12_VoleyPlaya_17: Y_["7_VoleyPlaya_9.00_16.50"] + Y_["8_VoleyPlaya_9.00_16.50"] + Y_["9_VoleyPlaya_9.00_16.50"] + Y_["10_VoleyPlaya_9.00_16.50"] + Y_["11_VoleyPlaya_9.00_16.50"] + Y_["12_VoleyPlaya_9.00_16.50"] + Y_["13_VoleyPlaya_9.00_16.50"] + Y_["14_VoleyPlaya_9.00_16.50"] + Y_["15_VoleyPlaya_9.00_16.50"] + Y_["16_VoleyPlaya_10.00_11.50"] + Y_["16_VoleyPlaya_15.00_16.50"] >= Y_["17_VoleyPlaya_14.00_16.35"];
s.t. final_13_Boxeo_17: Y_["14_Boxeo_13.00_16.15"] + Y_["14_Boxeo_18.00_20.45"] + Y_["15_Boxeo_13.00_16.15"] + Y_["15_Boxeo_18.00_20.45"] + Y_["16_Boxeo_13.00_16.30"] + Y_["16_Boxeo_18.00_21.00"] >= Y_["17_Boxeo_13.00_16.25"];
s.t. final_14_Boxeo_17: Y_["14_Boxeo_13.00_16.15"] + Y_["14_Boxeo_18.00_20.45"] + Y_["15_Boxeo_13.00_16.15"] + Y_["15_Boxeo_18.00_20.45"] + Y_["16_Boxeo_13.00_16.30"] + Y_["16_Boxeo_18.00_21.00"] >= Y_["17_Boxeo_18.00_21.25"];
s.t. final_15_Boxeo_18: Y_["14_Boxeo_13.00_16.15"] + Y_["14_Boxeo_18.00_20.45"] + Y_["15_Boxeo_13.00_16.15"] + Y_["15_Boxeo_18.00_20.45"] + Y_["16_Boxeo_13.00_16.30"] + Y_["16_Boxeo_18.00_21.00"] >= Y_["18_Boxeo_13.00_17.05"];
s.t. final_16_Ciclismo_17: Y_["13_Ciclismo_11.00_13.00"] + Y_["14_Ciclismo_11.00_15.30"] + Y_["15_Ciclismo_11.00_13.45"] + Y_["16_Ciclismo_11.00_13.00"] >= Y_["17_Ciclismo_11.00_14.40"];
s.t. final_17_Equitacion_9: Y_["8_Equitacion_14.00_15.30"] >= Y_["9_Equitacion_14.00_16.00"];
s.t. final_18_Equitacion_13: Y_["8_Equitacion_14.00_15.30"] + Y_["12_Equitacion_14.00_15.30"] >= Y_["13_Equitacion_14.00_16.00"];
s.t. final_19_Escalada_9: Y_["7_Escalada_9.00_9.25"] + Y_["7_Escalada_12.00_14.10"] + Y_["7_Escalada_15.00_16.20"] + Y_["8_Escalada_9.00_9.25"] + Y_["8_Escalada_12.00_14.10"] + Y_["8_Escalada_15.00_16.20"] + Y_["9_Escalada_10.00_10.20"] + Y_["9_Escalada_12.00_13.15"] >= Y_["9_Escalada_16.00_16.40"];
s.t. final_20_Escalada_10: Y_["7_Escalada_9.00_9.25"] + Y_["7_Escalada_12.00_14.10"] + Y_["7_Escalada_15.00_16.20"] + Y_["8_Escalada_9.00_9.25"] + Y_["8_Escalada_12.00_14.10"] + Y_["8_Escalada_15.00_16.20"] + Y_["9_Escalada_10.00_10.20"] + Y_["9_Escalada_12.00_13.15"] + Y_["10_Escalada_10.00_10.20"] + Y_["10_Escalada_12.00_13.15"] >= Y_["10_Escalada_16.00_16.40"];
s.t. final_21_Esgrima_7: Y_["7_Esgrima_9.00_13.35"] >= Y_["7_Esgrima_16.30_19.40"];
s.t. final_22_Esgrima_8: Y_["7_Esgrima_9.00_13.35"] + Y_["8_Esgrima_9.00_13.45"] >= Y_["8_Esgrima_17.00_20.10"];
s.t. final_23_Esgrima_9: Y_["7_Esgrima_9.00_13.35"] + Y_["8_Esgrima_9.00_13.45"] + Y_["9_Esgrima_9.00_13.25"] >= Y_["9_Esgrima_16.30_19.35"];
s.t. final_24_Esgrima_10: Y_["7_Esgrima_9.00_13.35"] + Y_["8_Esgrima_9.00_13.45"] + Y_["9_Esgrima_9.00_13.25"] >= Y_["10_Esgrima_9.30_15.05"];
s.t. final_25_Futsal_17: Y_["7_Futsal_14.00_22.00"] + Y_["8_Futsal_14.00_22.00"] + Y_["9_Futsal_14.00_22.00"] + Y_["10_Futsal_14.00_22.00"] + Y_["11_Futsal_14.00_22.00"] + Y_["12_Futsal_14.00_22.00"] + Y_["13_Futsal_14.00_22.00"] + Y_["15_Futsal_14.00_22.00"] >= Y_["17_Futsal_14.00_20.30"];
s.t. final_26_Gimnasia_10: Y_["7_Gimnasia_14.00_16.55"] + Y_["7_Gimnasia_19.00_21.50"] + Y_["8_Gimnasia_14.00_16.45"] + Y_["8_Gimnasia_19.00_21.25"] + Y_["9_Gimnasia_14.00_16.50"] + Y_["9_Gimnasia_19.00_21.50"] + Y_["10_Gimnasia_14.00_16.50"] >= Y_["10_Gimnasia_19.00_22.10"];
s.t. final_27_Gimnasia_11: Y_["7_Gimnasia_14.00_16.55"] + Y_["7_Gimnasia_19.00_21.50"] + Y_["8_Gimnasia_14.00_16.45"] + Y_["8_Gimnasia_19.00_21.25"] + Y_["9_Gimnasia_14.00_16.50"] + Y_["9_Gimnasia_19.00_21.50"] + Y_["10_Gimnasia_14.00_16.50"] >= Y_["11_Gimnasia_17.00_21.05"];
s.t. final_28_Gimnasia_12: Y_["7_Gimnasia_14.00_16.55"] + Y_["7_Gimnasia_19.00_21.50"] + Y_["8_Gimnasia_14.00_16.45"] + Y_["8_Gimnasia_19.00_21.25"] + Y_["9_Gimnasia_14.00_16.50"] + Y_["9_Gimnasia_19.00_21.50"] + Y_["10_Gimnasia_14.00_16.50"] >= Y_["12_Gimnasia_17.00_19.25"];
s.t. final_29_Gimnasia_13: Y_["7_Gimnasia_14.00_16.55"] + Y_["7_Gimnasia_19.00_21.50"] + Y_["8_Gimnasia_14.00_16.45"] + Y_["8_Gimnasia_19.00_21.25"] + Y_["9_Gimnasia_14.00_16.50"] + Y_["9_Gimnasia_19.00_21.50"] + Y_["10_Gimnasia_14.00_16.50"] >= Y_["13_Gimnasia_17.00_20.00"];
s.t. final_30_Gimnasia_14: Y_["7_Gimnasia_14.00_16.55"] + Y_["7_Gimnasia_19.00_21.50"] + Y_["8_Gimnasia_14.00_16.45"] + Y_["8_Gimnasia_19.00_21.25"] + Y_["9_Gimnasia_14.00_16.50"] + Y_["9_Gimnasia_19.00_21.50"] + Y_["10_Gimnasia_14.00_16.50"] >= Y_["14_Gimnasia_17.00_19.55"];
s.t. final_31_Gimnasia_15: Y_["7_Gimnasia_14.00_16.55"] + Y_["7_Gimnasia_19.00_21.50"] + Y_["8_Gimnasia_14.00_16.45"] + Y_["8_Gimnasia_19.00_21.25"] + Y_["9_Gimnasia_14.00_16.50"] + Y_["9_Gimnasia_19.00_21.50"] + Y_["10_Gimnasia_14.00_16.50"] >= Y_["15_Gimnasia_17.00_20.50"];
s.t. final_32_Gimnasia_16: Y_["7_Gimnasia_14.00_16.55"] + Y_["7_Gimnasia_19.00_21.50"] + Y_["8_Gimnasia_14.00_16.45"] + Y_["8_Gimnasia_19.00_21.25"] + Y_["9_Gimnasia_14.00_16.50"] + Y_["9_Gimnasia_19.00_21.50"] + Y_["10_Gimnasia_14.00_16.50"] >= Y_["16_Gimnasia_17.00_19.15"];
s.t. final_33_Golf_11: Y_["9_Golf_8.30_17.00"] + Y_["10_Golf_8.30_17.00"] >= Y_["11_Golf_8.30_17.20"];
s.t. final_34_Golf_15: Y_["9_Golf_8.30_17.00"] + Y_["10_Golf_8.30_17.00"] + Y_["13_Golf_8.30_14.40"] + Y_["14_Golf_8.30_16.30"] >= Y_["15_Golf_8.30_16.45"];
s.t. final_35_Hockey_14: Y_["7_Hockey_9.30_18.30"] + Y_["8_Hockey_9.30_18.30"] + Y_["9_Hockey_9.30_18.30"] + Y_["10_Hockey_9.30_18.30"] + Y_["11_Hockey_9.30_18.30"] + Y_["12_Hockey_8.00_18.00"] + Y_["13_Hockey_8.00_18.00"] + Y_["14_Hockey_8.30_12.30"] >= Y_["14_Hockey_13.00_18.00"];
s.t. final_36_Judo_7: Y_["7_Judo_10.00_12.25"] >= Y_["7_Judo_15.00_16.00"];
s.t. final_37_Judo_8: Y_["7_Judo_10.00_12.25"] + Y_["8_Judo_10.00_12.25"] >= Y_["8_Judo_15.00_16.00"];
s.t. final_38_Judo_9: Y_["7_Judo_10.00_12.25"] + Y_["8_Judo_10.00_12.25"] + Y_["9_Judo_10.00_11.40"] >= Y_["9_Judo_15.00_15.40"];
s.t. final_39_Judo_10: Y_["7_Judo_10.00_12.25"] + Y_["8_Judo_10.00_12.25"] + Y_["9_Judo_10.00_11.40"] + Y_["10_Judo_10.00_13.15"] >= Y_["10_Judo_15.00_16.30"];
s.t. final_40_Karate_17: Y_["17_Karate_10.00_13.10"] >= Y_["17_Karate_15.00_16.25"];
s.t. final_41_Karate_18: Y_["17_Karate_10.00_13.10"] + Y_["18_Karate_9.00_12.10"] >= Y_["18_Karate_14.00_15.25"];
s.t. final_42_LuchaLibre_12: Y_["12_LuchaLibre_10.00_11.15"] >= Y_["12_LuchaLibre_17.00_19.30"];
s.t. final_43_LuchaLibre_13: Y_["12_LuchaLibre_10.00_11.15"] + Y_["13_LuchaLibre_10.00_14.10"] >= Y_["13_LuchaLibre_17.00_19.55"];
s.t. final_44_LuchaLibre_14: Y_["12_LuchaLibre_10.00_11.15"] + Y_["13_LuchaLibre_10.00_14.10"] + Y_["14_LuchaLibre_10.00_11.15"] >= Y_["14_LuchaLibre_17.00_19.30"];
s.t. final_45_Natacion_7: Y_["7_Natacion_10.00_11.30"] >= Y_["7_Natacion_18.00_19.15"];
s.t. final_46_Natacion_8: Y_["7_Natacion_10.00_11.30"] + Y_["8_Natacion_10.00_11.30"] >= Y_["8_Natacion_18.00_19.55"];
s.t. final_47_Natacion_9: Y_["7_Natacion_10.00_11.30"] + Y_["8_Natacion_10.00_11.30"] + Y_["9_Natacion_10.00_11.30"] >= Y_["9_Natacion_18.00_19.40"];
s.t. final_48_Natacion_10: Y_["7_Natacion_10.00_11.30"] + Y_["8_Natacion_10.00_11.30"] + Y_["9_Natacion_10.00_11.30"] + Y_["10_Natacion_10.00_11.30"] >= Y_["10_Natacion_18.00_19.40"];
s.t. final_49_Natacion_11: Y_["7_Natacion_10.00_11.30"] + Y_["8_Natacion_10.00_11.30"] + Y_["9_Natacion_10.00_11.30"] + Y_["10_Natacion_10.00_11.30"] + Y_["11_Natacion_10.00_11.30"] >= Y_["11_Natacion_18.00_19.30"];
s.t. final_50_Natacion_12: Y_["7_Natacion_10.00_11.30"] + Y_["8_Natacion_10.00_11.30"] + Y_["9_Natacion_10.00_11.30"] + Y_["10_Natacion_10.00_11.30"] + Y_["11_Natacion_10.00_11.30"] + Y_["12_Natacion_10.00_11.30"] >= Y_["12_Natacion_18.00_19.50"];
s.t. final_51_Pentatlon_13: Y_["12_Pentatlon_10.00_11.45"] + Y_["12_Pentatlon_14.00_15.45"] + Y_["13_Pentatlon_12.00_12.30"] >= Y_["13_Pentatlon_14.30_16.55"];
s.t. final_52_Pentatlon_14: Y_["12_Pentatlon_10.00_11.45"] + Y_["12_Pentatlon_14.00_15.45"] + Y_["13_Pentatlon_12.00_12.30"] + Y_["14_Pentatlon_12.00_12.30"] >= Y_["14_Pentatlon_14.30_16.55"];
s.t. final_53_Pentatlon_16: Y_["12_Pentatlon_10.00_11.45"] + Y_["12_Pentatlon_14.00_15.45"] + Y_["13_Pentatlon_12.00_12.30"] + Y_["14_Pentatlon_12.00_12.30"] + Y_["15_Pentatlon_12.00_15.00"] + Y_["16_Pentatlon_12.00_12.30"] >= Y_["16_Pentatlon_14.30_16.55"];
s.t. final_54_Remo_9: Y_["7_Remo_15.30_17.05"] + Y_["8_Remo_13.00_14.30"] + Y_["8_Remo_15.30_17.00"] >= Y_["9_Remo_15.00_17.25"];
s.t. final_55_Remo_10: Y_["7_Remo_15.30_17.05"] + Y_["8_Remo_13.00_14.30"] + Y_["8_Remo_15.30_17.00"] >= Y_["10_Remo_14.45_17.25"];
s.t. final_56_Rugby7_15: Y_["13_Rugby7_12.00_14.30"] + Y_["13_Rugby7_15.05_17.35"] + Y_["14_Rugby7_12.00_14.30"] + Y_["14_Rugby7_15.05_17.35"] + Y_["15_Rugby7_9.00_11.30"] >= Y_["15_Rugby7_13.30_17.00"];
s.t. final_57_Taekwondo_7: Y_["7_Taekwondo_14.00_17.00"] >= Y_["7_Taekwondo_19.00_21.00"];
s.t. final_58_Taekwondo_8: Y_["7_Taekwondo_14.00_17.00"] + Y_["8_Taekwondo_14.00_17.00"] >= Y_["8_Taekwondo_19.00_21.00"];
s.t. final_59_Taekwondo_9: Y_["7_Taekwondo_14.00_17.00"] + Y_["8_Taekwondo_14.00_17.00"] + Y_["9_Taekwondo_14.00_17.00"] >= Y_["9_Taekwondo_19.00_21.00"];
s.t. final_60_Taekwondo_10: Y_["7_Taekwondo_14.00_17.00"] + Y_["8_Taekwondo_14.00_17.00"] + Y_["9_Taekwondo_14.00_17.00"] + Y_["10_Taekwondo_14.00_17.00"] >= Y_["10_Taekwondo_19.00_21.00"];
s.t. final_61_Taekwondo_11: Y_["7_Taekwondo_14.00_17.00"] + Y_["8_Taekwondo_14.00_17.00"] + Y_["9_Taekwondo_14.00_17.00"] + Y_["10_Taekwondo_14.00_17.00"] + Y_["11_Taekwondo_14.00_17.00"] >= Y_["11_Taekwondo_19.00_21.00"];
s.t. final_62_Tenis_13: Y_["7_Tenis_10.00_18.00"] + Y_["8_Tenis_10.00_18.00"] + Y_["9_Tenis_10.00_18.00"] + Y_["10_Tenis_10.00_18.00"] + Y_["11_Tenis_10.00_18.00"] + Y_["12_Tenis_10.00_18.00"] >= Y_["13_Tenis_10.00_18.00"];
s.t. final_63_Tenis_14: Y_["7_Tenis_10.00_18.00"] + Y_["8_Tenis_10.00_18.00"] + Y_["9_Tenis_10.00_18.00"] + Y_["10_Tenis_10.00_18.00"] + Y_["11_Tenis_10.00_18.00"] + Y_["12_Tenis_10.00_18.00"] >= Y_["14_Tenis_10.00_18.00"];
s.t. final_64_TenisDeMesa_10: Y_["7_TenisDeMesa_10.00_14.30"] + Y_["7_TenisDeMesa_16.00_20.30"] + Y_["8_TenisDeMesa_10.00_14.30"] + Y_["8_TenisDeMesa_16.00_20.30"] + Y_["9_TenisDeMesa_10.00_13.00"] + Y_["9_TenisDeMesa_15.00_21.00"] + Y_["10_TenisDeMesa_10.00_13.00"] >= Y_["10_TenisDeMesa_16.00_19.30"];
s.t. final_65_TenisDeMesa_15: Y_["7_TenisDeMesa_10.00_14.30"] + Y_["7_TenisDeMesa_16.00_20.30"] + Y_["8_TenisDeMesa_10.00_14.30"] + Y_["8_TenisDeMesa_16.00_20.30"] + Y_["9_TenisDeMesa_10.00_13.00"] + Y_["9_TenisDeMesa_15.00_21.00"] + Y_["10_TenisDeMesa_10.00_13.00"] + Y_["12_TenisDeMesa_10.00_14.30"] + Y_["12_TenisDeMesa_16.00_20.30"] + Y_["13_TenisDeMesa_10.00_14.30"] + Y_["13_TenisDeMesa_16.00_20.30"] + Y_["14_TenisDeMesa_10.00_13.00"] + Y_["14_TenisDeMesa_17.00_20.00"] + Y_["15_TenisDeMesa_10.00_13.00"] >= Y_["15_TenisDeMesa_17.00_20.15"];
s.t. final_66_TiroYVariantes_11: Y_["7_TiroYVariantes_9.00_12.15"] + Y_["8_TiroYVariantes_9.00_12.15"] + Y_["9_TiroYVariantes_9.00_12.15"] + Y_["10_TiroYVariantes_9.00_12.15"] + Y_["10_TiroYVariantes_13.15_15.30"] >= Y_["11_TiroYVariantes_9.00_12.30"];
s.t. final_67_TiroYVariantes_12: Y_["7_TiroYVariantes_9.00_12.15"] + Y_["8_TiroYVariantes_9.00_12.15"] + Y_["9_TiroYVariantes_9.00_12.15"] + Y_["10_TiroYVariantes_9.00_12.15"] + Y_["10_TiroYVariantes_13.15_15.30"] + Y_["11_TiroYVariantes_13.45_16.00"] >= Y_["12_TiroYVariantes_9.00_12.30"];
s.t. final_68_NavegacionAVela_12: Y_["7_NavegacionAVela_12.00_18.00"] + Y_["8_NavegacionAVela_12.00_18.00"] + Y_["9_NavegacionAVela_12.00_18.00"] + Y_["10_NavegacionAVela_12.00_18.00"] + Y_["11_NavegacionAVela_12.00_18.00"] >= Y_["12_NavegacionAVela_12.00_18.00"];
s.t. final_69_NavegacionAVela_13: Y_["7_NavegacionAVela_12.00_18.00"] + Y_["8_NavegacionAVela_12.00_18.00"] + Y_["9_NavegacionAVela_12.00_18.00"] + Y_["10_NavegacionAVela_12.00_18.00"] + Y_["11_NavegacionAVela_12.00_18.00"] >= Y_["13_NavegacionAVela_12.00_18.00"];
s.t. final_70_HandballPlaya_13: Y_["8_HandballPlaya_10.00_13.20"] + Y_["8_HandballPlaya_14.30_17.50"] + Y_["9_HandballPlaya_10.00_13.20"] + Y_["9_HandballPlaya_14.30_17.50"] + Y_["10_HandballPlaya_10.00_13.20"] + Y_["11_HandballPlaya_10.00_13.20"] + Y_["11_HandballPlaya_14.30_17.50"] + Y_["12_HandballPlaya_10.00_13.20"] + Y_["12_HandballPlaya_14.30_17.50"] + Y_["13_HandballPlaya_9.30_12.50"] >= Y_["13_HandballPlaya_14.10_18.00"];
data;
set EventosDeporteArqueria := "12_Arqueria_10.00_13.00" "13_Arqueria_9.00_13.00" "14_Arqueria_9.00_11.25" "14_Arqueria_14.00_16.45" "15_Arqueria_9.00_12.45" "15_Arqueria_14.00_17.45" "16_Arqueria_10.00_11.55" "16_Arqueria_14.00_16.15" "17_Arqueria_10.00_11.55" "17_Arqueria_14.00_16.15";
set FinalDeporteArqueria := "12_Arqueria_10.00_13.00" "13_Arqueria_9.00_13.00" "14_Arqueria_9.00_11.25" "14_Arqueria_14.00_16.45" "15_Arqueria_9.00_12.45" "15_Arqueria_14.00_17.45" "16_Arqueria_10.00_11.55" "16_Arqueria_14.00_16.15" "17_Arqueria_10.00_11.55" "17_Arqueria_14.00_16.15";
set EventosDeporteAtletismo := "11_Atletismo_14.30_17.25" "12_Atletismo_14.30_17.30" "13_Atletismo_14.30_17.50" "14_Atletismo_14.00_17.50" "15_Atletismo_10.00_10.45" "15_Atletismo_13.35_18.00" "16_Atletismo_13.45_18.10";
set FinalDeporteAtletismo := "11_Atletismo_14.30_17.25" "12_Atletismo_14.30_17.30" "13_Atletismo_14.30_17.50" "14_Atletismo_14.00_17.50" "15_Atletismo_10.00_10.45" "15_Atletismo_13.35_18.00" "16_Atletismo_13.45_18.10";
set EventosDeporteBadminton := "7_Badminton_9.00_12.30" "7_Badminton_13.30_17.00" "7_Badminton_18.00_21.00" "8_Badminton_9.00_12.30" "8_Badminton_13.30_17.00" "8_Badminton_18.00_21.00" "9_Badminton_9.00_12.30" "9_Badminton_13.30_17.00" "9_Badminton_18.00_21.00" "10_Badminton_14.00_16.15" "10_Badminton_18.00_21.00" "11_Badminton_12.00_15.20" "11_Badminton_18.00_21.00" "12_Badminton_11.00_12.40" "12_Badminton_13.30_15.00" "12_Badminton_15.30_19.15";
set FinalDeporteBadminton := "7_Badminton_9.00_12.30" "7_Badminton_13.30_17.00" "7_Badminton_18.00_21.00" "8_Badminton_9.00_12.30" "8_Badminton_13.30_17.00" "8_Badminton_18.00_21.00" "9_Badminton_9.00_12.30" "9_Badminton_13.30_17.00" "9_Badminton_18.00_21.00" "10_Badminton_14.00_16.15" "10_Badminton_18.00_21.00" "11_Badminton_12.00_15.20" "11_Badminton_18.00_21.00" "12_Badminton_11.00_12.40" "12_Badminton_13.30_15.00" "12_Badminton_15.30_19.15";
set EventosDeporteBaileDeportivo := "7_BaileDeportivo_15.15_18.00" "8_BaileDeportivo_15.15_18.00" "10_BaileDeportivo_16.30_18.00" "11_BaileDeportivo_16.15_17.55";
set FinalDeporteBaileDeportivo := "7_BaileDeportivo_15.15_18.00" "8_BaileDeportivo_15.15_18.00" "10_BaileDeportivo_16.30_18.00" "11_BaileDeportivo_16.15_17.55";
set EventosDeporteBasquet := "7_Basquet_9.00_14.00" "8_Basquet_9.00_14.00" "9_Basquet_9.00_14.00" "10_Basquet_9.00_14.00" "11_Basquet_10.00_15.00" "12_Basquet_10.00_15.00" "13_Basquet_10.00_15.00" "14_Basquet_10.00_15.00" "15_Basquet_13.30_17.15" "16_Basquet_12.00_14.00" "16_Basquet_15.00_17.00" "17_Basquet_11.00_15.30";
set FinalDeporteBasquet := "7_Basquet_9.00_14.00" "8_Basquet_9.00_14.00" "9_Basquet_9.00_14.00" "10_Basquet_9.00_14.00" "11_Basquet_10.00_15.00" "12_Basquet_10.00_15.00" "13_Basquet_10.00_15.00" "14_Basquet_10.00_15.00" "15_Basquet_13.30_17.15" "16_Basquet_12.00_14.00" "16_Basquet_15.00_17.00" "17_Basquet_11.00_15.30";
set EventosDeporteVoleyPlaya := "7_VoleyPlaya_9.00_16.50" "8_VoleyPlaya_9.00_16.50" "9_VoleyPlaya_9.00_16.50" "10_VoleyPlaya_9.00_16.50" "11_VoleyPlaya_9.00_16.50" "12_VoleyPlaya_9.00_16.50" "13_VoleyPlaya_9.00_16.50" "14_VoleyPlaya_9.00_16.50" "15_VoleyPlaya_9.00_16.50" "16_VoleyPlaya_10.00_11.50" "16_VoleyPlaya_15.00_16.50" "17_VoleyPlaya_10.00_12.35" "17_VoleyPlaya_14.00_16.35";
set FinalDeporteVoleyPlaya := "7_VoleyPlaya_9.00_16.50" "8_VoleyPlaya_9.00_16.50" "9_VoleyPlaya_9.00_16.50" "10_VoleyPlaya_9.00_16.50" "11_VoleyPlaya_9.00_16.50" "12_VoleyPlaya_9.00_16.50" "13_VoleyPlaya_9.00_16.50" "14_VoleyPlaya_9.00_16.50" "15_VoleyPlaya_9.00_16.50" "16_VoleyPlaya_10.00_11.50" "16_VoleyPlaya_15.00_16.50" "17_VoleyPlaya_10.00_12.35" "17_VoleyPlaya_14.00_16.35";
set EventosDeporteBoxeo := "14_Boxeo_13.00_16.15" "14_Boxeo_18.00_20.45" "15_Boxeo_13.00_16.15" "15_Boxeo_18.00_20.45" "16_Boxeo_13.00_16.30" "16_Boxeo_18.00_21.00" "17_Boxeo_13.00_16.25" "17_Boxeo_18.00_21.25" "18_Boxeo_13.00_17.05";
set FinalDeporteBoxeo := "14_Boxeo_13.00_16.15" "14_Boxeo_18.00_20.45" "15_Boxeo_13.00_16.15" "15_Boxeo_18.00_20.45" "16_Boxeo_13.00_16.30" "16_Boxeo_18.00_21.00" "17_Boxeo_13.00_16.25" "17_Boxeo_18.00_21.25" "18_Boxeo_13.00_17.05";
set EventosDeporteCiclismo := "13_Ciclismo_11.00_13.00" "14_Ciclismo_11.00_15.30" "15_Ciclismo_11.00_13.45" "16_Ciclismo_11.00_13.00" "17_Ciclismo_11.00_14.40";
set FinalDeporteCiclismo := "13_Ciclismo_11.00_13.00" "14_Ciclismo_11.00_15.30" "15_Ciclismo_11.00_13.45" "16_Ciclismo_11.00_13.00" "17_Ciclismo_11.00_14.40";
set EventosDeporteEquitacion := "8_Equitacion_14.00_15.30" "9_Equitacion_14.00_16.00" "12_Equitacion_14.00_15.30" "13_Equitacion_14.00_16.00";
set FinalDeporteEquitacion := "8_Equitacion_14.00_15.30" "9_Equitacion_14.00_16.00" "12_Equitacion_14.00_15.30" "13_Equitacion_14.00_16.00";
set EventosDeporteEscalada := "7_Escalada_9.00_9.25" "7_Escalada_12.00_14.10" "7_Escalada_15.00_16.20" "8_Escalada_9.00_9.25" "8_Escalada_12.00_14.10" "8_Escalada_15.00_16.20" "9_Escalada_10.00_10.20" "9_Escalada_12.00_13.15" "9_Escalada_16.00_16.40" "10_Escalada_10.00_10.20" "10_Escalada_12.00_13.15" "10_Escalada_16.00_16.40";
set FinalDeporteEscalada := "7_Escalada_9.00_9.25" "7_Escalada_12.00_14.10" "7_Escalada_15.00_16.20" "8_Escalada_9.00_9.25" "8_Escalada_12.00_14.10" "8_Escalada_15.00_16.20" "9_Escalada_10.00_10.20" "9_Escalada_12.00_13.15" "9_Escalada_16.00_16.40" "10_Escalada_10.00_10.20" "10_Escalada_12.00_13.15" "10_Escalada_16.00_16.40";
set EventosDeporteEsgrima := "7_Esgrima_9.00_13.35" "7_Esgrima_16.30_19.40" "8_Esgrima_9.00_13.45" "8_Esgrima_17.00_20.10" "9_Esgrima_9.00_13.25" "9_Esgrima_16.30_19.35" "10_Esgrima_9.30_15.05";
set FinalDeporteEsgrima := "7_Esgrima_9.00_13.35" "7_Esgrima_16.30_19.40" "8_Esgrima_9.00_13.45" "8_Esgrima_17.00_20.10" "9_Esgrima_9.00_13.25" "9_Esgrima_16.30_19.35" "10_Esgrima_9.30_15.05";
set EventosDeporteFutsal := "7_Futsal_14.00_22.00" "8_Futsal_14.00_22.00" "9_Futsal_14.00_22.00" "10_Futsal_14.00_22.00" "11_Futsal_14.00_22.00" "12_Futsal_14.00_22.00" "13_Futsal_14.00_22.00" "15_Futsal_14.00_22.00" "17_Futsal_14.00_20.30" "18_Futsal_9.00_15.30";
set FinalDeporteFutsal := "7_Futsal_14.00_22.00" "8_Futsal_14.00_22.00" "9_Futsal_14.00_22.00" "10_Futsal_14.00_22.00" "11_Futsal_14.00_22.00" "12_Futsal_14.00_22.00" "13_Futsal_14.00_22.00" "15_Futsal_14.00_22.00" "17_Futsal_14.00_20.30" "18_Futsal_9.00_15.30";
set EventosDeporteGimnasia := "7_Gimnasia_14.00_16.55" "7_Gimnasia_19.00_21.50" "8_Gimnasia_14.00_16.45" "8_Gimnasia_19.00_21.25" "9_Gimnasia_14.00_16.50" "9_Gimnasia_19.00_21.50" "10_Gimnasia_14.00_16.50" "10_Gimnasia_19.00_22.10" "11_Gimnasia_17.00_21.05" "12_Gimnasia_17.00_19.25" "13_Gimnasia_17.00_20.00" "14_Gimnasia_17.00_19.55" "15_Gimnasia_17.00_20.50" "16_Gimnasia_17.00_19.15";
set FinalDeporteGimnasia := "7_Gimnasia_14.00_16.55" "7_Gimnasia_19.00_21.50" "8_Gimnasia_14.00_16.45" "8_Gimnasia_19.00_21.25" "9_Gimnasia_14.00_16.50" "9_Gimnasia_19.00_21.50" "10_Gimnasia_14.00_16.50" "10_Gimnasia_19.00_22.10" "11_Gimnasia_17.00_21.05" "12_Gimnasia_17.00_19.25" "13_Gimnasia_17.00_20.00" "14_Gimnasia_17.00_19.55" "15_Gimnasia_17.00_20.50" "16_Gimnasia_17.00_19.15";
set EventosDeporteGolf := "9_Golf_8.30_17.00" "10_Golf_8.30_17.00" "11_Golf_8.30_17.20" "13_Golf_8.30_14.40" "14_Golf_8.30_16.30" "15_Golf_8.30_16.45";
set FinalDeporteGolf := "9_Golf_8.30_17.00" "10_Golf_8.30_17.00" "11_Golf_8.30_17.20" "13_Golf_8.30_14.40" "14_Golf_8.30_16.30" "15_Golf_8.30_16.45";
set EventosDeporteHalterofilia := "7_Halterofilia_16.00_17.30" "7_Halterofilia_20.00_21.30" "8_Halterofilia_16.00_17.30" "8_Halterofilia_20.00_21.30" "9_Halterofilia_14.30_16.00" "9_Halterofilia_18.00_19.30" "11_Halterofilia_14.30_16.00" "11_Halterofilia_18.00_19.30" "12_Halterofilia_14.30_16.00" "12_Halterofilia_18.00_19.30" "13_Halterofilia_14.30_16.00" "13_Halterofilia_18.00_19.30";
set FinalDeporteHalterofilia := "7_Halterofilia_16.00_17.30" "7_Halterofilia_20.00_21.30" "8_Halterofilia_16.00_17.30" "8_Halterofilia_20.00_21.30" "9_Halterofilia_14.30_16.00" "9_Halterofilia_18.00_19.30" "11_Halterofilia_14.30_16.00" "11_Halterofilia_18.00_19.30" "12_Halterofilia_14.30_16.00" "12_Halterofilia_18.00_19.30" "13_Halterofilia_14.30_16.00" "13_Halterofilia_18.00_19.30";
set EventosDeporteHockey := "7_Hockey_9.30_18.30" "8_Hockey_9.30_18.30" "9_Hockey_9.30_18.30" "10_Hockey_9.30_18.30" "11_Hockey_9.30_18.30" "12_Hockey_8.00_18.00" "13_Hockey_8.00_18.00" "14_Hockey_8.30_12.30" "14_Hockey_13.00_18.00";
set FinalDeporteHockey := "7_Hockey_9.30_18.30" "8_Hockey_9.30_18.30" "9_Hockey_9.30_18.30" "10_Hockey_9.30_18.30" "11_Hockey_9.30_18.30" "12_Hockey_8.00_18.00" "13_Hockey_8.00_18.00" "14_Hockey_8.30_12.30" "14_Hockey_13.00_18.00";
set EventosDeporteJudo := "7_Judo_10.00_12.25" "7_Judo_15.00_16.00" "8_Judo_10.00_12.25" "8_Judo_15.00_16.00" "9_Judo_10.00_11.40" "9_Judo_15.00_15.40" "10_Judo_10.00_13.15" "10_Judo_15.00_16.30";
set FinalDeporteJudo := "7_Judo_10.00_12.25" "7_Judo_15.00_16.00" "8_Judo_10.00_12.25" "8_Judo_15.00_16.00" "9_Judo_10.00_11.40" "9_Judo_15.00_15.40" "10_Judo_10.00_13.15" "10_Judo_15.00_16.30";
set EventosDeporteKarate := "17_Karate_10.00_13.10" "17_Karate_15.00_16.25" "18_Karate_9.00_12.10" "18_Karate_14.00_15.25";
set FinalDeporteKarate := "17_Karate_10.00_13.10" "17_Karate_15.00_16.25" "18_Karate_9.00_12.10" "18_Karate_14.00_15.25";
set EventosDeporteLuchaLibre := "12_LuchaLibre_10.00_11.15" "12_LuchaLibre_17.00_19.30" "13_LuchaLibre_10.00_14.10" "13_LuchaLibre_17.00_19.55" "14_LuchaLibre_10.00_11.15" "14_LuchaLibre_17.00_19.30";
set FinalDeporteLuchaLibre := "12_LuchaLibre_10.00_11.15" "12_LuchaLibre_17.00_19.30" "13_LuchaLibre_10.00_14.10" "13_LuchaLibre_17.00_19.55" "14_LuchaLibre_10.00_11.15" "14_LuchaLibre_17.00_19.30";
set EventosDeporteNatacion := "7_Natacion_10.00_11.30" "7_Natacion_18.00_19.15" "8_Natacion_10.00_11.30" "8_Natacion_18.00_19.55" "9_Natacion_10.00_11.30" "9_Natacion_18.00_19.40" "10_Natacion_10.00_11.30" "10_Natacion_18.00_19.40" "11_Natacion_10.00_11.30" "11_Natacion_18.00_19.30" "12_Natacion_10.00_11.30" "12_Natacion_18.00_19.50";
set FinalDeporteNatacion := "7_Natacion_10.00_11.30" "7_Natacion_18.00_19.15" "8_Natacion_10.00_11.30" "8_Natacion_18.00_19.55" "9_Natacion_10.00_11.30" "9_Natacion_18.00_19.40" "10_Natacion_10.00_11.30" "10_Natacion_18.00_19.40" "11_Natacion_10.00_11.30" "11_Natacion_18.00_19.30" "12_Natacion_10.00_11.30" "12_Natacion_18.00_19.50";
set EventosDeportePentatlon := "12_Pentatlon_10.00_11.45" "12_Pentatlon_14.00_15.45" "13_Pentatlon_12.00_12.30" "13_Pentatlon_14.30_16.55" "14_Pentatlon_12.00_12.30" "14_Pentatlon_14.30_16.55" "15_Pentatlon_12.00_15.00" "16_Pentatlon_12.00_12.30" "16_Pentatlon_14.30_16.55";
set FinalDeportePentatlon := "12_Pentatlon_10.00_11.45" "12_Pentatlon_14.00_15.45" "13_Pentatlon_12.00_12.30" "13_Pentatlon_14.30_16.55" "14_Pentatlon_12.00_12.30" "14_Pentatlon_14.30_16.55" "15_Pentatlon_12.00_15.00" "16_Pentatlon_12.00_12.30" "16_Pentatlon_14.30_16.55";
set EventosDeporteRemo := "7_Remo_15.30_17.05" "8_Remo_13.00_14.30" "8_Remo_15.30_17.00" "9_Remo_15.00_17.25" "10_Remo_14.45_17.25";
set FinalDeporteRemo := "7_Remo_15.30_17.05" "8_Remo_13.00_14.30" "8_Remo_15.30_17.00" "9_Remo_15.00_17.25" "10_Remo_14.45_17.25";
set EventosDeporteRugby7 := "13_Rugby7_12.00_14.30" "13_Rugby7_15.05_17.35" "14_Rugby7_12.00_14.30" "14_Rugby7_15.05_17.35" "15_Rugby7_9.00_11.30" "15_Rugby7_13.30_17.00";
set FinalDeporteRugby7 := "13_Rugby7_12.00_14.30" "13_Rugby7_15.05_17.35" "14_Rugby7_12.00_14.30" "14_Rugby7_15.05_17.35" "15_Rugby7_9.00_11.30" "15_Rugby7_13.30_17.00";
set EventosDeporteTaekwondo := "7_Taekwondo_14.00_17.00" "7_Taekwondo_19.00_21.00" "8_Taekwondo_14.00_17.00" "8_Taekwondo_19.00_21.00" "9_Taekwondo_14.00_17.00" "9_Taekwondo_19.00_21.00" "10_Taekwondo_14.00_17.00" "10_Taekwondo_19.00_21.00" "11_Taekwondo_14.00_17.00" "11_Taekwondo_19.00_21.00";
set FinalDeporteTaekwondo := "7_Taekwondo_14.00_17.00" "7_Taekwondo_19.00_21.00" "8_Taekwondo_14.00_17.00" "8_Taekwondo_19.00_21.00" "9_Taekwondo_14.00_17.00" "9_Taekwondo_19.00_21.00" "10_Taekwondo_14.00_17.00" "10_Taekwondo_19.00_21.00" "11_Taekwondo_14.00_17.00" "11_Taekwondo_19.00_21.00";
set EventosDeporteTenis := "7_Tenis_10.00_18.00" "8_Tenis_10.00_18.00" "9_Tenis_10.00_18.00" "10_Tenis_10.00_18.00" "11_Tenis_10.00_18.00" "12_Tenis_10.00_18.00" "13_Tenis_10.00_18.00" "14_Tenis_10.00_18.00";
set FinalDeporteTenis := "7_Tenis_10.00_18.00" "8_Tenis_10.00_18.00" "9_Tenis_10.00_18.00" "10_Tenis_10.00_18.00" "11_Tenis_10.00_18.00" "12_Tenis_10.00_18.00" "13_Tenis_10.00_18.00" "14_Tenis_10.00_18.00";
set EventosDeporteTenisDeMesa := "7_TenisDeMesa_10.00_14.30" "7_TenisDeMesa_16.00_20.30" "8_TenisDeMesa_10.00_14.30" "8_TenisDeMesa_16.00_20.30" "9_TenisDeMesa_10.00_13.00" "9_TenisDeMesa_15.00_21.00" "10_TenisDeMesa_10.00_13.00" "10_TenisDeMesa_16.00_19.30" "12_TenisDeMesa_10.00_14.30" "12_TenisDeMesa_16.00_20.30" "13_TenisDeMesa_10.00_14.30" "13_TenisDeMesa_16.00_20.30" "14_TenisDeMesa_10.00_13.00" "14_TenisDeMesa_17.00_20.00" "15_TenisDeMesa_10.00_13.00" "15_TenisDeMesa_17.00_20.15";
set FinalDeporteTenisDeMesa := "7_TenisDeMesa_10.00_14.30" "7_TenisDeMesa_16.00_20.30" "8_TenisDeMesa_10.00_14.30" "8_TenisDeMesa_16.00_20.30" "9_TenisDeMesa_10.00_13.00" "9_TenisDeMesa_15.00_21.00" "10_TenisDeMesa_10.00_13.00" "10_TenisDeMesa_16.00_19.30" "12_TenisDeMesa_10.00_14.30" "12_TenisDeMesa_16.00_20.30" "13_TenisDeMesa_10.00_14.30" "13_TenisDeMesa_16.00_20.30" "14_TenisDeMesa_10.00_13.00" "14_TenisDeMesa_17.00_20.00" "15_TenisDeMesa_10.00_13.00" "15_TenisDeMesa_17.00_20.15";
set EventosDeporteTiroYVariantes := "7_TiroYVariantes_9.00_12.15" "8_TiroYVariantes_9.00_12.15" "9_TiroYVariantes_9.00_12.15" "10_TiroYVariantes_9.00_12.15" "10_TiroYVariantes_13.15_15.30" "11_TiroYVariantes_9.00_12.30" "11_TiroYVariantes_13.45_16.00" "12_TiroYVariantes_9.00_12.30" "12_TiroYVariantes_13.45_16.00";
set FinalDeporteTiroYVariantes := "7_TiroYVariantes_9.00_12.15" "8_TiroYVariantes_9.00_12.15" "9_TiroYVariantes_9.00_12.15" "10_TiroYVariantes_9.00_12.15" "10_TiroYVariantes_13.15_15.30" "11_TiroYVariantes_9.00_12.30" "11_TiroYVariantes_13.45_16.00" "12_TiroYVariantes_9.00_12.30" "12_TiroYVariantes_13.45_16.00";
set EventosDeporteTriatlon := "7_Triatlon_11.00_13.00" "8_Triatlon_11.00_13.00" "11_Triatlon_11.00_13.30";
set FinalDeporteTriatlon := "7_Triatlon_11.00_13.00" "8_Triatlon_11.00_13.00" "11_Triatlon_11.00_13.30";
set EventosDeporteNavegacionAVela := "7_NavegacionAVela_12.00_18.00" "8_NavegacionAVela_12.00_18.00" "9_NavegacionAVela_12.00_18.00" "10_NavegacionAVela_12.00_18.00" "11_NavegacionAVela_12.00_18.00" "12_NavegacionAVela_12.00_18.00" "13_NavegacionAVela_12.00_18.00";
set FinalDeporteNavegacionAVela := "7_NavegacionAVela_12.00_18.00" "8_NavegacionAVela_12.00_18.00" "9_NavegacionAVela_12.00_18.00" "10_NavegacionAVela_12.00_18.00" "11_NavegacionAVela_12.00_18.00" "12_NavegacionAVela_12.00_18.00" "13_NavegacionAVela_12.00_18.00";
set EventosDeporteHandballPlaya := "8_HandballPlaya_10.00_13.20" "8_HandballPlaya_14.30_17.50" "9_HandballPlaya_10.00_13.20" "9_HandballPlaya_14.30_17.50" "10_HandballPlaya_10.00_13.20" "11_HandballPlaya_10.00_13.20" "11_HandballPlaya_14.30_17.50" "12_HandballPlaya_10.00_13.20" "12_HandballPlaya_14.30_17.50" "13_HandballPlaya_9.30_12.50" "13_HandballPlaya_14.10_18.00";
set FinalDeporteHandballPlaya := "8_HandballPlaya_10.00_13.20" "8_HandballPlaya_14.30_17.50" "9_HandballPlaya_10.00_13.20" "9_HandballPlaya_14.30_17.50" "10_HandballPlaya_10.00_13.20" "11_HandballPlaya_10.00_13.20" "11_HandballPlaya_14.30_17.50" "12_HandballPlaya_10.00_13.20" "12_HandballPlaya_14.30_17.50" "13_HandballPlaya_9.30_12.50" "13_HandballPlaya_14.10_18.00";
set Eventos := "12_Arqueria_10.00_13.00" "13_Arqueria_9.00_13.00" "14_Arqueria_9.00_11.25" "14_Arqueria_14.00_16.45" "15_Arqueria_9.00_12.45" "15_Arqueria_14.00_17.45" "16_Arqueria_10.00_11.55" "16_Arqueria_14.00_16.15" "17_Arqueria_10.00_11.55" "17_Arqueria_14.00_16.15" "11_Atletismo_14.30_17.25" "12_Atletismo_14.30_17.30" "13_Atletismo_14.30_17.50" "14_Atletismo_14.00_17.50" "15_Atletismo_10.00_10.45" "15_Atletismo_13.35_18.00" "16_Atletismo_13.45_18.10" "7_Badminton_9.00_12.30" "7_Badminton_13.30_17.00" "7_Badminton_18.00_21.00" "8_Badminton_9.00_12.30" "8_Badminton_13.30_17.00" "8_Badminton_18.00_21.00" "9_Badminton_9.00_12.30" "9_Badminton_13.30_17.00" "9_Badminton_18.00_21.00" "10_Badminton_14.00_16.15" "10_Badminton_18.00_21.00" "11_Badminton_12.00_15.20" "11_Badminton_18.00_21.00" "12_Badminton_11.00_12.40" "12_Badminton_13.30_15.00" "12_Badminton_15.30_19.15" "7_BaileDeportivo_15.15_18.00" "8_BaileDeportivo_15.15_18.00" "10_BaileDeportivo_16.30_18.00" "11_BaileDeportivo_16.15_17.55" "7_Basquet_9.00_14.00" "8_Basquet_9.00_14.00" "9_Basquet_9.00_14.00" "10_Basquet_9.00_14.00" "11_Basquet_10.00_15.00" "12_Basquet_10.00_15.00" "13_Basquet_10.00_15.00" "14_Basquet_10.00_15.00" "15_Basquet_13.30_17.15" "16_Basquet_12.00_14.00" "16_Basquet_15.00_17.00" "17_Basquet_11.00_15.30" "7_VoleyPlaya_9.00_16.50" "8_VoleyPlaya_9.00_16.50" "9_VoleyPlaya_9.00_16.50" "10_VoleyPlaya_9.00_16.50" "11_VoleyPlaya_9.00_16.50" "12_VoleyPlaya_9.00_16.50" "13_VoleyPlaya_9.00_16.50" "14_VoleyPlaya_9.00_16.50" "15_VoleyPlaya_9.00_16.50" "16_VoleyPlaya_10.00_11.50" "16_VoleyPlaya_15.00_16.50" "17_VoleyPlaya_10.00_12.35" "17_VoleyPlaya_14.00_16.35" "14_Boxeo_13.00_16.15" "14_Boxeo_18.00_20.45" "15_Boxeo_13.00_16.15" "15_Boxeo_18.00_20.45" "16_Boxeo_13.00_16.30" "16_Boxeo_18.00_21.00" "17_Boxeo_13.00_16.25" "17_Boxeo_18.00_21.25" "18_Boxeo_13.00_17.05" "13_Ciclismo_11.00_13.00" "14_Ciclismo_11.00_15.30" "15_Ciclismo_11.00_13.45" "16_Ciclismo_11.00_13.00" "17_Ciclismo_11.00_14.40" "8_Equitacion_14.00_15.30" "9_Equitacion_14.00_16.00" "12_Equitacion_14.00_15.30" "13_Equitacion_14.00_16.00" "7_Escalada_9.00_9.25" "7_Escalada_12.00_14.10" "7_Escalada_15.00_16.20" "8_Escalada_9.00_9.25" "8_Escalada_12.00_14.10" "8_Escalada_15.00_16.20" "9_Escalada_10.00_10.20" "9_Escalada_12.00_13.15" "9_Escalada_16.00_16.40" "10_Escalada_10.00_10.20" "10_Escalada_12.00_13.15" "10_Escalada_16.00_16.40" "7_Esgrima_9.00_13.35" "7_Esgrima_16.30_19.40" "8_Esgrima_9.00_13.45" "8_Esgrima_17.00_20.10" "9_Esgrima_9.00_13.25" "9_Esgrima_16.30_19.35" "10_Esgrima_9.30_15.05" "7_Futsal_14.00_22.00" "8_Futsal_14.00_22.00" "9_Futsal_14.00_22.00" "10_Futsal_14.00_22.00" "11_Futsal_14.00_22.00" "12_Futsal_14.00_22.00" "13_Futsal_14.00_22.00" "15_Futsal_14.00_22.00" "17_Futsal_14.00_20.30" "18_Futsal_9.00_15.30" "7_Gimnasia_14.00_16.55" "7_Gimnasia_19.00_21.50" "8_Gimnasia_14.00_16.45" "8_Gimnasia_19.00_21.25" "9_Gimnasia_14.00_16.50" "9_Gimnasia_19.00_21.50" "10_Gimnasia_14.00_16.50" "10_Gimnasia_19.00_22.10" "11_Gimnasia_17.00_21.05" "12_Gimnasia_17.00_19.25" "13_Gimnasia_17.00_20.00" "14_Gimnasia_17.00_19.55" "15_Gimnasia_17.00_20.50" "16_Gimnasia_17.00_19.15" "9_Golf_8.30_17.00" "10_Golf_8.30_17.00" "11_Golf_8.30_17.20" "13_Golf_8.30_14.40" "14_Golf_8.30_16.30" "15_Golf_8.30_16.45" "7_Halterofilia_16.00_17.30" "7_Halterofilia_20.00_21.30" "8_Halterofilia_16.00_17.30" "8_Halterofilia_20.00_21.30" "9_Halterofilia_14.30_16.00" "9_Halterofilia_18.00_19.30" "11_Halterofilia_14.30_16.00" "11_Halterofilia_18.00_19.30" "12_Halterofilia_14.30_16.00" "12_Halterofilia_18.00_19.30" "13_Halterofilia_14.30_16.00" "13_Halterofilia_18.00_19.30" "7_Hockey_9.30_18.30" "8_Hockey_9.30_18.30" "9_Hockey_9.30_18.30" "10_Hockey_9.30_18.30" "11_Hockey_9.30_18.30" "12_Hockey_8.00_18.00" "13_Hockey_8.00_18.00" "14_Hockey_8.30_12.30" "14_Hockey_13.00_18.00" "7_Judo_10.00_12.25" "7_Judo_15.00_16.00" "8_Judo_10.00_12.25" "8_Judo_15.00_16.00" "9_Judo_10.00_11.40" "9_Judo_15.00_15.40" "10_Judo_10.00_13.15" "10_Judo_15.00_16.30" "17_Karate_10.00_13.10" "17_Karate_15.00_16.25" "18_Karate_9.00_12.10" "18_Karate_14.00_15.25" "12_LuchaLibre_10.00_11.15" "12_LuchaLibre_17.00_19.30" "13_LuchaLibre_10.00_14.10" "13_LuchaLibre_17.00_19.55" "14_LuchaLibre_10.00_11.15" "14_LuchaLibre_17.00_19.30" "7_Natacion_10.00_11.30" "7_Natacion_18.00_19.15" "8_Natacion_10.00_11.30" "8_Natacion_18.00_19.55" "9_Natacion_10.00_11.30" "9_Natacion_18.00_19.40" "10_Natacion_10.00_11.30" "10_Natacion_18.00_19.40" "11_Natacion_10.00_11.30" "11_Natacion_18.00_19.30" "12_Natacion_10.00_11.30" "12_Natacion_18.00_19.50" "12_Pentatlon_10.00_11.45" "12_Pentatlon_14.00_15.45" "13_Pentatlon_12.00_12.30" "13_Pentatlon_14.30_16.55" "14_Pentatlon_12.00_12.30" "14_Pentatlon_14.30_16.55" "15_Pentatlon_12.00_15.00" "16_Pentatlon_12.00_12.30" "16_Pentatlon_14.30_16.55" "7_Remo_15.30_17.05" "8_Remo_13.00_14.30" "8_Remo_15.30_17.00" "9_Remo_15.00_17.25" "10_Remo_14.45_17.25" "13_Rugby7_12.00_14.30" "13_Rugby7_15.05_17.35" "14_Rugby7_12.00_14.30" "14_Rugby7_15.05_17.35" "15_Rugby7_9.00_11.30" "15_Rugby7_13.30_17.00" "7_Taekwondo_14.00_17.00" "7_Taekwondo_19.00_21.00" "8_Taekwondo_14.00_17.00" "8_Taekwondo_19.00_21.00" "9_Taekwondo_14.00_17.00" "9_Taekwondo_19.00_21.00" "10_Taekwondo_14.00_17.00" "10_Taekwondo_19.00_21.00" "11_Taekwondo_14.00_17.00" "11_Taekwondo_19.00_21.00" "7_Tenis_10.00_18.00" "8_Tenis_10.00_18.00" "9_Tenis_10.00_18.00" "10_Tenis_10.00_18.00" "11_Tenis_10.00_18.00" "12_Tenis_10.00_18.00" "13_Tenis_10.00_18.00" "14_Tenis_10.00_18.00" "7_TenisDeMesa_10.00_14.30" "7_TenisDeMesa_16.00_20.30" "8_TenisDeMesa_10.00_14.30" "8_TenisDeMesa_16.00_20.30" "9_TenisDeMesa_10.00_13.00" "9_TenisDeMesa_15.00_21.00" "10_TenisDeMesa_10.00_13.00" "10_TenisDeMesa_16.00_19.30" "12_TenisDeMesa_10.00_14.30" "12_TenisDeMesa_16.00_20.30" "13_TenisDeMesa_10.00_14.30" "13_TenisDeMesa_16.00_20.30" "14_TenisDeMesa_10.00_13.00" "14_TenisDeMesa_17.00_20.00" "15_TenisDeMesa_10.00_13.00" "15_TenisDeMesa_17.00_20.15" "7_TiroYVariantes_9.00_12.15" "8_TiroYVariantes_9.00_12.15" "9_TiroYVariantes_9.00_12.15" "10_TiroYVariantes_9.00_12.15" "10_TiroYVariantes_13.15_15.30" "11_TiroYVariantes_9.00_12.30" "11_TiroYVariantes_13.45_16.00" "12_TiroYVariantes_9.00_12.30" "12_TiroYVariantes_13.45_16.00" "7_Triatlon_11.00_13.00" "8_Triatlon_11.00_13.00" "11_Triatlon_11.00_13.30" "7_NavegacionAVela_12.00_18.00" "8_NavegacionAVela_12.00_18.00" "9_NavegacionAVela_12.00_18.00" "10_NavegacionAVela_12.00_18.00" "11_NavegacionAVela_12.00_18.00" "12_NavegacionAVela_12.00_18.00" "13_NavegacionAVela_12.00_18.00" "8_HandballPlaya_10.00_13.20" "8_HandballPlaya_14.30_17.50" "9_HandballPlaya_10.00_13.20" "9_HandballPlaya_14.30_17.50" "10_HandballPlaya_10.00_13.20" "11_HandballPlaya_10.00_13.20" "11_HandballPlaya_14.30_17.50" "12_HandballPlaya_10.00_13.20" "12_HandballPlaya_14.30_17.50" "13_HandballPlaya_9.30_12.50" "13_HandballPlaya_14.10_18.00";
set Equipos := 1 2 3 4 5;
set Canales := 1 2;
set Deportes := "Arqueria" "Atletismo" "Badminton" "BaileDeportivo" "Basquet" "VoleyPlaya" "Boxeo" "Ciclismo" "Equitacion" "Escalada" "Esgrima" "Futsal" "Gimnasia" "Golf" "Halterofilia" "Hockey" "Judo" "Karate" "LuchaLibre" "Natacion" "Pentatlon" "Remo" "Rugby7" "Taekwondo" "Tenis" "TenisDeMesa" "TiroYVariantes" "Triatlon" "NavegacionAVela" "HandballPlaya";
set Sedes := "GREEN" "SAV" "TECNO" "URBAN" "YOP";
set Jornadas := 7 8 9 10 11 12 13 14 15 16 17 18;
param Calidad_T := "Arqueria" 6
 "Atletismo" 5
 "Badminton" 4
 "BaileDeportivo" 1
 "Basquet" 6
 "VoleyPlaya" 10
 "Boxeo" 5
 "Ciclismo" 8
 "Equitacion" 4
 "Escalada" 2
 "Esgrima" 5
 "Futsal" 10
 "Gimnasia" 8
 "Golf" 4
 "Halterofilia" 7
 "Hockey" 10
 "Judo" 9
 "Karate" 4
 "LuchaLibre" 4
 "Natacion" 9
 "Pentatlon" 4
 "Remo" 6
 "Rugby7" 8
 "Taekwondo" 7
 "Tenis" 8
 "TenisDeMesa" 7
 "TiroYVariantes" 5
 "Triatlon" 5
 "NavegacionAVela" 4
 "HandballPlaya" 8
;
param Calidad_E := "Arqueria" 6
 "Atletismo" 10
 "Badminton" 3
 "BaileDeportivo" 3
 "Basquet" 4
 "VoleyPlaya" 5
 "Boxeo" 7
 "Ciclismo" 7
 "Equitacion" 1
 "Escalada" 2
 "Esgrima" 8
 "Futsal" 3
 "Gimnasia" 8
 "Golf" 1
 "Halterofilia" 5
 "Hockey" 4
 "Judo" 10
 "Karate" 8
 "LuchaLibre" 8
 "Natacion" 8
 "Pentatlon" 7
 "Remo" 6
 "Rugby7" 8
 "Taekwondo" 9
 "Tenis" 5
 "TenisDeMesa" 8
 "TiroYVariantes" 2
 "Triatlon" 9
 "NavegacionAVela" 4
 "HandballPlaya" 7
;
param Calidad_F := "Arqueria" 8
 "Atletismo" 10
 "Badminton" 2
 "BaileDeportivo" 1
 "Basquet" 5
 "VoleyPlaya" 7
 "Boxeo" 7
 "Ciclismo" 5
 "Equitacion" 2
 "Escalada" 1
 "Esgrima" 8
 "Futsal" 10
 "Gimnasia" 8
 "Golf" 2
 "Halterofilia" 5
 "Hockey" 10
 "Judo" 7
 "Karate" 7
 "LuchaLibre" 6
 "Natacion" 8
 "Pentatlon" 6
 "Remo" 7
 "Rugby7" 8
 "Taekwondo" 7
 "Tenis" 10
 "TenisDeMesa" 5
 "TiroYVariantes" 3
 "Triatlon" 8
 "NavegacionAVela" 4
 "HandballPlaya" 8
;
param Cubre (tr): 1 2 3 4 5 :=
	"Arqueria" 1 1 1 0 1 
	"Atletismo" 1 0 1 1 1 
	"Badminton" 1 0 0 1 0 
	"BaileDeportivo" 1 1 0 0 0 
	"Basquet" 1 1 1 1 0 
	"VoleyPlaya" 1 1 1 1 0 
	"Boxeo" 1 1 1 0 1 
	"Ciclismo" 1 0 1 1 1 
	"Equitacion" 1 0 0 1 0 
	"Escalada" 1 0 0 0 0 
	"Esgrima" 1 0 1 1 1 
	"Futsal" 1 1 1 1 0 
	"Gimnasia" 1 0 1 1 1 
	"Golf" 1 0 0 1 0 
	"Halterofilia" 1 0 1 1 1 
	"Hockey" 1 1 1 1 0 
	"Judo" 1 1 1 0 1 
	"Karate" 1 1 1 0 1 
	"LuchaLibre" 1 1 1 0 1 
	"Natacion" 1 0 1 1 1 
	"Pentatlon" 1 0 1 1 1 
	"Remo" 1 0 1 1 1 
	"Rugby7" 1 1 1 1 0 
	"Taekwondo" 1 1 1 0 1 
	"Tenis" 1 1 1 1 0 
	"TenisDeMesa" 1 1 1 1 0 
	"TiroYVariantes" 1 0 0 1 0 
	"Triatlon" 1 0 1 1 1 
	"NavegacionAVela" 1 0 0 1 0 
	"HandballPlaya" 1 1 1 1 0 
;
param Especialista (tr): 1 2 3 4 5 :=
	"Arqueria" 1 1 1 1 0 
	"Atletismo" 1 1 1 1 0 
	"Badminton" 1 1 1 1 0 
	"BaileDeportivo" 1 1 1 1 0 
	"Basquet" 1 1 1 1 0 
	"VoleyPlaya" 1 1 1 1 0 
	"Boxeo" 1 1 1 1 0 
	"Ciclismo" 1 1 1 1 0 
	"Equitacion" 1 1 1 1 0 
	"Escalada" 1 1 1 1 0 
	"Esgrima" 1 1 1 1 0 
	"Futsal" 1 1 1 1 0 
	"Gimnasia" 1 1 1 1 0 
	"Golf" 1 1 1 1 0 
	"Halterofilia" 1 1 1 1 0 
	"Hockey" 1 1 1 1 0 
	"Judo" 1 1 1 1 0 
	"Karate" 1 1 1 1 0 
	"LuchaLibre" 1 1 1 1 0 
	"Natacion" 1 1 1 1 0 
	"Pentatlon" 1 1 1 1 0 
	"Remo" 1 1 1 1 0 
	"Rugby7" 1 1 1 1 0 
	"Taekwondo" 1 1 1 1 0 
	"Tenis" 1 1 1 1 0 
	"TenisDeMesa" 1 1 1 1 0 
	"TiroYVariantes" 1 1 1 1 0 
	"Triatlon" 1 1 1 1 0 
	"NavegacionAVela" 1 1 1 1 0 
	"HandballPlaya" 1 1 1 1 0 
;
end;
