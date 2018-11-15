import csv
from pprint import pprint as pp

NUM_DIA = 18
FILEPATH = "../horarios/horarios_{}.csv".format(NUM_DIA)
TARGET="../maximales/maximales_{}.csv".format(NUM_DIA)
K_DEP = 'id_dep'
K_IN = 'inicio'
K_F = 'fin'
K_CONJ = 'conj'
HORA_INICIO = 7.01
HORA_FIN = 23.01

def avanzar_hora(hora):
    hora += 0.05
    if (hora*100)%100 == 61: #si se paso de los 60 minutos
        hora += .40          #completo la hora
    return hora

def sec(e1,e2):
    """True sii e1 y e2 se intersecan"""
    return not (e1[K_F] <= e2[K_IN] or e1[K_IN] >= e2[K_F])

def cont_en(conj1,conj2):
    """True sii conj1 contenido en conj2"""
    for e in conj1:
        if e not in conj2:
            return False
    return True


#FILEPATH tiene tuplas de la forma id_dep,inicio,fin
def cargar(path):
    with open(path) as f:
        horarios = [{K_DEP:x[K_DEP],
                     K_IN:float(x[K_IN]),
                     K_F:float(x[K_F])} for x in csv.DictReader(f)]
    return horarios

def descargar(target_path,payload):

    with(open(target_path,'w')) as f:
        fieldnames = [K_CONJ,K_DEP,K_IN,K_F]
        dw = csv.DictWriter(f,fieldnames)
        dw.writeheader()
        for conj_idx in range(len(payload)):
            for e in payload[conj_idx]:
                e[K_CONJ] = conj_idx+1
                dw.writerow(e)

#generacion de bulk de conjuntos
#eventos es dict de claves K_DEP(string), K_IN (float), K_F(float)
def gen_conjs(eventos):
    conjs = []
    hora_act = HORA_INICIO
    while (hora_act < HORA_FIN):
        aux = []
        for e in eventos:
            if hora_act < e[K_F] and hora_act > e[K_IN]:
                aux.append(e)
            try:
                if conjs[-1] != aux and len(aux) >= 2: #no me interesa ni lo mismo ni 1 solo evento
                    conjs.append(aux)
            except IndexError as e:
                if len(conjs) == 0 and len(aux) >= 2:
                    conjs.append(aux)
        hora_act = avanzar_hora(hora_act)
    return conjs


def prune_conjs(conjs):
    l = len(conjs)
    for idx in range(l):
        for idx2 in range(l):
            if conjs[idx] is None or idx==idx2 or conjs[idx2] is None:
                continue
            if cont_en(conjs[idx],conjs[idx2]): #si el primero esta en el segundo lo borro, luego no lo pruebo mas
                conjs[idx] = None
                break
    return [c for c in conjs if c is not None]

if __name__ == "__main__":
    horarios = cargar(FILEPATH)
    #pp(horarios)
    conjs = gen_conjs(horarios)
    #pp(conjs)
    maxconjs = prune_conjs(conjs)
    pp(maxconjs)
    print("Había "+str(len(conjs))+" conjuntos")
    print("Quedaron "+str(len(maxconjs))+" conjuntos maximales")
    descargar(TARGET,maxconjs)
