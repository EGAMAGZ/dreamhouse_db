DROP DATABASE IF EXISTS dreamhouse;

CREATE DATABASE dreamhouse;
USE dreamhouse;

CREATE TABLE Sucursales(
    pk_id_suc VARCHAR(5) PRIMARY KEY NOT NULL,
    txt_dir_suc NVARCHAR(64) NOT NULL,
    num_tel_suc VARCHAR(10) NOT NULL
);

CREATE TABLE Directores(
    pk_id_dir VARCHAR(6) PRIMARY KEY NOT NULL,
    txt_nom_dir NVARCHAR(64) NOT NULL,
    txt_email_dir VARCHAR(256) NOT NULL,
    num_tel_dir INT(10) NOT NULL,
    fk_id_suc VARCHAR(5) NOT NULL,
    FOREIGN KEY (fk_id_suc) REFERENCES Sucursales(pk_id_suc)
);

CREATE TABLE Supervisores(
    pk_id_sup VARCHAR(6) PRIMARY KEY NOT NULL,
    txt_nom_sup NVARCHAR(64) NOT NULL,
    txt_email_sup VARCHAR(256) NOT NULL,
    num_tel_sup INT(10) NOT NULL,
    fk_id_suc VARCHAR(5) NOT NULL,
    FOREIGN KEY (fk_id_suc) REFERENCES Sucursales(pk_id_suc)
);

CREATE TABLE Clientes(
    pk_id_cli INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    txt_nom_cli NVARCHAR(64) NOT NULL,
    num_tel_cli INT(10) NOT NULL,
    txt_email_cli VARCHAR(256) NOT NULL
);

CREATE TABLE Propietarios(
    pk_id_prop INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    txt_nom_prop NVARCHAR(64) NOT NULL,
    txt_dir_prop NVARCHAR(64) NOT NULL,
    num_tel_prop INT(10) NOT NULL,
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
    FOREIGN KEY (fk_id_prop) REFERENCES Propietarios(pk_id_prop)
);

-- FINISH
CREATE TABLE Contratos(
    pk_id_cont INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fk_id_cli INT NOT NULL,
    fk_id_propd INT NOT NULL,
    txt_cond_al_cont NVARCHAR(256) NOT NULL,
    fk_id_sup VARCHAR(6) NOT NULL,
    txt_ini_cont VARCHAR(10) NOT NULL,
    txt_fin_cont VARCHAR(10) NOT NULL,
    txt_cond_com_cont NVARCHAR(256) NOT NULL,
    num_pag_cont INT(5) NOT NULL,
    bool_val_cont BOOLEAN NOT NULL DEFAULT 0,

    FOREIGN KEY (fk_id_cli) REFERENCES Clientes(pk_id_cli),
    FOREIGN KEY (fk_id_propd) REFERENCES Propiedades(pk_id_propd),
    FOREIGN KEY (fk_id_sup) REFERENCES Supervisores(pk_id_sup)
);


CREATE TABLE Citas(
    pk_id_cit INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    txt_fecha_cit VARCHAR(10) NOT NULL,
    txt_hora_cit VARCHAR(5) NOT NULL,
    fk_id_propd INT NOT NULL,
    fk_id_cli INT NOT NULL,
    FOREIGN KEY (fk_id_propd) REFERENCES Propiedades(pk_id_propd),
    FOREIGN KEY (fk_id_cli) REFERENCES Clientes(pk_id_cli)
);

CREATE TABLE Citas_de_Revision(
    pk_id_cit_rev INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    txt_fecha_cit_rev VARCHAR(10) NOT NULL,
    bool_rev_cit_rev BOOLEAN NOT NULL DEFAULT 0,
    txt_com_cit_rev NVARCHAR(128) NULL,
    fk_id_propd INT NOT NULL,
    fk_id_sup VARCHAR(6) NOT NULL,
    FOREIGN KEY (fk_id_propd) REFERENCES Propiedades(pk_id_propd),
    FOREIGN KEY (fk_id_sup) REFERENCES Supervisores(pk_id_sup)
);
