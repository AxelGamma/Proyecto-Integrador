--Funcion sin parametros
Create or replace function Bienvenida()
    returns varchar as
$$
begin
    return 'Bienvenido al sistema de orientacion virtual';
end;
$$ LANGUAGE plpgsql;

select Bienvenida();



--Word
create or replace function nombre_ID(id int)
    returns varchar as
$$
select nombre
from docente
where id_docente = id;
$$ language sql;

select *
from edificio
order by id_edificio;

update edificio
set estado_edif='Reparando'
where id_edificio = 2;

--Creando edificio

create function insertar_edificio(idCampus int, nombreEdi varchar, descrip varchar, estado varchar, letraEdifi varchar,
                                  tipoEdif varchar, espacioAcademico int)
    returns void as
$$
begin
    insert into edificio values (default, idCampus, nombreEdi, descrip, estado, letraEdifi, tipoEdif, espacioAcademico);
end;
$$ language plpgsql;


select insertar_edificio(1, 'DEPTOS. DESA. ACADM. Y C. ECO-ADM',
                         'Tenemos los departamentos de Academicos,Eco-ADM y DESA', 'Activo',
                         'G', 'Departamentos', 1);

select *
from edificio;

--Sin parametros


create or replace function laboratorios()
    returns table
            (
                NumEdif         int,
                NumCampus       int,
                NombreEdif      varchar,
                DescripcionEdif text,
                EstadoEdif      varchar,
                LetraEdif       varchar,
                TipoEdif        varchar,
                IdEspacio       int
            )
as
$$
    begin
        return query select * from edificio where nombre like 'LAB.%';
    end;
$$
    language plpgsql;

select *
from laboratorios();

select *
from edificio;




















