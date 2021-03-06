---
title: Trabajo Práctico 1
author:
- Martín Errázquin (98017)
- Joaquín Torré Zaffaroni (98314)
toc: yes
---
## Análisis

### Set-covering

El problema planteado se puede modelar como una variación del problema de
cobertura de conjuntos. Los conjuntos se pueden ver como los equipos
periodísticos y los elementos a cubrir los eventos deportivos. Un conjunto
puede "contener" a un elemento si el equipo puede cubrir la categoría del evento.
Cuatro diferencias con el problema canónico de cobertura de conjuntos son:  

* son varias coberturas (se tienen que analizar varios días); esto se puede
  modelar de dos maneras: tomando cada equipo como un sólo conjunto que cubre
  todos los días, o como N conjuntos que cubren una sola de las N jornadas cada
  uno.
* si bien los conjuntos pueden cubrir varios elementos, terminan cubriendo sólo
  algunos (uno por día o uno en total, dependiendo de si un equipo se representa
  como un conjunto o un conjunto por día)
* el criterio de pertenencia no es siempre el mismo: en las finales, no basta
  que el equipo pueda cubrir una categoría, debe tener un especialista del
  deporte.
* hay algunas relaciones entre los elementos, no son del todo independientes:
  por ejemplo, no se puede cubrir una final sin haber cubierto un evento de ese
  deporte.

### Capacidad de cobertura
En la siguiente tabla se indica la capacidad de cobertura, donde una X marca que
ese equipo puede cubrir esa categoría. Se hace una distinción especial para la
categoría E que consta de Baile Deportivo y Escalada, por especialistas del
primero que no son del segundo.

| Categoría	|	Equipo 1 	| Equipo 2	| Equipo 3 	| Equipo 4 	| Equipo 5 	|
|	:---:			|	:---:		 	|	:---:			|	:---:		 	|	:---:			|	:---:		 	|
|A					|		X				|						|			X			|			X			|			X			|
|B					|		X				|			X			|			X			|						|			X			|
|C					|		X				|			X			|			X			|			X			|						|
|D					|		X				|						|						|			X			|						|
|E (BD)			|		X				|			X			|						|						|						|
|E (Esc)		|		X				|						|						|						|						|

Esto es importante porque no tiene sentido contemplar la posibilidad de que un
equipo cubra un determinado evento si en realidad no es factible tal opción y
tal vez resulte conveniente, en vez de modelar una variable y forzarla a
valer 0, directamente no modelarla.

Aplicada a finales, la capacidad de cobertura es más restrictiva y exige que el
equipo a cubrir cada una posea un especialista de la disciplina. Con el mismo
formato se indica la capacidad para cubrir finales por categoría en la siguiente
tabla.

| Categoría	|	Equipo 1 	| Equipo 2	| Equipo 3 	| Equipo 4 	| Equipo 5 	|
|	:---:			|	:---:		 	|	:---:			|	:---:		 	|	:---:			|	:---:		 	|
|A					|		X				|						|						|			X			|			X			|
|B					|		X				|						|			X			|						|			X			|
|C					|		X				|			X			|			X			|						|						|
|D					|		X				|						|						|			X			|						|
|E (BD)			|						|			X			|						|						|						|
|E (Esc)		|		X				|						|						|						|						|


### Desagregación de datos

Se adjunta una tabla de datos donde se muestra cómo en realidad para cada día no
hay tanta superposición como podría esperarse, resultando factible en vez de
construir los conjuntos de superposiciones en el modelo, hacerlo directamente como
procesamiento previo.

### Separación de cobertura de eventos y transmisión

Suponiendo la existencia de cierta variable que indique la cobertura (sin importar
el equipo) de un evento , se observa que por un lado actúan las restricciones
respecto a que un equipo pueda asistir al mismo y por otro lado e independientemente
que pueda ser transmitido. Es decir,esta potencial variable actúa de vínculo entre
dos posibles modelos separados, uno de cobertura y otro de transmisión.
En el diagrama básico adjunto se muestra esta separación de restricciones, además
del hecho de que las condiciones de finales son un *agregado* a las condiciones de
eventos, lo cual es muy importante para nuestro modelo ya que las identificamos como
eventos con "características extra".

