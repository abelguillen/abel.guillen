----EJERCICIOS
-- SOLO ES REQUERIDO REALIZAR LOS EJERCICIOS DE COMPLEJIDAD BAJA, realizar los demas ejercicios serán puntos extras para la evaluación del examen.


--- EJERCICIO 1 - COMPLEJIDAD BAJA: 
--Realizar una consulta para consultar todos los alumnos existentes, mostrar: TipoDoc, Documento, Nombre, Apellido, Legajo.

select p.tipodoc as TipoDoc, p.documento as Documento, p.nombre as Nombre, p.apellido as Apellido, a.legajo as Legajo 
from persona p, alumno a
where p.identificador = a.idpersona;

--- EJERCICIO 2 - COMPLEJIDAD BAJA: 
--Realizar una consulta para consultar todas las carreras a la que un alumno esta inscripto, mostrar: Legajo, nombre, apellido, nombre carrera, fechainscripcioncarrera
--ordenado por legajo descendiente

select a.legajo, p.nombre, p.apellido, c.nombre as nombre_carrera, ic.fechainscripcion
from inscripciones_carrera ic, alumno a, persona p, carrera c
where ic.idalumno = a.identificador
and a.idpersona = p.identificador
and ic.idcarrera = c.identificador;

--- EJERCICIO 3 - COMPLEJIDAD MEDIA: 
--Realizar una consulta para consultar la cantidad de inscriptos por curso, mostrando: nombre carrera, nombre curso, cantidad inscriptos, cupo máximo por curso

select ca.nombre, cu.nombre, count(1) cantidad_inscriptos, cu.cupomaximo
from carrera ca, curso cu, inscripciones_curso ic
where ic.idcurso = cu.identificador
and cu.idcarrera = ca.identificador
group by cu.identificador, cu.nombre, ca.nombre, cu.cupomaximo;

--- EJERCICIO 4 - COMPLEJIDAD ALTA: 
--Sobre la consulta anterior (copiar y pegarla y modificarla) modificar la sql para que la consulta retorne solo los cursos cuya cantidad de inscripciones 
--supera su cupo maximo

select ca.nombre nombre_carrera, cu.nombre nombre_curso, count(1) cantidad_inscriptos, cu.cupomaximo cupo_maximo
from carrera ca, curso cu, inscripciones_curso ic
where ic.idcurso = cu.identificador
and cu.idcarrera = ca.identificador
group by cu.identificador, cu.nombre, ca.nombre, cu.cupomaximo
having count(1) > cu.cupomaximo;

--- EJERCICIO 5 -  COMPLEJIDAD BAJA: 
-- actualizar todos las cursos que posean anio 2018 y cuyo cupo sea menor a 5, y actualizar el cupo de todos ellos a 10.

update curso c
set c.cupomaximo = 10
where c.anio = 2018
and c.cupomaximo < 5;

--- EJERCICIO 6 -  COMPLEJIDAD ALTA: 
-- actualizar todas las fechas de inscripcion a cursados que posean el siguiente error: la fecha de inscripcion al cursado de un 
-- alumno es menor a la fecha de inscripcion a la carrera. La nueva fecha que debe tener es la fecha del dia. Se puede hacer en dos pasos, primero
-- realizando la consulta y luego realizando el update manual

update inscripciones_curso ic, curso cu, carrera ca, inscripciones_carrera ica
set ic.fechainscripcion = NOW() 
where 
ic.idcurso = cu.identificador
and cu.idcarrera = ca.identificador
and ic.idalumno = ica.idalumno 
and ca.identificador = ica.idcarrera
and ic.fechainscripcion < ica.fechainscripcion;

--- EJERCICIO 7 - COMPLEJIDAD BAJA:  
--INSERTAR un nuevo registro de alumno con tus datos personales, (hacer todos inserts que considera necesario)

INSERT INTO `persona` (`identificador`, `tipodoc`, `documento`, `nombre`, `apellido`, `fechanac`) VALUES (6, 'DNI', 382159927, 'Abel Alejandro', 'Guillen', '1994-06-06');
INSERT INTO `alumno` (`identificador`, `idpersona`, `legajo`) VALUES (6, 6, 17530);


--- EJERCICIO 8 -  COMPLEJIDAD BAJA: 
-- si se desea comenzar a persistir de ahora en mas el dato de direccion de un alumno y considerando que este es un único cambio string de 200 caracteres.
-- Determine sobre que tabla seria mas conveniente persistir esta información y realizar la modificación de estructuras correspondientes.

-- Es conveniente persistir esta información en la tabla persona.
ALTER TABLE persona
ADD direccion varchar(200);