-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ventas_202602
--

CREATE DATABASE IF NOT EXISTS ventas_202602;
USE ventas_202602;

--
-- Temporary table structure for view `v_cliente`
--
DROP TABLE IF EXISTS `v_cliente`;
DROP VIEW IF EXISTS `v_cliente`;
CREATE TABLE `v_cliente` (
  `id_cliente` int(11),
  `ruc_clie` char(11),
  `nomb_clie` varchar(50),
  `dire_clie` varchar(100),
  `nomb_dist` varchar(50),
  `telf_clie` varchar(15),
  `celu_clie` varchar(15),
  `obsv_clie` varchar(100)
);

--
-- Temporary table structure for view `v_distrito`
--
DROP TABLE IF EXISTS `v_distrito`;
DROP VIEW IF EXISTS `v_distrito`;
CREATE TABLE `v_distrito` (
  `id_distrito` int(11),
  `nomb_dist` varchar(50),
  `obsv_dist` varchar(100)
);

--
-- Temporary table structure for view `v_empleado`
--
DROP TABLE IF EXISTS `v_empleado`;
DROP VIEW IF EXISTS `v_empleado`;
CREATE TABLE `v_empleado` (
  `id_empleado` int(11),
  `dni_empl` char(8),
  `nomb_empl` varchar(30),
  `apat_empl` varchar(30),
  `amat_empl` varchar(30),
  `sexo_empl` char(1),
  `dire_empl` varchar(100),
  `nomb_dist` varchar(50),
  `telf_empl` varchar(15),
  `celu_empl` varchar(15),
  `emai_empl` varchar(50),
  `obsv_empl` varchar(100),
  `foto_empl` varchar(255)
);

--
-- Temporary table structure for view `v_producto`
--
DROP TABLE IF EXISTS `v_producto`;
DROP VIEW IF EXISTS `v_producto`;
CREATE TABLE `v_producto` (
  `id_producto` int(11),
  `nomb_prod` varchar(30),
  `prec_prod` decimal(10,2),
  `obsv_prod` varchar(100)
);

