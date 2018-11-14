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
    "Basquet", "HandballPlaya", "Boxeo", "Ciclismo", "Equitacion",
    "Escalada", "Esgrima", "Futsal", "Gimnasia", "Golf",
    "Halterofilia",
    "Hockey", "Judo", "Karate", "LuchaLibre", "Natacion", "Pentatlon",
    "Remo", "Rugby7", "Taekwondo", "Tenis", "TenisDeMesa",
    "TiroYVariantes", "Triatlon", "NavegacionAVela",
    "VoleyPlaya"]

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

# TODO: Restricciones de final sobre eventos previos
for deporte in deportes:
    print(("s.t. final_especialista_dep{0}_{{e in FinalDeporte{0}, i in Equipos}}: "
        + "Y_[e][i] <= Especialista_[i][{0}];").format(deporte))

print("s.t. transmision{e in Eventos}: Y_[e] <= sum{c in Canales} T_[e][c];")
# TODO: Restricciones de conjuntos maximales para exclusividad de transmision

