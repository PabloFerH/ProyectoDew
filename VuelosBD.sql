-- MySQL Workbench Forward Engineering
drop database reservas;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema reservas
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `reservas` ;

CREATE SCHEMA IF NOT EXISTS `reservas` DEFAULT CHARACTER SET utf8 ;
USE `reservas` ;

-- -----------------------------------------------------
-- Table `reservas`.`aerolínea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservas`.`aerolínea` (
  `idAerolínea` INT NOT NULL AUTO_INCREMENT,
  `codigoAerolinea` VARCHAR(45) NULL,
  `nombreAerolinea` VARCHAR(45) NULL,
  PRIMARY KEY (`idAerolínea`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservas`.`ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservas`.`ciudad` (
  `idCiudad` INT NOT NULL AUTO_INCREMENT,
  `nombreCiudad` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  PRIMARY KEY (`idCiudad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservas`.`aeropuerto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservas`.`aeropuerto` (
  `idAeropuerto` INT NOT NULL AUTO_INCREMENT,
  `codigoAeropuerto` VARCHAR(45) NULL,
  `nombreAeropuerto` VARCHAR(45) NULL,
  `categoria` INT NULL,
  `idCiudad` INT NOT NULL,
  `idVueloGenerico` INT NOT NULL,
  PRIMARY KEY (`idAeropuerto`),
  INDEX `fk_aeropuerto_ciudad1_idx` (`idCiudad` ASC),
  CONSTRAINT `fk_aeropuerto_ciudad1`
    FOREIGN KEY (`idCiudad`)
    REFERENCES `reservas`.`ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservas`.`vueloGenerico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservas`.`vueloGenerico` (
  `idVueloGenerico` INT NOT NULL AUTO_INCREMENT,
  `nVuelo` INT NULL,
  `horaSalida` VARCHAR(45) NULL,
  `horaLlegada` VARCHAR(45) NULL,
  `precio` FLOAT UNSIGNED NULL,
  `capacidad` INT UNSIGNED NULL,
  `idAerolínea` INT NOT NULL,
  `idAeropuerto` INT NOT NULL,
  PRIMARY KEY (`idVueloGenerico`),
  INDEX `fk_vueloGenerico_aerolínea1_idx` (`idAerolínea` ASC),
  INDEX `fk_vueloGenerico_aeropuerto1_idx` (`idAeropuerto` ASC),
  CONSTRAINT `fk_vueloGenerico_aerolínea1`
    FOREIGN KEY (`idAerolínea`)
    REFERENCES `reservas`.`aerolínea` (`idAerolínea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vueloGenerico_aeropuerto1`
    FOREIGN KEY (`idAeropuerto`)
    REFERENCES `reservas`.`aeropuerto` (`idAeropuerto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservas`.`vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservas`.`vuelo` (
  `idVuelo` INT NOT NULL AUTO_INCREMENT,
  `fecha` VARCHAR(45) NULL,
  `plazasLibres` INT NULL,
  `idVueloGenerico` INT NOT NULL,
  PRIMARY KEY (`idVuelo`),
  INDEX `fk_vuelo_vueloGenerico1_idx` (`idVueloGenerico` ASC),
  CONSTRAINT `fk_vuelo_vueloGenerico1`
    FOREIGN KEY (`idVueloGenerico`)
    REFERENCES `reservas`.`vueloGenerico` (`idVueloGenerico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservas`.`reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservas`.`reservas` (
  `idReservas` INT NOT NULL AUTO_INCREMENT,
  `nReservas` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(9) NULL,
  `tarjeta` VARCHAR(45) NULL,
  `importe` FLOAT UNSIGNED NOT NULL,
  `idVuelo` INT NOT NULL,
  PRIMARY KEY (`idReservas`),
  INDEX `fk_reservas_vuelo1_idx` (`idVuelo` ASC),
  CONSTRAINT `fk_reservas_vuelo1`
    FOREIGN KEY (`idVuelo`)
    REFERENCES `reservas`.`vuelo` (`idVuelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO aerolínea VALUES (default,'001','ryanair');
INSERT INTO aerolínea VALUES (default,'002','iberia');
INSERT INTO aerolínea VALUES (default,'003','aireuropa');
INSERT INTO aerolínea VALUES (default,'004','qatarairways');
INSERT INTO aerolínea VALUES (default,'005','binter');
INSERT INTO aerolínea VALUES (default,'006','easyjet');
INSERT INTO aerolínea VALUES (default,'007','airberlin');
INSERT INTO aerolínea VALUES (default,'008','airfrance');
INSERT INTO aerolínea VALUES (default,'009','americanairlines');
INSERT INTO aerolínea VALUES (default,'010','emiratesairlines');	

INSERT INTO ciudad VALUES (default,'lalaguna','españa');
INSERT INTO ciudad VALUES (default,'madrid','españa');
INSERT INTO ciudad VALUES (default,'barcelona','españa');
INSERT INTO ciudad VALUES (default,'londres','reinounido');
INSERT INTO ciudad VALUES (default,'roma','italia');
INSERT INTO ciudad VALUES (default,'bruselas','belgica');
INSERT INTO ciudad VALUES (default,'losangeles','eeuu');
INSERT INTO ciudad VALUES (default,'montevideo','uruguay');
INSERT INTO ciudad VALUES (default,'buenosaires','argentina');
INSERT INTO ciudad VALUES (default,'berlin','alemania');			
INSERT INTO ciudad VALUES (default,'laspalmas','españa');
INSERT INTO ciudad VALUES (default,'marsella','francia');

INSERT INTO aeropuerto VALUES (default,'01','aeropuertotenerifenorte',1,1,1);
INSERT INTO aeropuerto VALUES (default,'02','aeropuertoelprat',2,3,2);
INSERT INTO aeropuerto VALUES (default,'03','aeropuertoadolfosuarez-barajas',3,2,3);
INSERT INTO aeropuerto VALUES (default,'04','aeropuertoderiobranco',1,8,4);
INSERT INTO aeropuerto VALUES (default,'05','aeropuertointernacionaldelosangeles',3,7,5);	
INSERT INTO aeropuerto VALUES (default,'06','aeropuertointernacionalleonardodavinci',3,5,6);
INSERT INTO aeropuerto VALUES (default,'07','aeropuertodeheathrow',2,4,7);
INSERT INTO aeropuerto VALUES (default,'08','aeropuertodebruselas',3,6,8);
INSERT INTO aeropuerto VALUES (default,'09','aeropuertointernacionalministropistarini',1,9,9);
INSERT INTO aeropuerto VALUES (default,'10','aeropuertodetegel',3,10,11);	
INSERT INTO aeropuerto VALUES (default,'11','aeropuertodegrancanaria',1,11,15);
INSERT INTO aeropuerto VALUES (default,'12','aeropuertodemarsella-provenza',1,12,14);

INSERT INTO vueloGenerico VALUES (default,1,'09:00','09:30',40,60,1,1);
INSERT INTO vueloGenerico VALUES (default,2,'06:00','06:30',120,230,3,2);
INSERT INTO vueloGenerico VALUES (default,3,'22:00','22:30',75.60,180,10,4);
INSERT INTO vueloGenerico VALUES (default,4,'16:00','18:30',90.15,100,7,1);
INSERT INTO vueloGenerico VALUES (default,5,'13:00','13:30',500.40,360,7,5);
INSERT INTO vueloGenerico VALUES (default,6,'11:00','16:00',620.06,110,2,6);
INSERT INTO vueloGenerico VALUES (default,7,'04:30','05:30',80,70,9,7);
INSERT INTO vueloGenerico VALUES (default,8,'02:00','02:30',55,42,8,8);
INSERT INTO vueloGenerico VALUES (default,9,'21:00','21:30',1200,804,4,9);
INSERT INTO vueloGenerico VALUES (default,10,'19:00','20:00',22,102,2,3);	
INSERT INTO vueloGenerico VALUES (default,11,'03:00','06:30',66,118,8,6);
INSERT INTO vueloGenerico VALUES (default,12,'02:00','02:30',640,320,5,12);
INSERT INTO vueloGenerico VALUES (default,13,'01:00','01:30',500,100,6,11);
INSERT INTO vueloGenerico VALUES (default,14,'13:30','16:30',44,60,5,7);
INSERT INTO vueloGenerico VALUES (default,15,'05:00','07:30',88,96,2,10);

INSERT INTO vuelo VALUES (default,'01/01/2017',100,1);
INSERT INTO vuelo VALUES (default,'15/01/2017',300,2);
INSERT INTO vuelo VALUES (default,'03/02/2017',150,3);
INSERT INTO vuelo VALUES (default,'24/01/2017',200,4);
INSERT INTO vuelo VALUES (default,'16/01/2017',500,5);
INSERT INTO vuelo VALUES (default,'06/01/2017',50,6);
INSERT INTO vuelo VALUES (default,'07/01/2017',5,7);
INSERT INTO vuelo VALUES (default,'12/01/2017',10,8);
INSERT INTO vuelo VALUES (default,'01/02/2017',14,9);
INSERT INTO vuelo VALUES (default,'10/01/2017',30,10);		
INSERT INTO vuelo VALUES (default,'11/01/2017',60,11);
INSERT INTO vuelo VALUES (default,'30/01/2017',4,12);
INSERT INTO vuelo VALUES (default,'20/01/2017',2,13);
INSERT INTO vuelo VALUES (default,'22/01/2017',350,14);
INSERT INTO vuelo VALUES (default,'18/01/2017',450,15);

/*VISTA_RESERVAS*/

drop view if exists vista_vuelos;

CREATE VIEW 
vista_vuelos AS 
select vg.idVueloGenerico, vg.nVuelo ,vg.horaSalida, vg.horaLlegada,vg.precio,vg.capacidad,
vg.idAerolínea, linea.nombreAerolinea, linea.codigoAerolinea, vg.idAeropuerto, 
puerto.nombreAeropuerto, puerto.codigoAeropuerto,
puerto.categoria, puerto.idCiudad, c.nombreCiudad, c.pais,
v.idVuelo,v.fecha, v.plazasLibres
from vueloGenerico as vg 
inner join aeropuerto as puerto on vg.idAeropuerto=puerto.idAeropuerto
inner join ciudad as c on puerto.idCiudad=c.idCiudad
inner join aerolínea as linea on vg.idAerolínea=linea.idAerolínea
inner join vuelo as v on vg.idVueloGenerico=v.idVueloGenerico;
