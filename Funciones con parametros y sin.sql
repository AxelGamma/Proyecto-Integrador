select *
from docente;

create or replace function jefes_departamentos() returns table( nombre varchar,  apellidos varchar,  telefono varchar,
                                              puesto varchar)   as
$$
select docente.nombre, docente.apellidos, docente.telefono, docente.puesto
from docente
where docente.puesto like 'Jefe de departamento%';
$$
    language sql;


select * from jefes_departamentos();

drop function jefes_departamentos();

