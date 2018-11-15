#!/usr/bin/python3
import csv
"""
Idea del modelo:

conjuntos:  Eventos, EventosDeporte{d in deporte}, Final{d in deporte}
            Equipos, Sedes, Jornadas, Deportes, Canales

parametros: Calidad_T{d in deporte}, Calidad_E{d in deporte},
            Calidad_F{d in deporte}. Especialista{i in equipo, d in deporte},
            Cubre{i in equipo, d in deporte}

variables:  Y_{e in Eventos}, Y_{e in Eventos, i in Equipos},
            T_{e in Eventos}_1, T_{e in Eventos}_2,
            E{i in Equipos, s in Sedes, j in Jornadas}

restricc.:  * forall e in Eventos: sum{i in Equipos} Y_e_i <= 1
            * forall e in Eventos: sum{i in Equipos} Y_e_i = Y_e
            * ("forall d in Deportes") forall i in Equipos, e in EventosDeporte_d: Y_e_i <= c_i_d
            * conjuntos maximales como una rest. por cada conj.
            * restricciones separadas por cada sede y jornada:
                  forall i: E_i_s_j <= Y_e_i + Y_e'_i + ... <= n * E_i_s_j
                  n = cantidad de eventos para esa sede en esa jornada
                      (i.e. terminos de la suma)
            * forall i in Equipos, j in Jornadas: sum{s in Sedes} E_i_s_j <= 1
            * restricciones separadas para cada final:
                  Y_final <= Y_e + Y_e' + Y_e'' + ...
                  (e, e', e'', ... son del mismo deporte que final y están
                  antes)
            * ("forall d in Deportes") forall e in Final_d, i in Equipos: Y_e_i <= Especialista_i_d
            * forall e in Eventos: Y_e = T_e_1 + T_e_2
            * conjuntos maximales para exclusividad de transmision

funcional:  sum {d in deportes}(sum{e in EventosDeporte_d} (Y_e_i(Calidad_T_d + Calidad_E_d * Especialista_i_d))
                                + sum{e in Final_d} Y_e * Calidad_F_d)

"""
# Cargado de archivos
with open("constantes_calidad.csv") as f:
    constantes = list(csv.DictReader(f))
    # constantes: list of dict(N, Deporte, Categoría, Intercalable, Calidad base,
    #  AumentoFinal, AumentoEspecialista)

eventos = None#...
def eventos_sede_jornada(sede, jornada):
    return [str(i) for i in range(2)]
sedes = ["A", "B", "C"]
jornadas = [1,2,3]
deportes = ["Arqueria", "Atletismo", "Badminton", "BaileDeportivo",
    "Basquet", "VoleyPlaya", "Boxeo", "Ciclismo", "Equitacion",
    "Escalada", "Esgrima", "Futsal", "Gimnasia", "Golf",
    "Halterofilia",
    "Hockey", "Judo", "Karate", "LuchaLibre", "Natacion", "Pentatlon",
    "Remo", "Rugby7", "Taekwondo", "Tenis", "TenisDeMesa",
    "TiroYVariantes", "Triatlon", "NavegacionAVela",
    "HandballPlaya"]

#utilities
K_CONJ = 'conj'
K_DEP = 'id_dep'
K_IN = 'inicio'
K_F = 'fin'
DIA_INICIAL = 7 # si hiciera falta que el dia 7 diga dia 1, ponemos 1 aca y listo
DISPLACEMENT = 7 - DIA_INICIAL


NUM_RESTR = 0   # global horrible para numero de restriccion de transmision
SRC_PATH = "maximales/maximales_{}.csv"
DIAS = range(7,19)#range(7,19) #dias 7 a 18
MOLDE_PRE = "s.t. transm_{}{{c in Canales}}: "
MOLDE_POST = "<= 2;"
MOLDE_VAR = "T_[\"{}_{}_{}_{}\"][c]" #dia-deporte-hora_inicio-hora_fin