## Objetivo

Determinar si mandar un equipo periodístico (y en ese caso, cuál) a cada
evento deportivo, de manera de maximizar la calidad de cobertura de los juegos
olímpicos, en el plazo de duración de los juegos.

## Hipótesis
### Generales  

* Los canales no tienen errores en ningún momento (por ejemplo, caída de la red
  satelital, problemas con las cámaras, etc).
* Ningún evento deportivo requiere o puede tener
  más de un equipo periodístico. Esto es
  particularmente importante para deportes como ciclismo, triatlón y navegación
  a vela, que son deportes que requieren gran espacio.
* No es necesario planificar cómo se deberán intercalar los eventos.
* Los eventos se transmiten en su totalidad (sea o no intercalada) o no se
  transmiten. No se pueden subdividir los eventos en partes tal
  manera que se cambie de cobertura antes de que terminen.
* Sin embargo, sí es posible transmitir un evento que acepta otro intercalado y
  que este último cambie a la mitad de la transmisión (por ejemplo: un deporte
  tiene horario de 13:00 a 15:00, otro de 13:00 a 14:00 y un tercero de 14:00 a
  15:00; todos estos se pueden transmitir en el mismo canal).
* El primer día de transmisión es el 7 de octubre y el último el 18 de octubre.
  (En el *schedule* hay dos días tomados como días extra antes del inicio de los
  juegos, esta hipótesis los descarta.)
* No es necesario cubrir todas las horas de transmisión con algún deporte. Por
  ejemplo, si en una hora hay deportes en actividad pero no se muestran porque
  luego comenzará un deporte no-intercalable con mucho mayor impacto en la
  calidad de transmisión, esta solución es factible.
* Los *aumentos* que figuran en la tabla tienen las mismas unidades que la
  calidad por evento transmitido, es decir, no son porcentajes.
* La calidad de transmisión es un valor fijo por evento, no depende de la
  duración del evento.

### Sobre los eventos deportivos  

* No hay demoras de ningún tipo, ni cambios en las ubicaciones (p.ej. un evento
  no puede cambiarse de sede).
* Aparte de aumento por calidad de final y por especialista, no hay otros
  factores
  (por ejemplo, si un jugador o equipo es muy famoso, o si hay rivalidad entre
  contrincantes, si es una semifinal, etc.)
* La final de un deporte intercalable también es intercalable. No se hace
  distinción por ser final.