--
-- Definition of table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `ruc_clie` char(11) DEFAULT NULL,
  `nomb_clie` varchar(50) DEFAULT NULL,
  `dire_clie` varchar(100) DEFAULT NULL,
  `id_distrito` int(11) DEFAULT NULL,
  `telf_clie` varchar(15) DEFAULT NULL,
  `celu_clie` varchar(15) DEFAULT NULL,
  `obsv_clie` varchar(100) DEFAULT NULL,
  `esta_clie` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id_cliente`),
  KEY `id_distrito` (`id_distrito`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_distrito`) REFERENCES `distrito` (`id_distrito`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cliente`
--

/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id_cliente`,`ruc_clie`,`nomb_clie`,`dire_clie`,`id_distrito`,`telf_clie`,`celu_clie`,`obsv_clie`,`esta_clie`) VALUES 
 (1,'20123456780','TECNOLOGÍA S.A.','AV. GRAU 1200',1,'','','',1),
 (2,'20987456320','DIGITAL EIRL','AV. BRASIL 2000',2,'','','',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;


--
-- Definition of table `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
CREATE TABLE `detalle_factura` (
  `id_factura` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `prec_prod` decimal(10,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `importe` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_factura`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`),
  CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detalle_factura`
--

/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
INSERT INTO `detalle_factura` (`id_factura`,`id_producto`,`prec_prod`,`cantidad`,`importe`) VALUES 
 (2,1,'39.00',2,'78.00'),
 (4,1,'39.00',1,'39.00'),
 (4,3,'600.00',5,'3000.00'),
 (4,4,'59.00',7,'413.00'),
 (4,5,'1900.00',1,'1900.00'),
 (5,1,'39.00',7,'273.00'),
 (5,3,'600.00',7,'4200.00'),
 (5,5,'1900.00',1,'1900.00');
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;


--
-- Definition of table `distrito`
--

DROP TABLE IF EXISTS `distrito`;
CREATE TABLE `distrito` (
  `id_distrito` int(11) NOT NULL AUTO_INCREMENT,
  `nomb_dist` varchar(50) DEFAULT NULL,
  `obsv_dist` varchar(100) DEFAULT NULL,
  `esta_dist` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id_distrito`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `distrito`
--

/*!40000 ALTER TABLE `distrito` DISABLE KEYS */;
INSERT INTO `distrito` (`id_distrito`,`nomb_dist`,`obsv_dist`,`esta_dist`) VALUES 
 (1,'HUACHO','CAPITAL DE LA HOSPITALIDAD',1),
 (2,'BARRANCA','',1),
 (3,'CHANCAY','',1),
 (4,'PARAMONGA','',1),
 (5,'CARQUIN','',1),
 (6,'SANTA MARÍA','',1);
/*!40000 ALTER TABLE `distrito` ENABLE KEYS */;


--
-- Definition of table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `dni_empl` char(8) DEFAULT NULL,
  `nomb_empl` varchar(30) DEFAULT NULL,
  `apat_empl` varchar(30) DEFAULT NULL,
  `amat_empl` varchar(30) DEFAULT NULL,
  `sexo_empl` char(1) DEFAULT NULL,
  `dire_empl` varchar(100) DEFAULT NULL,
  `id_distrito` int(11) DEFAULT NULL,
  `telf_empl` varchar(15) DEFAULT NULL,
  `celu_empl` varchar(15) DEFAULT NULL,
  `emai_empl` varchar(50) DEFAULT NULL,
  `obsv_empl` varchar(100) DEFAULT NULL,
  `esta_empl` tinyint(4) DEFAULT 1,
  `foto_empl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_distrito` (`id_distrito`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_distrito`) REFERENCES `distrito` (`id_distrito`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empleado`
--

/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` (`id_empleado`,`dni_empl`,`nomb_empl`,`apat_empl`,`amat_empl`,`sexo_empl`,`dire_empl`,`id_distrito`,`telf_empl`,`celu_empl`,`emai_empl`,`obsv_empl`,`esta_empl`,`foto_empl`) VALUES 
 (1,'12345678','JUAN','PEREZ','CASTILLO','M','AV. ANGAMOS 1200',1,'','','juan@gmail.com','',1,''),
 (2,'23456789','ANA','LEE','OLIVOS','F','AV. TACNA 2500',2,'','','ana@gmail.com','',1,''),
 (3,'34567890','JORGE','SANCHEZ','MEDINA','M','JR. TARAPACA 3200',3,'','','jorge@gmail.com','',1,''),
 (4,'23456701','MELISA','BARDALES','TRINIDAD','F','AV. IQUIQUE 7400',1,'','','melisa@gmail.com','',1,''),
 (5,'60894567','ALEX','SANTOS','FLORES','M','AV. LOS SAUCES',1,'','','alex@gmail.com','',0,'');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;


--
-- Definition of table `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `fech_fact` datetime DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `stot_fact` decimal(10,2) DEFAULT NULL,
  `igv_fact` decimal(10,2) DEFAULT NULL,
  `tota_fact` decimal(10,2) DEFAULT NULL,
  `esta_fact` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id_factura`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `factura`
--

/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` (`id_factura`,`fech_fact`,`id_cliente`,`id_empleado`,`stot_fact`,`igv_fact`,`tota_fact`,`esta_fact`) VALUES 
 (2,'2026-11-05 11:26:05',1,1,'66.10','11.90','78.00',1),
 (4,'2026-11-13 19:19:58',2,2,'4535.59','816.41','5352.00',1),
 (5,'2026-11-13 19:24:34',1,2,'5400.85','972.15','6373.00',1);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;


--
-- Definition of table `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nomb_prod` varchar(30) DEFAULT NULL,
  `prec_prod` decimal(10,2) DEFAULT NULL,
  `obsv_prod` varchar(100) DEFAULT NULL,
  `esta_prod` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producto`
--

/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`id_producto`,`nomb_prod`,`prec_prod`,`obsv_prod`,`esta_prod`) VALUES 
 (1,'MOUSE ALÁMBRICO','39.00','',1),
 (2,'MONITOR 21 PULG','250.00','',1),
 (3,'IMPRESORA ','600.00','',1),
 (4,'TECLADO ALÁMBRICO','59.00','',1),
 (5,'LAPTOP 14 PULG','1900.00','',1),
 (6,'TARGETA GRÁFICA RTX 3060','1500.00','',0);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;


--
-- Definition of procedure `sp_delete_cliente`
--

DROP PROCEDURE IF EXISTS `sp_delete_cliente`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_cliente`(xid_cliente int)
begin
update cliente
set esta_clie=0
where id_cliente=xid_cliente;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_delete_distrito`
--

DROP PROCEDURE IF EXISTS `sp_delete_distrito`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_distrito`(xid_distrito int)
begin
update distrito
set esta_dist=0
where id_distrito=xid_distrito;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_delete_empleado`
--

DROP PROCEDURE IF EXISTS `sp_delete_empleado`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_empleado`(xid_empleado int)
begin
update empleado
set esta_empl=0
where id_empleado=xid_empleado;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_delete_producto`
--

DROP PROCEDURE IF EXISTS `sp_delete_producto`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_producto`(xid_producto int)
begin
update producto
set esta_prod=0
where id_producto=xid_producto;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_insert_cliente`
--

DROP PROCEDURE IF EXISTS `sp_insert_cliente`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_cliente`(xruc_clie char(11),
xnomb_clie varchar(50),
xdire_clie varchar(100),
xid_distrito int,
xtelf_clie varchar(15),
xcelu_clie varchar(15),
xobsv_clie varchar(100))
begin
insert into cliente(ruc_clie,nomb_clie,dire_clie,id_distrito,telf_clie,celu_clie,obsv_clie)
values(xruc_clie,xnomb_clie,xdire_clie,xid_distrito,xtelf_clie,xcelu_clie,xobsv_clie);
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_insert_detalle_factura`
--

DROP PROCEDURE IF EXISTS `sp_insert_detalle_factura`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_detalle_factura`(xid_factura int,
xid_producto int,
xprec_prod decimal(10,2),
xcantidad int,
ximporte decimal(10,2))
begin
insert into detalle_factura (id_factura,id_producto,prec_prod,cantidad,importe)
values (xid_factura,xid_producto,xprec_prod,xcantidad,ximporte);
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_insert_distrito`
--

DROP PROCEDURE IF EXISTS `sp_insert_distrito`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_distrito`(xnomb_dist varchar(50),
xobsv_dist varchar(100))
begin
insert into distrito(nomb_dist,obsv_dist)
values(xnomb_dist,xobsv_dist);
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_insert_empleado`
--

DROP PROCEDURE IF EXISTS `sp_insert_empleado`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_empleado`(xdni_empl char(8),
xnomb_empl varchar(30),
xapat_empl varchar(30),
xamat_empl varchar(30),
xsexo_empl char(1),
xdire_empl varchar(100),
xid_distrito int,
xtelf_empl varchar(15),
xcelu_empl varchar(15),
xemai_empl varchar(50),
xobsv_empl varchar(100),
xfoto_empl varchar(255))
begin
insert into empleado(dni_empl,nomb_empl,apat_empl,amat_empl,sexo_empl,dire_empl,id_distrito,telf_empl,celu_empl,emai_empl,obsv_empl,foto_empl)
values(xdni_empl,xnomb_empl,xapat_empl,xamat_empl,xsexo_empl,xdire_empl,xid_distrito,xtelf_empl,xcelu_empl,xemai_empl,xobsv_empl,xfoto_empl);
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_insert_factura`
--

DROP PROCEDURE IF EXISTS `sp_insert_factura`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_factura`(xid_cliente int,
xid_empleado int,
xstot_fact decimal(10,2),
xigv_fact decimal(10,2),
xtota_fact decimal(10,2))
begin
insert into factura (fech_fact,id_cliente,id_empleado,stot_fact,igv_fact,tota_fact)
values (now(),xid_cliente,xid_empleado,xstot_fact,xigv_fact,xtota_fact);
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_insert_producto`
--

DROP PROCEDURE IF EXISTS `sp_insert_producto`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_producto`(xnomb_prod varchar(30),
xprec_prod decimal(10,2),
xobsv_prod varchar(100))
begin
insert into producto(nomb_prod,prec_prod,obsv_prod)
values(xnomb_prod,xprec_prod,xobsv_prod);
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_update_cliente`
--

DROP PROCEDURE IF EXISTS `sp_update_cliente`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_cliente`(xid_cliente int,
xruc_clie char(11),
xnomb_clie varchar(50),
xdire_clie varchar(100),
xid_distrito int,
xtelf_clie varchar(15),
xcelu_clie varchar(15),
xobsv_clie varchar(100))
begin
update cliente
set ruc_clie=xruc_clie,nomb_clie=xnomb_clie,dire_clie=xdire_clie,id_distrito=xid_distrito,telf_clie=xtelf_clie,celu_clie=xcelu_clie,obsv_clie=xobsv_clie
where id_cliente=xid_cliente and esta_clie=1;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_update_distrito`
--

DROP PROCEDURE IF EXISTS `sp_update_distrito`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_distrito`(xid_distrito int,
xnomb_dist varchar(50),
xobsv_dist varchar(100))
begin
update distrito
set nomb_dist=xnomb_dist,obsv_dist=xobsv_dist
where id_distrito=xid_distrito and esta_dist=1;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_update_empleado`
--

DROP PROCEDURE IF EXISTS `sp_update_empleado`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_empleado`(xid_empleado int,
xdni_empl char(8),
xnomb_empl varchar(30),
xapat_empl varchar(30),
xamat_empl varchar(30),
xsexo_empl char(1),
xdire_empl varchar(100),
xid_distrito int,
xtelf_empl varchar(15),
xcelu_empl varchar(15),
xemai_empl varchar(50),
xobsv_empl varchar(100),
xfoto_empl varchar(255))
begin
update empleado
set dni_empl=xdni_empl,nomb_empl=xnomb_empl,apat_empl=xapat_empl,amat_empl=xamat_empl,sexo_empl=xsexo_empl,dire_empl=xdire_empl,id_distrito=xid_distrito,telf_empl=xtelf_empl,celu_empl=xcelu_empl,emai_empl=xemai_empl,obsv_empl=xobsv_empl,foto_empl=xfoto_empl
where id_empleado=xid_empleado and esta_empl=1;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_update_producto`
--

DROP PROCEDURE IF EXISTS `sp_update_producto`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_producto`(xid_producto int,
xnomb_prod varchar(30),
xprec_prod decimal(10,2),
xobsv_prod varchar(100))
begin
update producto
set nomb_prod=xnomb_prod,prec_prod=xprec_prod,obsv_prod=xobsv_prod
where id_producto=xid_producto and esta_prod=1;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of view `v_cliente`
--

DROP TABLE IF EXISTS `v_cliente`;
DROP VIEW IF EXISTS `v_cliente`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cliente` AS select `c`.`id_cliente` AS `id_cliente`,`c`.`ruc_clie` AS `ruc_clie`,`c`.`nomb_clie` AS `nomb_clie`,`c`.`dire_clie` AS `dire_clie`,`d`.`nomb_dist` AS `nomb_dist`,`c`.`telf_clie` AS `telf_clie`,`c`.`celu_clie` AS `celu_clie`,`c`.`obsv_clie` AS `obsv_clie` from (`cliente` `c` join `distrito` `d` on(`c`.`id_distrito` = `d`.`id_distrito`)) where `c`.`esta_clie` = 1 and `d`.`esta_dist` = 1 order by 1;

--
-- Definition of view `v_distrito`
--

DROP TABLE IF EXISTS `v_distrito`;
DROP VIEW IF EXISTS `v_distrito`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_distrito` AS select `distrito`.`id_distrito` AS `id_distrito`,`distrito`.`nomb_dist` AS `nomb_dist`,`distrito`.`obsv_dist` AS `obsv_dist` from `distrito` where `distrito`.`esta_dist` = 1 order by 1;

--
-- Definition of view `v_empleado`
--

DROP TABLE IF EXISTS `v_empleado`;
DROP VIEW IF EXISTS `v_empleado`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_empleado` AS select `e`.`id_empleado` AS `id_empleado`,`e`.`dni_empl` AS `dni_empl`,`e`.`nomb_empl` AS `nomb_empl`,`e`.`apat_empl` AS `apat_empl`,`e`.`amat_empl` AS `amat_empl`,`e`.`sexo_empl` AS `sexo_empl`,`e`.`dire_empl` AS `dire_empl`,`d`.`nomb_dist` AS `nomb_dist`,`e`.`telf_empl` AS `telf_empl`,`e`.`celu_empl` AS `celu_empl`,`e`.`emai_empl` AS `emai_empl`,`e`.`obsv_empl` AS `obsv_empl`,`e`.`foto_empl` AS `foto_empl` from (`empleado` `e` join `distrito` `d` on(`e`.`id_distrito` = `d`.`id_distrito`)) where `e`.`esta_empl` = 1 and `d`.`esta_dist` = 1 order by 1;

--
-- Definition of view `v_producto`
--

DROP TABLE IF EXISTS `v_producto`;
DROP VIEW IF EXISTS `v_producto`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_producto` AS select `producto`.`id_producto` AS `id_producto`,`producto`.`nomb_prod` AS `nomb_prod`,`producto`.`prec_prod` AS `prec_prod`,`producto`.`obsv_prod` AS `obsv_prod` from `producto` where `producto`.`esta_prod` = 1 order by 1;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