MOLDE_FINALES_PRE = "s.t. final_{}_{}_{}: "   #num_restr_deporte-dia
MOLDE_FINALES_POST = " >= Y_[\"{}_{}_{}_{}\"];"  #dia-deporte-hora_inicio-hora_fin
MOLDE_FINALES_VAR = "Y_[\"{}_{}_{}_{}\"]" #dia-deporte-hora_inicio-hora_fin
NUM_RESTR_FINALES = 0
K_ES_FINAL = 'es_final'
K_DIA = 'num_dia'
HORARIOS_PATH = "horarios/horarios_{}.csv"

def cargar_conjs(num_dia):
    with open(SRC_PATH.format(num_dia)) as f:
        conjs = []
        for x in csv.DictReader(f):
            load = {K_CONJ: int(x[K_CONJ]),
                    K_DEP:x[K_DEP],
                    K_IN:("%.2f") % float(x[K_IN]),
                    K_F: ("%.2f") % float(x[K_F])}
            if load[K_CONJ] > len(conjs):
                conjs.append([])
                #pprint(conjs)
            conjs[-1].append(load)
    #print("Se cargan "+str(len(conjs))+" conjuntos")
    #pprint(conjs)
    return conjs

def armar_restr_de_conj_dia(num_dia,conj):
    """toma un conj maximal de un dia num_dia y genera la restriccion acorde"""
    global NUM_RESTR
    restr = ""
    for evento in conj:
        if restr != "":
            restr += " + "
        dia = str(num_dia-DISPLACEMENT)
        #pprint(evento)
        idx_depo =int(evento[K_DEP])-1
        depo = deportes[idx_depo]
        h_in = evento[K_IN]
        h_f = evento[K_F]
        x = MOLDE_VAR.format(dia,depo,h_in,h_f)
        #print(x)
        restr += x + "*" + str(INT_d[idx_depo])
    restr = MOLDE_PRE.format(NUM_RESTR) + restr + MOLDE_POST
    NUM_RESTR+=1
    print(restr)

def cargar_eventos():
    lista_evs = [[] for i in range(len(deportes))] #una lista de eventos para cada deporte
    for num_dia in DIAS:
        with open(HORARIOS_PATH.format(num_dia)) as f:
            for x in csv.DictReader(f):
                load = {K_DEP: int(x[K_DEP]),
                        K_IN:("%.2f") % float(x[K_IN]),
                        K_F: ("%.2f") % float(x[K_F]),
                        K_ES_FINAL: int(x[K_ES_FINAL]),
                        K_DIA: num_dia-DISPLACEMENT}
                idx_depo = load[K_DEP]-1
                #print("cargado en "+str(idx_depo))
                lista_evs[idx_depo].append(load)
    return lista_evs

def generar_restr_final(restr_base, ev_final):
    global NUM_RESTR_FINALES
    assert restr_base != ""
    dia,idx_deporte,h_in,h_f = [ev_final[k] for k in [K_DIA,K_DEP,K_IN,K_F]]
    depo = deportes[idx_deporte-1]
    #pprint([dia,depo,h_in,h_f])
    x_pre = MOLDE_FINALES_PRE.format(NUM_RESTR_FINALES,depo,dia)
    x_post = MOLDE_FINALES_POST.format(dia,depo,h_in,h_f)
    print(x_pre+restr_base+x_post)
    NUM_RESTR_FINALES+=1
#/utilities

# Definicion de conjuntos
print("set Eventos;")
for deporte in deportes:
    print("set EventosDeporte{};".format(deporte))
for deporte in deportes:
    print("set FinalDeporte{};".format(deporte))
print("set Equipos;")
print("set Sedes;")
print("set Jornadas;")
print("set Deportes;")
print("set Canales;")
# Definicion de parametros
print("param Calidad_T{d in Deportes};")
print("param Calidad_E{d in Deportes};")
print("param Calidad_F{d in Deportes};")
print("param Especialista_{i in Equipos}{d in Deportes};")
print("param Cubre_{i in Equipos}{d in Deportes};")

