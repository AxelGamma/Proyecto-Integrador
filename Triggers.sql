select * "Log_Triggers";
--Trigger
create function triggerError() returns trigger
as
$$
begin
    --insert into docente values ();
end;
$$ language plpgsql;

create table historial_trigger(

);

select * from campus;

select * "Log_Triggers";
--Trigger
create function triggerError() returns trigger
as
$$
begin
    --insert into docente values ();
end;
$$ language plpgsql;

create table historial_trigger
(

);
--Creamos una tabla igual a la tabla docente, limit 0 indica que solo queremos la infrestructura mas no los datos
create table respaldo_docente as
select *
from docente
limit 0;
select *
from respaldo_docente;
--Video diferente de youtube
--Creando trigger
create or replace function fun_accion() returns trigger as
$$
BEGIN
    insert into respaldo_docente
    values (old.id_docente, old.id_edificio, old.nombre, old.apellidos, old.rfc, old.telefono, old.cedula_docente,
            old.puesto, old.email_institucional);
    return new;
end;
$$ language plpgsql;

--Definicion del trigger

create trigger update_docente
    before update
    on docente
    for each row
execute procedure fun_accion();

update docente set rfc='FAN43LS0LRMN' where nombre='Fausto Antonio';

select * from docente;
select * from docente order by id_docente;





