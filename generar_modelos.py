#!/usr/bin/python3
import csv
"""
Idea del modelo:

conjuntos:  Eventos, EventosDeporte{d in deporte}, Final{d in deporte}
            Equipos, Sedes, Jornadas, Deportes

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
# Definicion de parametros
print("param Calidad_T{d in Deportes};")
print("param Calidad_E{d in Deportes};")
print("param Calidad_F{d in Deportes};")
print("param Especialista_{i in Equipos}_{d in Deportes};")
print("param Cubre_{i in Equipos}_{d in Deportes};")

# Definición de variables
# Definición de funcional

# Definición de restricciones
