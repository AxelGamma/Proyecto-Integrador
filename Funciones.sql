--Ejemplo de sintaxis funcion en postgresql
CREATE FUNCTION clean_emp() RETURNS void AS
' DELETE
  FROM emp
  WHERE salary < 0;
' LANGUAGE SQL;
SELECT clean_emp();

--Se recomienda usar los dobles signos de dolar $$  $$
--Procedimiento en postgresql
CREATE PROCEDURE clean_emp() AS
' DELETE
  FROM emp
  WHERE salary < 0;
' LANGUAGE SQL;
CALL clean_emp();


--Video de youtube
--Funcion con retorno de dato
create or replace function suma(num1 int, num2 integer)
    returns integer as
'
    select num1 + num2;
'Language SQL;

select suma(2, 3);

--Funcion sin retorno
create function Insertardatos()
    returns void as
''
    LANGUAGE SQL;

--Ejemplo de funciones sin parametros

CREATE FUNCTION one() RETURNS integer AS
$$
SELECT 1 AS result;
$$ LANGUAGE SQL;
-- Alternative syntax for string literal:

CREATE FUNCTION one() RETURNS integer AS
' SELECT 1 AS result; ' LANGUAGE SQL;
SELECT one();

CREATE FUNCTION add_em(x integer, y integer) RETURNS integer AS
$$
SELECT x + y;
$$ LANGUAGE SQL;
SELECT add_em(23231, 623) AS answer;

drop function add_em;

CREATE FUNCTION add_em(integer, integer) RETURNS integer AS
$$
SELECT $1 + $2;
$$ LANGUAGE SQL;
SELECT add_em(9, 2) AS answer;

--Ejemplo para un banco
CREATE FUNCTION tf1(accountno integer, debit numeric) RETURNS numeric AS
$$
UPDATE bank
SET balance = balance - debit
WHERE accountno = tf1.accountno;
SELECT 1;
$$ LANGUAGE SQL;

CREATE FUNCTION new_emp() RETURNS emp AS
$$
SELECT ROW ('None', 1000.0, 25, '(2,2)')::emp;
$$ LANGUAGE SQL;

CREATE FUNCTION one() RETURNS integer AS
' SELECT 1 AS result; ' LANGUAGE SQL;
SELECT one();

CREATE FUNCTION add_em(x integer, y integer) RETURNS integer AS
$$
SELECT x + y;
$$ LANGUAGE SQL;
SELECT add_em(23231, 623) AS answer;

drop function add_em;

CREATE FUNCTION add_em(integer, integer) RETURNS integer AS
$$
SELECT $1 + $2;
$$ LANGUAGE SQL;
SELECT add_em(9, 2) AS answer;

select *
from docente;


--Funcion que devuelve varias columnas

CREATE FUNCTION sum_n_product(x int, y int, OUT sum int, OUT product int)
AS
'SELECT x + y,
    x * y'
    LANGUAGE SQL;

--Funcion para buscar informacion de algun maestro
select *
from docente;

create or replace function buscar_docente(nombreDocente varchar, out nombre varchar, out apellidos varchar,
                                          out puesto varchar, out correo varchar) as
$$
select docente.nombre, docente.apellidos, docente.puesto, email_institucional
from docente
where docente.nombre = nombreDocente;
$$ language sql;



drop function buscar_docente;

--Otra forma de hacerlo
CREATE or replace FUNCTION getfoo(nombreDocente varchar) RETURNS docente AS
$$
SELECT *
FROM docente
WHERE nombre = nombreDocente;
$$ LANGUAGE SQL;

SELECT *
FROM getfoo('Fausto Antonio');



create or replace function insertar_Docente(edificioD int, nombreD varchar, apellidosD varchar, rfcD varchar,
                                            telefonoD int, cedulaD varchar, puestoD varchar,
                                            emailD varchar) returns void as
$$

insert into docente (id_docente, id_edificio, nombre, apellidos, rfc, telefono, cedula_docente, puesto,
                     email_institucional)
VALUES (default, edificioD, nombreD, apellidosD, rfcD, telefonoD, cedulaD, puestoD, emailD);

$$ language sql;

select insertar_Docente(3, 'Juan Jesus', 'Angel Cabrera', 'xxxxxxx', 93449432, '40345dalds', 'Jefe de mecanica',
                        'mecanica@cdmadero.tecnm.mx');



select *
from docente;


--Inserte solo el id_docente, id_edificio, nombre, apellidos, rfc, telefono, cedula_docente, puesto,email_institucional
select insertar_Docente(3, 'Juan Jesus', 'Angel Cabrera', 'xxxxxxx', 93449432, '40345dalds', 'Jefe de mecanica',
                        'mecanica@cdmadero.tecnm.mx');