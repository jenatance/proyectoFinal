SET foreign_key_checks = 0;
	
    
	INSERT INTO categorias (nombre)
	SELECT nombre
	FROM categoriascopy ;
    
    SELECT * from categorias;
    DROP TABLE categoriascopy;
    
    
	INSERT INTO categoriaseventos (idEvento,idCategoria)
	SELECT idEvento,idCategoria
	FROM categoriaseventoscopy ;
    
    SELECT * from categoriaseventos;
    DROP TABLE categoriaseventoscopy;
    
       
	INSERT INTO categoriaspropuestas (idPropuesta,idCategoria)
	SELECT idPropuesta,idCategoria
	FROM categoriaspropuestascopy ;
    
    SELECT * from categoriaspropuestas;
    DROP TABLE categoriaspropuestascopy;
    
        
	INSERT INTO eventos (nombre,descripcion,fechaEvento,idCreador)
	SELECT nombre,descripcion,fechaEvento,idCreador
	FROM eventoscopy ;
    
    SELECT * from eventos;
    DROP TABLE eventoscopy;
    
       
	INSERT INTO participanteseventos (idUsuario,idEvento)
	SELECT idUsuario,idEvento
	FROM participanteseventoscopy ;
    
    SELECT * from participanteseventos;
    DROP TABLE participanteseventoscopy;
    
        
	INSERT INTO participantespropuestas (idUsuario,idPropuesta)
	SELECT idUsuario,idPropuesta
	FROM  participantespropuestascopy;
    
    SELECT * from participantespropuestas;
    DROP TABLE participantespropuestascopy;
    
        
	INSERT INTO propuestas (nombre,descripcion,idCreador)
	SELECT nombre,descripcion,idCreador
	FROM propuestascopy ;
    
    SELECT * from propuestas;
    DROP TABLE propuestascopy;
    
        
	INSERT INTO universidades (nombre,sede,comunidadAutonoma,fundacion,tipo)
	SELECT nombre,sede,comunidadAutonoma,fundacion,tipo
	FROM universidadescopy ;
    
    SELECT * from universidades;
    DROP TABLE universidadescopy;
    
        
	INSERT INTO usuarios (nombre,username,idUniversidad,facultad,curso,clase,edad)
	SELECT nombre,username,idUniversidad,facultad,curso,clase,edad
	FROM usuarioscopy ;
    
    SELECT * from usuarios;
    DROP TABLE usuarioscopy;
    
    
SET foreign_key_checks = 1;
    