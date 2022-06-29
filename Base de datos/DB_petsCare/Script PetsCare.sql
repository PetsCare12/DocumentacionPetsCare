create schema petsCare;
use petsCare;

create table usuario(
documento char(20) primary key not null,
nombre varchar(100),
apellidos varchar(100),
telefono char(15),
correo varchar(150),
password varchar(250),
rol char(3)
);

create table mascota(
codigo int primary key auto_increment,
documento char(20),
nombre varchar(80),
raza varchar(50),
color  char(20),
peso float,
discapacidad varchar(100),
tipoAnimal varchar(50)
);

create table veterinario(
documento char(20) primary key not null,
nombre varchar(100),
apellidos varchar(100),
telefono char(15),
correo varchar(150),
especialidad char(30),
password varchar(250)
);

create table clinica_veterinaria(
nit char(50) primary key not null,
nombre varchar(80),
lugar varchar(150),
horario_atencion date,
rol char(3),
veterinarios char(20)
);

create table agenda(
codigo int primary key auto_increment not null,
documento char(20),
mascota int,
fecha date,
hora time,
veterinario char(20),
observaciones text,
historia_clinica int
);

create table historia_clinica(
cod int primary key auto_increment not null,
mascota int,
fecha datetime,
veterinario char(20),
motivo_consulta text
);

/* Foreign keys */

/* AGENDA */
alter table agenda add foreign key FK_agenda_usuario (documento) references usuario(documento);
alter table agenda add foreign key FK_agenda_mascota (mascota) references mascota(codigo);
alter table agenda add foreign key FK_agenda_veterinario (veterinario) references veterinario(documento);
alter table agenda add foreign key FK_agenda_historiaClinica (historia_clinica) references historia_clinica(cod);

/* CLINICA_VETERINARIA */
alter table clinica_veterinaria add foreign key FK_clinicaVeterinaria_veterinarios (veterinarios) references veterinario(documento);

/* MASCOTA */
alter table mascota add foreign key FK_mascota_usuario (documento) references usuario(documento);

/* HISTORIA_CLINICA */
alter table historia_clinica add foreign key FK_historiaClinica_mascota (mascota) references mascota(codigo);
alter table historia_clinica add foreign key FK_historiaClinica_veterinario (veterinario) references veterinario(documento);



