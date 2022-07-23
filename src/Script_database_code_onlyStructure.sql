DROP DATABASE IF EXISTS fackulty;
CREATE DATABASE fackulty;
USE fackulty;

CREATE TABLE Usuarios (
	idUsuario integer not null auto_increment,
	nombre varchar(100) not null,
	username varchar(50) not null, 
	idUniversidad integer not null,
	facultad varchar(50) not null,
	curso tinyint not null,
	clase char(1) not null,
	edad tinyint null,
	PRIMARY KEY (idUsuario)
);

CREATE TABLE Universidades (
	idUniversidad integer not null auto_increment,
    nombre varchar(100) not null,
    sede varchar(50) not null,
    comunidadAutonoma varchar(50) not null,
    fundacion smallint not null,
    tipo varchar(20) CHECK (tipo IN ('Pública', 'Privada')),
	PRIMARY KEY (idUniversidad)
);

CREATE TABLE Propuestas (
	idPropuesta integer not null auto_increment,
    nombre varchar(200) not null,
    descripcion text null,
    fechaCreacion datetime default current_timestamp,
    idCreador integer not null,
	PRIMARY KEY (idPropuesta)
);

CREATE TABLE Eventos (
	idEvento integer not null auto_increment,
    nombre varchar(200) not null,
    descripcion text null,
    fechaEvento date not null,
    fechaCreacion datetime default current_timestamp,
    idCreador integer not null,
	PRIMARY KEY (idEvento)
);

CREATE TABLE Categorias (
	idCategoria integer not null auto_increment,
    nombre varchar(50) not null,
	PRIMARY KEY (idCategoria)
);

CREATE TABLE CategoriasPropuestas (
	idPropuesta integer not null,
    idCategoria integer not null,
	PRIMARY KEY (idPropuesta, idCategoria)
);

CREATE TABLE CategoriasEventos (
	idEvento integer not null,
    idCategoria integer not null,
	PRIMARY KEY (idEvento, idCategoria)
);

CREATE TABLE ParticipantesPropuestas (
	idUsuario integer not null,
    idPropuesta integer not null,
	PRIMARY KEY (idUsuario, idPropuesta)
);

CREATE TABLE ParticipantesEventos (
	idUsuario integer not null,
    idEvento integer not null,
	PRIMARY KEY (idUsuario, idEvento)
);

CREATE TABLE ComentariosPropuestas (
	idComentarioPropuesta integer not null auto_increment,
    idPropuesta integer not null,
    idUsuario integer not null,
    comentario text not null,
    fecha datetime default current_timestamp,
    numLikes smallint null,
	PRIMARY KEY (idComentarioPropuesta)
);

CREATE TABLE ComentariosEventos (
	idComentarioEvento integer not null auto_increment,
    idEvento integer not null,
    idUsuario integer not null,
    comentario text not null,
    fecha datetime default current_timestamp,
    numLikes smallint null,
	PRIMARY KEY (idComentarioEvento)
);


ALTER TABLE Usuarios ADD FOREIGN KEY (idUniversidad) REFERENCES Universidades(idUniversidad) ON DELETE RESTRICT;

ALTER TABLE Propuestas ADD FOREIGN KEY (idCreador) REFERENCES Usuarios(idUsuario) ON DELETE RESTRICT;

ALTER TABLE Eventos ADD FOREIGN KEY (idCreador) REFERENCES Usuarios(idUsuario) ON DELETE RESTRICT;

ALTER TABLE CategoriasPropuestas ADD FOREIGN KEY (idPropuesta) REFERENCES Propuestas(idPropuesta) ON DELETE RESTRICT;
ALTER TABLE CategoriasPropuestas ADD FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategoria) ON DELETE RESTRICT;

ALTER TABLE CategoriasEventos ADD FOREIGN KEY (idEvento) REFERENCES Eventos(idEvento) ON DELETE RESTRICT;
ALTER TABLE CategoriasEventos ADD FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategoria) ON DELETE RESTRICT;

ALTER TABLE ParticipantesPropuestas ADD FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario) ON DELETE RESTRICT;
ALTER TABLE ParticipantesPropuestas ADD FOREIGN KEY (idPropuesta) REFERENCES Propuestas(idPropuesta) ON DELETE RESTRICT;

ALTER TABLE ParticipantesEventos ADD FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario) ON DELETE RESTRICT;
ALTER TABLE ParticipantesEventos ADD FOREIGN KEY (idEvento) REFERENCES Eventos(idEvento) ON DELETE RESTRICT;

ALTER TABLE ComentariosPropuestas ADD FOREIGN KEY (idPropuesta) REFERENCES ParticipantesPropuestas(idPropuesta) ON DELETE RESTRICT;
ALTER TABLE ComentariosPropuestas ADD FOREIGN KEY (idUsuario) REFERENCES ParticipantesPropuestas(idUsuario) ON DELETE RESTRICT;

ALTER TABLE ComentariosEventos ADD FOREIGN KEY (idEvento) REFERENCES ParticipantesEventos(idEvento) ON DELETE RESTRICT;
ALTER TABLE ComentariosEventos ADD FOREIGN KEY (idUsuario) REFERENCES ParticipantesEventos(idUsuario) ON DELETE RESTRICT;