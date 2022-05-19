create database orientacionvirtual;

create table universidad
(
    id_universidad bigserial   not null,
    nombre         varchar(50) not null,
    direccion      varchar(50) not null,
    tel            bigint      not null,
    PRIMARY KEY (id_universidad)
);


create table campus
(
    id_campus      serial      not null,
    nombre         varchar(50) not null,
    direccion      varchar(50) not null,
    id_universidad bigserial   not null,
    PRIMARY KEY (id_campus),
    CONSTRAINT fk_universidad FOREIGN KEY (id_universidad)
        REFERENCES universidad (id_universidad)
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

create table espacio_academico
(
    id_espacio serial      not null,
    espacio    varchar(50) not null,
    no_salon   integer     not null,
    primary key (id_espacio)
);


alter table espacio_academico
    alter column no_salon set not null;

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

insert into universidad(id_universidad, nombre, direccion, tel)
values (DEFAULT,
        'Instituto Tecnologico de Ciudad Madero',
        'Av. Primero de Mayo 1610, Los Mangos, 89460 Cd Madero, Tamps.',
        8333574820);

insert into campus(id_campus, nombre, direccion)
values (default,
        'Campus I',
        'Av. Primero de Mayo 1610, Los Mangos, 89460 Cd Madero, Tamps.',
        1);

insert into campus(id_campus, nombre, direccion, id_universidad)
values (default,
        'Campus II',
        'Juventino Rosas, Los Mangos, 89440 Cd Madero, Tamps.',
        1);

insert into edificio(id_edificio,
                     id_campus,
                     nombre,
                     descripcion,
                     estado_edif,
                     letra_edif,
                     tipo_edif)
values (default,
        1,
        'Unidad Academica Departamental',
        'Salones donde se imparten clases de a los estudiante de ing.sistemas computacionales
        y donde se encuentra el gefe de departamento de sistemas',
        'Activo',
        'FF',
        'Espacio Academico');

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



insert into espacio_academico(id_espacio,
                              espacio)
values (default,
        'Salon');



select *
from edificio;
select*
from espacio_academico;
select *
from universidad;
select *
from campus;

update campus
set id_campus=2
where id_campus = 5;
update edificio
set id_edificio=2
where id_edificio = 3;

alter table universidad alter direccion type varchar(250);
alter table campus alter direccion type varchar(250);