* La restricción que habilita transmitir una final ("transmitir algun evento
  anterior a las finales") no hace distinción entre eventos. Es decir, con sólo
  transmitir un evento ya se pueden transmitir las finales de ese deporte. No es
  necesario, por ejemplo, que las semifinales sean transmitidas.
* De la misma forma, si un deporte tiene una final sin eventos previos, no lo
  consideramos como final en el modelo.
  (En el *schedule* tomada de ejemplo el primer evento del triatlón se marca
  como final.)
* Si algún evento deportivo es intercalable pero se muestra solo (p.ej., porque
  no hay otros eventos en ese momento), no cambia la calidad de transmisión por
  dedicarle más tiempo de cobertura.
* No hay eventos del mismo deporte, en sedes distintas, que compartan algún
  horario.

### Sobre los equipos periodísticos  

* Los periodistas especificados se mantienen hasta el final, ninguno se baja y
  ninguno se suma. Esto implica que las especialidades y categorías que pueden
  cubrir no cambian.
* Un equipo, a priori, puede cubrir cualquier horario necesario. No hay
  restricciones por horario de almuerzo o similar.
* No importa el tamaño del equipo a la hora de cubrir un deporte, o bien la
  categorías que puede cubrir ya incluyen estas restricciones. (Esta hipótesis
  está relacionada a la de un solo equipo por evento.)

## Variables y parámetros

Para las variables utilizamos ciertas convenciones: $j$ se refiere a las
jornadas, $d$ a un deporte, $h$ a un horario dentro de un día, $i$ a un i-ésimo
equipo, $s$ a una sede, $k$ al número de canal (1 o 2).  
De manera genérica podemos definir conjuntos asociados: $J$ es el conjunto de
jornadas o días, $D$ el conjunto de deportes, $\mathrm{Eq}$ el conjunto de
equipos periodísticos.
Algunos conjuntos especiales son:

* $\mathrm{H}_{j,d}$ el conjunto de horarios $(h_1, h_2)$ para el deporte $d$
  en la jornada $j$.
* También definimos el conjunto $\mathrm{F}$ que contiene la terna
  $(j, d, h_1, h_2)$ si ese evento es una final.
* Definimos $\mathrm{X}_{j}$ como el conjunto de conjuntos maximales de eventos
  de horarios intersecados 2 a 2 durante la jornada $j$. A saber:
    * Un conjunto de eventos de horarios intersecados 2 a 2 es un conjunto de eventos
    tales que para cada par de los mismos, sus horarios se intersecan/superponen.
    * Un conjunto de eventos de horarios intersecados 2 a 2 es maximal si no hay otro
    evento esa jornada tal que su horario se superponga con todos los eventos que
    contiene el conjunto.
* Para simplicidad en la expresión de restricciones, vamos a definir el conjunto de
todos los eventos Ev:
$$
\mathrm{Ev} = \{ (j,d,h_1,h_2) : j \in J, d \in D, (h_1, h_2) \in\mathrm{H}_{j,d} \}
$$


### Parámetros  
* $\mathrm{c}_{i,d}$ es un parámetro binario que indica si el equipo $i$-ésimo
  puede cubrir el deporte $d$ (es decir, indica la categoría).
* $\mathrm{Q}_d^t$ indica la calidad de transmisión por transmitir el deporte $d$.
  Tiene unidades de calidad.
* $\mathrm{Q}_d^f$ indica el aumento de calidad por evento final del deporte $d$,
  con las mismas unidades.
* $\mathrm{Q}_d^e$ indica el aumento de calidad por presencia de un especialista,
  con las mismas unidades.
* $\mathrm{e}_{i,d}$ es un parámetro binario que indica si el equipo $i$-ésimo
  tiene un especialista para el deporte $d$.
* $\mathrm{INT}_d$ es un parámetro adimensional que vale 1 si el deporte $d$ es
  intercalable o 2 si no.

### Variables

* $\mathrm{Y}_{j,d,h_1,h_2}$ es una variable binaria que indica si el evento del
  deporte $d$ en la jornada $j$ desde el horario $h_1$ al $h_2$ es cubierto o
  no.
* $\mathrm{Y}_{j,d,h_1,h_2,i}$ es una variable binaria que indica lo anterior,
  pero particularmente si es cubierto por el equipo $i$-ésimo.
* $\mathrm{E}_{i,s,j}$ es una variable binaria que indica si el equipo $i$-ésimo
  está presente en la sede $s$ en la jornada $j$.
* $\mathrm{T}_{j,d,h_1,h_2,k}$ es una variable binaria que indica que el evento del
  deporte $d$ en la jornada $j$ desde el horario $h_1$ al $h_2$ es transmitido por
  el canal $k$.


## Modelo

### Funcional   

$$
\mathrm{maximize}\ z =
    \sum_{\substack{(j, d, h_1, h_2) \in \mathrm{Ev} \\ {i \in \mathrm{Eq}}}}
    \mathrm{Y}_{j,d,h_1,h_2, i} \times (\mathrm{Q}_d^t + \mathrm{e}_{i,d} \mathrm{Q}_d^e )
    + \sum_{(j, d, h_1, h_2) \in \mathrm{F}}
    \mathrm{Y}_{j,d,h_1,h_2} \times \mathrm{Q}_d^f
$$

### Restricciones

Un evento no puede estar cubierto por más de un equipo:
$$
\forall (j, d, h_1, h_2) \in \mathrm{Ev}:\
\sum_{i\in \mathrm{Eq}}\mathrm{Y}_{j,d,h_1,h_2,i} \leq 1
$$

Aprovechando esto, podemos definir que un evento está cubierto si alguno de los
equipos lo cubre (como sabemos que son binarias y que suman 1, la exclusión
está asegurada).
$$
\forall (j, d, h_1, h_2) \in \mathrm{Ev}:\
\mathrm{Y}_{j,d,h_1,h_2} = \sum_{i\in \mathrm{Eq}}\mathrm{Y}_{j,d,h_1,h_2,i}
$$

Desde luego, un equipo no puede cubrir un deporte para el que no está
capacitado:

$$
\forall (j, d, h_1, h_2) \in \mathrm{Ev}, i\in \mathrm{Eq}:\
\mathrm{Y}_{j,d,h_1,h_2,i} \leq \mathrm{c}_{i,d}
$$

Utilizando el conjunto de eventos que se intersecan, podemos definir que un
equipo no puede cubrir más de un evento al mismo tiempo:  
$$
\forall j \in J, \mathrm{X}_j^{(z)} \in \mathrm{X}_j, i \in Eq:\
\sum_{(j, d, h_1, h_2) \in \mathrm{X}_j^{(z)}}
\mathrm{Y}_{j,d,h_1,h_2,i} \leq 1
$$

Definimos la variable de presencia del equipo $i$-ésimo durante la jornada $j$
en la sede $s$ (donde $n$ es la cantidad de eventos en esa sede):
$$
\forall s \in S, j \in J, i \in \mathrm{Eq}:\
\mathrm{E}_{i,s,j} \leq
\sum_{\substack{(d, h_1, h_2)\ \mathrm{tal\ que }\\(j, d, h_1, h_2)\mathrm{\ está\ en\ sede\ s}}}
\mathrm{Y}_{j,d,h_1,h_2,i} \leq n
\mathrm{E}_{i,s,j}
$$

Y usamos esta variable para limitar a que un equipo esté, a lo sumo, en una sede
durante un mismo día:  
$$
\forall j \in J, i \in \mathrm{Eq}:\
\sum_{s\in S} \mathrm{E}_{i,s,j} \leq 1
$$

Para los eventos que consideramos finales, definimos que sólo puede ser cubierta
si se cubrió algún evento previo:  
$$
\forall (j, d, h_1, h_2) \in \mathrm{F}:\
\mathrm{Y}_{j,d,h_1,h_2}
\leq
\sum_{\substack{j'\in J, (h_1', h_2')\in \mathrm{H}_{j,d}\\
    (j' <j ) \vee (j'=j \wedge h_2' \leq h_2)}}
\mathrm{Y}_{j',d,h_1',h_2'}
$$

Un equipo puede cubrir una final sólo si tiene un especialista:

$$
\forall (j, d, h_1, h_2) \in \mathrm{F}, i \in \mathrm{Eq}:\
\mathrm{Y}_{j,d,h_1,h_2,i}
\leq
\mathrm{e}_{i,d}
$$

Si un evento es cubierto, debe ser transmitido por exactamente uno de los dos canales:

$$
\forall (j, d, h_1, h_2) \in  \mathrm{Ev}:\
\mathrm{Y}_{j,d,h_1,h_2} = \mathrm{T}_{j,d,h_1,h_2,1} + \mathrm{T}_{j,d,h_1,h_2,2}
$$


Para cada intersección de horarios se pueden transmitir hasta 2 eventos intercalables
o 1 evento no intercalable (recordar que $\mathrm{INT}_d$ vale 1 si el evento es
intercalable o 2 si no):

$$
\forall j \in J, \mathrm{X}_j^{(z)} \in \mathrm{X}_j, k \in \{1,2\}:\
\sum_{(j, d, h_1, h_2) \in \mathrm{X}_j^{(z)}}
\mathrm{T}_{j,d,h_1,h_2,k} \times \mathrm{INT}_d
\leq 2
$$
