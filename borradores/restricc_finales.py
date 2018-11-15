
import csv
from pprint import pprint

K_CONJ = 'conj'
K_DEP = 'id_dep'
K_IN = 'inicio'
K_F = 'fin'
DISPLACEMENT = 0 # si hiciera falta que el dia 7 diga dia 1, ponemos 6 aca y listo
DIA_INICIAL = 7 # si hiciera falta que el dia 7 diga dia 1, ponemos 1 aca y listo
DISPLACEMENT = 7 - DIA_INICIAL

DIAS = range(16,19)#range(7,19) #dias 7 a 18


deportes = ["Arqueria", "Atletismo", "Badminton", "BaileDeportivo",
    "Basquet", "VoleyPlaya", "Boxeo", "Ciclismo", "Equitacion",
    "Escalada", "Esgrima", "Futsal", "Gimnasia", "Golf",
    "Halterofilia",
    "Hockey", "Judo", "Karate", "LuchaLibre", "Natacion", "Pentatlon",
    "Remo", "Rugby7", "Taekwondo", "Tenis", "TenisDeMesa",
    "TiroYVariantes", "Triatlon", "NavegacionAVela",
    "HandballPlaya"]

###nuevos
MOLDE_FINALES_PRE = "s.t. final_{}_{}_{}: "   #num_restr_deporte-dia
MOLDE_FINALES_POST = " >= Y_[\"{}_{}_{}_{}\"];"  #dia-deporte-hora_inicio-hora_fin
MOLDE_FINALES_VAR = "Y_[\"{}_{}_{}_{}\"]" #dia-deporte-hora_inicio-hora_fin
NUM_RESTR_FINALES = 0
K_ES_FINAL = 'es_final'
K_DIA = 'num_dia'
HORARIOS_PATH = "horarios/horarios_{}.csv"
###/nuevos

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
    #assert restr_base != ""
    dia,idx_deporte,h_in,h_f = [ev_final[k] for k in [K_DIA,K_DEP,K_IN,K_F]]
    depo = deportes[idx_deporte-1]
    #pprint([dia,depo,h_in,h_f])
    x_pre = MOLDE_FINALES_PRE.format(NUM_RESTR_FINALES,depo,dia)
    x_post = MOLDE_FINALES_POST.format(dia,depo,h_in,h_f)
    print(x_pre+restr_base+x_post)
    NUM_RESTR_FINALES+=1

###prueba
if __name__ == "__main__":
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
