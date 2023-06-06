DROP DATABASE IF EXISTS dreamhousedb;

CREATE DATABASE dreamhousedb;
USE dreamhousedb;

-- * Creación de tablas * --
CREATE TABLE Sucursales(
    pk_id_suc INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    txt_dir_suc NVARCHAR(64) NOT NULL,
    num_tel_suc VARCHAR(10) NOT NULL
);

CREATE TABLE Directores(
    pk_id_dir INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    txt_nom_dir NVARCHAR(64) NOT NULL,
    txt_email_dir VARCHAR(256) NOT NULL,
    num_tel_dir VARCHAR(10) NOT NULL,
    fk_id_suc INT NOT NULL,
    FOREIGN KEY (fk_id_suc) REFERENCES Sucursales(pk_id_suc) ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE Supervisores(
    pk_id_sup INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    txt_nom_sup NVARCHAR(64) NOT NULL,
    txt_email_sup VARCHAR(256) NOT NULL,
    num_tel_sup VARCHAR(10) NOT NULL,
    fk_id_suc INT NOT NULL,
    FOREIGN KEY (fk_id_suc) REFERENCES Sucursales(pk_id_suc) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Clientes(
    pk_id_cli INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    txt_nom_cli NVARCHAR(64) NOT NULL,
    num_tel_cli VARCHAR(10) NOT NULL,
    txt_email_cli VARCHAR(256) NOT NULL
);

CREATE TABLE Propietarios(
    pk_id_prop INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    txt_nom_prop NVARCHAR(64) NOT NULL,
    txt_dir_prop NVARCHAR(64) NOT NULL,
    num_tel_prop VARCHAR(10) NOT NULL,
    txt_email_prop VARCHAR(256) NOT NULL,
    bool_ver_prop BOOLEAN NOT NULL DEFAULT 0
);

CREATE TABLE Propiedades(
    pk_id_propd INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    txt_ubi_propd NVARCHAR(64) NOT NULL,
    num_no_hab_propd INT(10) NOT NULL,
    txt_tam_propd VARCHAR(5) NOT NULL,
    num_prec_propd INT(8) NOT NULL,
    bool_disp_propd BOOLEAN NOT NULL DEFAULT 0,
    txt_comp_propd NVARCHAR(128) NOT NULL,
    fk_id_prop INT NOT NULL,
    FOREIGN KEY (fk_id_prop) REFERENCES Propietarios(pk_id_prop) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Contratos(
    pk_id_cont INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fk_id_cli INT NOT NULL,
    fk_id_propd INT NOT NULL,
    txt_cond_al_cont NVARCHAR(256) NOT NULL,
    fk_id_sup INT NOT NULL,
    txt_ini_cont VARCHAR(10) NOT NULL,
    txt_fin_cont VARCHAR(10) NOT NULL,
    txt_cond_com_cont NVARCHAR(256) NOT NULL,
    num_pag_cont INT(5) NOT NULL,
    bool_val_cont BOOLEAN NOT NULL DEFAULT 0,

    FOREIGN KEY (fk_id_cli) REFERENCES Clientes(pk_id_cli) ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (fk_id_propd) REFERENCES Propiedades(pk_id_propd) ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (fk_id_sup) REFERENCES Supervisores(pk_id_sup) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE Citas(
    pk_id_cit INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    txt_fecha_cit VARCHAR(10) NOT NULL,
    txt_hora_cit VARCHAR(5) NOT NULL,
    fk_id_propd INT NOT NULL,
    fk_id_cli INT NOT NULL,
    FOREIGN KEY (fk_id_propd) REFERENCES Propiedades(pk_id_propd) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_id_cli) REFERENCES Clientes(pk_id_cli) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Citas_de_Revision(
    pk_id_cit_rev INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    txt_fecha_cit_rev VARCHAR(10) NOT NULL,
    bool_rev_cit_rev BOOLEAN NOT NULL DEFAULT 0,
    txt_com_cit_rev NVARCHAR(128) NULL,
    fk_id_propd INT NOT NULL,
    fk_id_sup INT NOT NULL,
    FOREIGN KEY (fk_id_propd) REFERENCES Propiedades(pk_id_propd) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_id_sup) REFERENCES Supervisores(pk_id_sup) ON DELETE CASCADE ON UPDATE CASCADE
);

-- * Creación de datos * --
INSERT INTO Sucursales(txt_dir_suc, num_tel_suc) VALUES
('Viaducto Zacatecas,San Gabriela los altos,05960', '5951140476'),
('Pasaje Guillen,San Georgina los bajos,01804-7596', '5951140476'),
('Periférico Norte Perales,Nueva Malasia,18695-6135','5951140476');

INSERT INTO Directores(txt_nom_dir, txt_email_dir, num_tel_dir, fk_id_suc)
VALUES ("Marisol Nava Loya", "lelizondo@dreamhouse.com", '5951140476', 1),
('Dulce María Diana Garica', 'hernanpichardo@dreamhouse.com', '5951140476', 2),
('José María Leiva', 'cristianvalles@dreamhouse.com', '5951140476', 3);

INSERT INTO Supervisores(txt_nom_sup,txt_email_sup,num_tel_sup,fk_id_suc)
VALUES ('Isabela Héctor Adame', 'suarezanel@dreamhouse.com', '5951140476', 1),
('Adela Guajardo Velásquez', 'yavila@dreamhouse.com', '5951140476', 2),
('Benito Héctor Gaona Arevalo', 'ccasarez@dreamhouse.com', '5951140476', 3),
('Jos Wilfrido Camarillo Piña', 'rlozada@dreamhouse.com', '5951140476', 1),
('Lourdes Mota Pantoja', 'gregoriopichardo@dreamhouse.com', '5951140476', 2),
('Rosa Cornelio Feliciano Guillen', 'robertosolis@dreamhouse.com', '5951140476', 3);

INSERT INTO Clientes(txt_nom_cli,num_tel_cli,txt_email_cli) 
VALUES ('Gabino Laura Rascón Vaca', '5951140476','villaloboscornelio@garay.org'),
('Dalia Puente Solís', '5951140476','mariana85@jurado.com'),
('René José Emilio Haro Berríos', '5951140476','cynthiamena@camarillo.info'),
('Teodoro Cadena Vaca', '5951140476','umota@club.com'),
('Rafaél Joaquín Heredia Hurtado', '5951140476','vguardado@negron.com'),
('Ernesto Montemayor', '5951140476','angelicacalderon@gmail.com'),
('Agustín Camarillo', '5951140476','leonreynaldo@gmail.com'),
('Noelia Villegas Pérez', '5951140476','elsasalgado@almanza-renteria.com'),
('Darío Arevalo', '5951140476','nevarezmayte@rodriguez.com');

INSERT INTO Propietarios(txt_nom_prop,txt_dir_prop,num_tel_prop,txt_email_prop) VALUES
('Lucía Ramiro Jáquez', 'Callejón San Luis Potosí,Nueva Serbia,62681','5951140476','galveztania@pedroza.com'),
('Úrsula Fidel Gonzales Medina', 'Boulevard Piña,Nueva Italia,34335','5951140476','esperanzaquintero@molina-medrano.com'),
('Andrés Ilse Carmona Gutiérrez', 'Privada Sur de la Garza,Nueva Maldivas,34567-4063','5951140476','fcaban@paredes.com'),
('Leonardo Posada', 'Circunvalación Brito,San María José los bajos,82545','5951140476','escobedooliver@laboratorios.com'),
('Alejandro Garza Carmona', 'Peatonal Sur Sierra,Vieja Lesotho,65971','5951140476','florezrosario@gaytan.biz'),
('Noelia Treviño', 'Peatonal Norte Tapia,Vieja Mauricio,92539-3737','5951140476','lucas56@grupo.net');

INSERT INTO Propiedades(txt_ubi_propd,num_no_hab_propd,txt_tam_propd,num_prec_propd,txt_comp_propd,fk_id_prop)
VALUES ('Continuación Polonia,Vieja Suiza,91825',1,'20m2',16307989, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 1),
('Continuación Sinaloa,Nueva Eslovaquia,99036-2497',10,'32m2',94680228, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 2),
('Andador Sur Olivas,San Elena los altos,77962',6,'6m2',40645352, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 2),
('Continuación Quintana Roo,Nueva Yemen,09742',3,'14m2',83217665, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 3),
('Andador Tamaulipas,Nueva República Centroafricana,17329-4426',4,'16m2',90047288, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 4),
('Avenida Jordania,Nueva México,19354',2,'50m2',27984961, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 5);

UPDATE Propiedades SET bool_disp_propd=1 WHERE pk_id_propd=1;
UPDATE Propiedades SET bool_disp_propd=1 WHERE pk_id_propd=2;
UPDATE Propiedades SET bool_disp_propd=1 WHERE pk_id_propd=3;

INSERT INTO Contratos(fk_id_cli,fk_id_propd,txt_cond_al_cont,fk_id_sup,txt_ini_cont,txt_fin_cont,txt_cond_com_cont,num_pag_cont,bool_val_cont) VALUES
(1, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',1, '30/10/2022', '06/06/2023', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 9481, 1),
(2, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',3, '30/10/2022', '06/06/2023', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 1027, 0),
(3, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',1, '30/10/2022', '06/06/2023', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 6686, 1);

INSERT INTO Citas(txt_fecha_cit,txt_hora_cit,fk_id_propd,fk_id_cli) VALUES
('20/8/2022', '10:00', 1, 1),
('26/10/2022', '12:00', 2, 2),
('15/9/2022', '9:30', 3, 3);

INSERT INTO Citas_de_Revision(txt_fecha_cit_rev,bool_rev_cit_rev,txt_com_cit_rev,fk_id_propd,fk_id_sup) VALUES
('17/2/2022', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 1, 1),
('25/1/2022', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 2, 3),
('2/7/2022', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 3, 1),
('30/11/2022', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 4, 5),
('2/3/2023', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 5, 2),
('12/3/2023', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 6, 4);
