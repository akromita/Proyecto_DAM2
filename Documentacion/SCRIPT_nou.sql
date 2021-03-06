CREATE DATABASE POST_TICKET;
use POST_TICKET;

/*CREACIO DE TAULES*/

CREATE TABLE rols (
	id integer auto_increment not null,
    nom varchar (50) not null,
    primary key (id)
)engine=InnoDB;

CREATE TABLE usuaris (
	mail varchar (100) not null,
    nom varchar (50) not null,
    cognom varchar (50) not null,
	pwd varchar (20) not null,
    administrador boolean default false not null,
    primary key (mail)
)engine=InnoDB;

CREATE TABLE taulells (
	id integer auto_increment not null,
    nom varchar (50) not null,
    primary key(id)
)engine=InnoDB;

CREATE TABLE categories (
	id integer auto_increment not null,
    nom varchar (50) not null,
    id_taulells integer not null,
    CONSTRAINT FK_CATEGORIES_TAULELLS FOREIGN KEY (id_taulells) 
    REFERENCES taulells (id) 
		ON delete CASCADE
        ON update CASCADE,
	primary key (id)
)engine=InnoDB;

CREATE TABLE tasques (
	id integer auto_increment not null,
    titol varchar (50) not null,
    cos_missatge varchar (2000),
    id_categoria integer not null,
    estat integer,
    CONSTRAINT FK_TASQUES_CATEGORIES FOREIGN KEY (id_categoria)
    REFERENCES categories (id)
		ON delete CASCADE
        ON update CASCADE,
    primary key (id)
)engine=InnoDB;

CREATE TABLE taulell_usuaris (
	mail varchar (100) not null,
    id_taulell integer not null,
    
    CONSTRAINT FK_TAULELL_USUARIS FOREIGN KEY (mail)
    REFERENCES usuaris (mail)
		ON delete CASCADE
        ON update CASCADE,
	
    CONSTRAINT FK_USUARIS_TAULELL FOREIGN KEY (id_taulell)
    REFERENCES taulells (id)
		ON delete CASCADE
        ON update CASCADE,
    primary key(mail, id_taulell)
)engine=InnoDB;

CREATE TABLE rols_usuaris_taulells (
	mail varchar (100) not null,
    id_rol integer not null,
    id_taulell integer not null,
    
    CONSTRAINT FK_USUARIS_ROLS_TAULELLS FOREIGN KEY (mail)
    REFERENCES usuaris (mail)
		ON delete CASCADE
        ON update CASCADE,
	
    CONSTRAINT FK_ROLS_USUARIS_TAULELLS FOREIGN KEY (id_rol)
    REFERENCES rols (id)
		ON delete CASCADE
        ON update CASCADE,
	
    CONSTRAINT FK_TAULELLS_ROLS_USUARIS FOREIGN KEY (id_taulell)
    REFERENCES taulells (id)
		ON delete CASCADE
        ON update CASCADE,
	
    primary key (mail, id_rol, id_taulell)
)engine=InnoDB;

/* _______ nueva tabla ______ */
CREATE TABLE tasques_usuaris (

	id_tasca int,
    
	mail_usuari varchar(100),

    	primary key (id_tasca,mail_usuari),

    
    CONSTRAINT FK_TASQUESUSUARIS_TASQUES FOREIGN KEY (id_tasca)

		REFERENCES tasques (id)
			
			ON DELETE CASCADE
            
			ON UPDATE CASCADE,

	CONSTRAINT FK_TASQUESUSUARIS_USUARIS FOREIGN KEY (mail_usuari)

		REFERENCES usuaris (mail)

			ON DELETE CASCADE

            ON UPDATE CASCADE
		



) ENGINE=INNODB;

/* USUARI CREADOR DEL TAULELL */
alter table taulells add creador varchar(100) not null default '';

ALTER TABLE taulells ALTER creador DROP DEFAULT;
alter TABLE taulells add CONSTRAINT FK_TAULELLS_CREADOR
	FOREIGN KEY (creador)
 	references usuaris(mail)

	on update cascade

        on delete cascade;
alter table taulells add finalitzat boolean not null default false;

alter table tasques add asignat varchar(100);

alter TABLE tasques add CONSTRAINT FK_TASQUES_ASIGNAT

	FOREIGN KEY (asignat)

 	references usuaris(mail)


	on update cascade

	on delete set null;

alter table tasques add data_limit date;

/* INSERTS DE PROVA */

INSERT INTO rols (nom) VALUES ('developer');

INSERT INTO usuaris (mail, nom, cognom) VALUES ('A@A.COM', 'Alejandro', 'Garcia');
INSERT INTO usuaris (mail, nom, cognom, administrador) VALUES ('B@B.COM', 'Alejandro', 'Tonto', 1);

INSERT INTO taulells (nom) VALUES ('TAULELL_MOSTRA');
INSERT INTO taulells (nom) VALUES ('TAULELL_MOSTRA');

INSERT INTO rols_usuaris_taulells (mail, id_rol, id_taulell) VALUES ('A@A.COM', 1, 1);

INSERT INTO categories (nom, id_taulells) VALUES ('Pendent', 1);

INSERT INTO tasques (titol, cos_missatge, id_categoria) VALUES ('Primera tasca', NULL, 1);

/*aixo s'ha de cambiar a taulell_usuaris*/
INSERT INTO taulell_usuaris (id_taulell, mail) VALUES (1, 'A@A.COM');

UPDATE usuaris SET mail = 'test@.com' WHERE mail = 'A@A.COM';
/*DELETE FROM taulells WHERE id = 1;