# Definición de variables
print("var Y_{e in Eventos}, binary;")
print("var Y_{e in Eventos}{i in Equipos}, binary;")
print("var T_{e in Eventos}{c in Canales}, binary;")
print("var E_{i in Equipos}{s in Sedes}{j in Jornada}, binary;")

# Definición de funcional
terminos = ""
for deporte in deportes:
    terminos += "\t+ "
    terminos += "sum{{e in EventosDeporte{0}, i in Equipos}}(Y_[e][i](Calidad_T[\"{0}\" + Calidad_E[\"{0}\"] * Especialista[i][\"{0}\"]))".format(deporte)
    terminos += " + sum{{e in FinalDeporte{0}}} (Y_[e] * Calidad_F[\"{0}\"])\n".format(deporte)
print("maximize z: {0};".format(terminos[3:]))

# Definición de restricciones

# La agrego pero comentada porque esta restricción es redundante
# si las siguientes restricciones hacen bivalente = suma de bivalentes
# (Y_e = Y_e_1 + ...)
#print("s.t. max_1_eq_ev_{e in Eventos}: sum{i in Equipos}(Y_[e][i]) <= 1;")
print("s.t. def_Y_{e in Eventos}: Y_[e] = sum{i in Equipos}Y_[e][i];")
for deporte in deportes:
    print(("s.t. cubr_eq_dep_{0}{{i in Equipos, e in EventosDeporte{0}}}:"
        + "Y_[e][i] <= Cubre_[i][\"{0}\"];").format(deporte))
# TODO: conjuntos maximales
for sede in sedes:
    for jornada in jornadas:
        terminos_eventos = ["Y_["+e+"]" for e in eventos_sede_jornada(sede, jornada)]
        cantidad_eventos = len(terminos_eventos)
        terminos_eventos = " + ".join(terminos_eventos)
        print(("s.t. e_i_{0}_{1}_inf{{i in Equipos}}: E_[i][\"{0}\"][{1}]"
            + "<= {2};").format(sede, jornada, terminos_eventos))
        print(("s.t. e_i_{0}_{1}_sup{{i in Equipos}}: {2} <= "
            + "{3} * E_[i][\"{0}\"][{1}];").format(sede, jornada,
            terminos_eventos, cantidad_eventos))

print("s.t. excl_E_i_s_j{i in Equipos, j in Jornadas}: "
    + "sum{s in Sedes} E_[i][s][j] <= 1;")


for deporte in deportes:
    print(("s.t. final_especialista_dep{0}_{{e in FinalDeporte{0}, i in Equipos}}: "
        + "Y_[e][i] <= Especialista_[i][{0}];").format(deporte))

print("s.t. transmision{e in Eventos}: Y_[e] = sum{c in Canales} T_[e][c];")

#restricciones de transmision por conjs maximales
f = lambda x: 1 if x=='SI' else 2
INT_d = [f(cte['Intercalable']) for cte in constantes]
for num_dia in range(DIA_INICIAL,DIA_INICIAL+12):
    conjs_dia_i = cargar_conjs(num_dia)
    for conj_dia_i in conjs_dia_i:
        armar_restr_de_conj_dia(num_dia,conj_dia_i)

#restricciones de cubrir un evento anterior a una final. Notar que es precondicion que...
#...haya un evento anterior a una final, cubierta por preprocesamiento
listas_evs_deporte = cargar_eventos()
for idx_depo in range(len(deportes)):   #para cada deporte
    depo = deportes[idx_depo]
    evs_deporte_i = listas_evs_deporte[idx_depo]
    restr_base = ""
    for ev_dep_i in evs_deporte_i:      #para cada evento del deporte i
        if ev_dep_i[K_ES_FINAL]: #si es final genero restriccion
            generar_restr_final(restr_base, ev_dep_i)
        else:       #si no es final agrego a restr_base
            if restr_base != "":
                restr_base += " + "
            dia = ev_dep_i[K_DIA]
            h_in = ev_dep_i[K_IN]
            h_f = ev_dep_i[K_F]
            restr_base += MOLDE_FINALES_VAR.format(dia,depo,h_in,h_f)
