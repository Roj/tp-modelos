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

*completar con limpieza de los datos cuando esté, comentar sobre no necesidad
de modelar toda la cosa si separando por sede y día en realidad hay poco*

### Separación de cobertura de eventos y transmisión

*completar cuando el modelo esté más avanzado*
 
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
* De la misma forma, si un deporte tiene una final sin eventos previos, la
  restricción anterior se ve anulada. (En el *schedule* tomada de ejemplo el
  primer evento del triatlón se marca como final.)
* Si algún evento deportivo es intercalable pero se muestra solo (p.ej., porque
  no hay otros eventos en ese momento), no cambia la calidad de transmisión por
  dedicarle más tiempo de cobertura.

### Sobre los equipos periodísticos  

* Los periodistas especificados se mantienen hasta el final, ninguno se baja y
  ninguno se suma. Esto implica que las especialidades y categorías que pueden
  cubrir no cambian.
* Un equipo, a priori, puede cubrir cualquier horario necesario. No hay
  restricciones por horario de almuerzo o similar.
* No importa el tamaño del equipo a la hora de cubrir un deporte, o bien la
  categorías que puede cubrir ya incluyen estas restricciones. (Esta hipótesis
  está relacionada a la de un solo equipo por evento.)
