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

--Otro ejemplos
create or replace function fun_rfc()
    returns trigger as
$$
BEGIN
    --Old es una variable que va tener una informacion antigua de la tabla
    --New es la variable que va contener la nueva fila de la tabla como insert o como updates
    if length(new.rfc) > 13 or new.rfc is null or length(new.rfc) < 13 then
        raise exception 'El rfc tiene que contener 13 digitos.';
    end if;

    --Si insertamos un valor nullo nos va impedir ingresar ese dato
    if (new.id_edificio) is null then
        raise exception 'No se aceptan nulos';
    end if;
    if (new.nombre) ='' then
        raise exception 'No se aceptan nulos o espacios en blanco';
    end if;
    if( new.apellidos) ='' then
        raise exception 'No se aceptan nulos o espacios en blanco';
    end if;
    if (new.rfc) ='' then
        raise exception 'No se aceptan nulos o espacios en blanco';
    end if;
    if (new.telefono) is null then
        raise exception 'No se aceptan nulos ';
    end if;
    if (new.cedula_docente) ='' then
        raise exception 'No se aceptan nulos o espacios en blanco';
    end if;
    if (new.puesto)=''  then
        raise exception 'No se aceptan nulos';
    end if;
    if (new.email_institucional) ='' then
        raise exception 'No se aceptan nulos';
    end if;
    return new;
end;
$$ language plpgsql;

--Creacion de trigger
create trigger error_nulos
    before insert or update
    on docente
    for each row
execute function fun_rfc();

drop trigger IF EXISTS error_nulos on docente;

insert into docente
values (default, 2, 'Alberto Isacc', 'Guzman Meza', '1234567890123', 833294032, 'LKSIO345SL',
        '', 'quimica@cdmadero.tecnm.com');


select *
from docente;

CREATE or replace FUNCTION suma(x integer, y integer) RETURNS integer AS
$$
begin
     return x + y ;
end;
$$ LANGUAGE plpgsql;


SELECT suma(23231, 623);








