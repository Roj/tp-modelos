## Análisis

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

## Objetivo

Determinar si mandar un equipo periodístico (y en ese caso, cuál) a cada 
evento deportivo, de manera de maximizar la calidad de cobertura de los juegos
olímpicos, en el plazo de duración de los juegos.

## Hipótesis
### Generales  

* Los canales no tienen errores en ningún momento (por ejemplo, caída de la red
  satelital, problemas con las cámaras, etc).
* ningún evento deportivo requiere o puede tener
  más de un equipo periodístico. Esto es
  particularmente importante para deportes como ciclismo, triatlón y navegación
  a vela, que son deportes que requieren gran espacio.
* No es necesario planificar cómo se deberán intercalar los eventos.
* Los eventos se transmiten en su totalidad (sea o no intercalada) o no se
  transmiten. No se pueden subdividir los eventos en partes de un día de tal
  manera que se cambie de cobertura.   

### Sobre los eventos deportivos  

* No hay demoras de ningún tipo, ni cambios en las ubicaciones (p.ej. un evento
  no puede cambiarse cambiar de sede).
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
* Si algún evento deportivo es intercalable pero se muestra solo (p.ej., porque
  no hay otros eventos en ese momento), no cambia la calidad de transmisión por
  dedicarle más tiempo de cobertura.   

### Sobre los equipos periodísticos  

* Los periodistas especificados se mantienen hasta el final, ninguno se baja
  ninguno se suma. Esto implica que las especialidades y categorías que pueden
  cubrir no cambian.
* Un equipo, a priori, puede cubrir cualquier horario necesario. No hay
  restricciones por horario de almuerzo o similar.
* No importa el tamaño del equipo a la hora de cubrir un deporte, o bien la
  categorías que puede cubrir ya incluye estas restricciones. (Esta hipótesis
  está relacionada a la de un solo equipo por evento.)
