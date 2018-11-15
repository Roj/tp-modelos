import csv
from pprint import pprint

K_CONJ = 'conj'
K_DEP = 'id_dep'
K_IN = 'inicio'
K_F = 'fin'
DISPLACEMENT = 0 # si hiciera falta que el dia 7 diga dia 1, ponemos 6 aca y listo

NUM_RESTR = 0
SRC_PATH = "../maximales/maximales_{}.csv"
DIAS = range(7,19)#range(7,19) #dias 7 a 18
MOLDE_PRE = "s.t. transm_{}{{c in Canales}}: "
MOLDE_POST = "<= 2"
MOLDE_VAR = "T_[\"{}_{}_{}_{}\"][c]" #dia-deporte-hora_inicio-hora_fin

deportes = ["Arqueria", "Atletismo", "Badminton", "BaileDeportivo",
    "Basquet", "VoleyPlaya", "Boxeo", "Ciclismo", "Equitacion",
    "Escalada", "Esgrima", "Futsal", "Gimnasia", "Golf",
    "Halterofilia",
    "Hockey", "Judo", "Karate", "LuchaLibre", "Natacion", "Pentatlon",
    "Remo", "Rugby7", "Taekwondo", "Tenis", "TenisDeMesa",
    "TiroYVariantes", "Triatlon", "NavegacionAVela",
    "HandballPlaya"]

#f = lambda x: 1 if x=='SI' else 2  #se usa en generar_modelos.py
INT_d = [1,1,2,1,2,2,2,1,1,1,2,2,1,1,1,2,2,2,2,1,1,1,2,2,2,2,1,1,1,2]


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

if __name__ == "__main__":
    for num_dia in DIAS:
        conjs_dia_i = cargar_conjs(num_dia)
        for conj_dia_i in conjs_dia_i:
            armar_restr_de_conj_dia(num_dia,conj_dia_i)
