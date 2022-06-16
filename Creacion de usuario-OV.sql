create database orientacionvirtual;

--hola--

create table campus
(
    id_campus      serial       not null,
    nombre         varchar(50)  not null,
    direccion      varchar(250) not null,
    PRIMARY KEY (id_campus)
);

create table actividades
(
    id_actividad bigserial not null,
    id_campus    serial    not null,
    nombre       text      not null,
    fecha_inicio date      not null,
    fecha_cierre date      not null,
    descripcion  text      not null,

    PRIMARY KEY (id_actividad),
    CONSTRAINT fk_campus FOREIGN KEY (id_campus)
        REFERENCES campus (id_campus)
);

create table responsable
(
    id_responsable    serial      not null,
    id_actividad      bigserial   not null,
    Responsable_activ varchar(50) not null,
    PRIMARY KEY (id_responsable),
    CONSTRAINT fk_actividades FOREIGN KEY (id_actividad)
        REFERENCES actividades (id_actividad)
);



create table servicio
(
    id_servicio bigserial   not null,
    id_campus   serial      not null,
    nombre      varchar(50) not null,
    descripcion text        not null,
    PRIMARY KEY (id_servicio),
    CONSTRAINT fk_campus FOREIGN KEY (id_campus)
        REFERENCES campus (id_campus)

);

create table espacio_academico
(
    id_espacio serial      not null,
    espacio    varchar(50) not null,
    no_salon   integer     not null,
    primary key (id_espacio)
);

create table edificio
(
    id_edificio serial      not null,
    id_campus   serial      not null,
    nombre      varchar(50) not null,
    descripcion text        not null,
    estado_edif varchar(20) not null,
    letra_edif  varchar(10) not null,
    tipo_edif   varchar(50) not null,
    id_espacio  serial,
    primary key (id_edificio),

    CONSTRAINT fk_campus FOREIGN KEY (id_campus)
        REFERENCES campus (id_campus),

    CONSTRAINT fk_espacio FOREIGN KEY (id_espacio)
        REFERENCES espacio_academico (id_espacio)
);

create table docente
(
    id_docente          serial      not null,
    id_edificio         serial      not null,
    nombre              varchar(50) not null,
    apellidos           varchar(50) not null,
    rfc                 varchar(13) not null,
    telefono            int         not null,
    cadula_docente      varchar(15) not null,
    puesto              varchar(50) not null,
    email_institucional varchar(50) not null,
    primary key (id_docente),

    CONSTRAINT fk_edificio FOREIGN KEY (id_edificio)
        REFERENCES edificio (id_edificio)

);


--Insert


insert into campus(id_campus, nombre, direccion)
values (default,
        'Campus I',
        'Av. Primero de Mayo 1610, Los Mangos, 89460 Cd Madero, Tamps.');

insert into campus(id_campus, nombre, direccion)
values (default,
        'Campus II',
        'Juventino Rosas, Los Mangos, 89440 Cd Madero, Tamps.');

insert into espacio_academico(id_espacio,
                              espacio, no_salon)
values (default,
        'Salon', 12);

select *
from espacio_academico;


insert into edificio(id_edificio,
                     id_campus,
                     nombre,
                     descripcion,
                     estado_edif,
                     letra_edif,
                     tipo_edif, id_espacio)
values (default,
        1,
        'Unidad Academica Departamental',
        'Salones donde se imparten clases de a los estudiante de ing.sistemas computacionales
        y donde se encuentra el gefe de departamento de sistemas',
        'Activo',
        'FF',
        'Espacio Academico', 1);

insert into edificio(id_edificio,
                     id_campus,
                     nombre,
                     descripcion,
                     estado_edif,
                     letra_edif,
                     tipo_edif,
                     id_espacio)
values (default,
        2,
        'Aulas',
        'Salones donde los estudiantes imparten clases',
        'Activo',
        'F',
        'Espacio Academico',
        1);

insert into edificio(id_edificio,
                     id_campus,
                     nombre,
                     descripcion,
                     estado_edif,
                     letra_edif,
                     tipo_edif,
                     id_espacio)
values (default,
        2,
        'Aulas',
        'Salones donde se imparten clases de a los estudiante de ing.sistemas computacionales
        y donde se encuentra el gefe de departamento de sistemas',
        'Activo',
        'FF',
        'Espacio Academico',
        1);

--Consultas

select *
from edificio;


select*
from espacio_academico;


select *
from campus;

select *
from actividades;

select *
from docente;

select *
from responsable;

select *
from servicio;

--Creacion de los usuarios

--Usuarios que por el momento no tienen ningun permiso, solo se estan creando
create user Usuario_de_Aplicacion with password 'Usuarioaplicacion';

create user Usuario_Administrativo_Interfaz with password 'UsuarioAI';

create user Administrador_DB with password 'AdministradorDB' ;


grant select on actividades,campus,docente,edificio,espacio_academico,responsable,servicio to usuario_de_aplicacion;


grant all on database orientacionvirtual to usuario_administrativo_interfaz;
alter user Usuario_Administrativo_Interfaz with superuser;



grant all on database orientacionvirtual to administrador_db;
alter user Administrador_DB with superuser;



--Pare revocar permisos o privilegios a usuario usamos el siguiente comando
--revoke= revocar , grant option for all tables in schema = osea los permisos para todas las tablas
-- , for= para que usuario
revoke grant option for all on all tables in schema public from usuario_administrativo_interfaz;

revoke all on all tables in schema public from usuario_administrativo_interfaz;

drop user Usuario_Administrativo_Interfaz;














