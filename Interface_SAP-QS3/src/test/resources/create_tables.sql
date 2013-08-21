-- Autogenerated: do not edit this file
DROP TABLE  dbo.QS_TBL_SAP_ORDEN IF EXISTS;
DROP TABLE  dbo.QS_TBL_QS3_ORDEN IF EXISTS;

DROP SCHEMA dbo
CREATE SCHEMA dbo AUTHORIZATION DBA

CREATE TABLE dbo.QS_TBL_SAP_ORDEN ( 
	ch_orden_compra varchar(250) NOT NULL, 
	nu_id_estatus smallint  NOT NULL, 
	da_registro datetime NOT NULL, 
	nu_id_archivo int NOT NULL, 
	da_proceso datetime NULL, 
	ch_origen varchar(250) NULL, 
	ch_foliopedido varchar(250) NULL, 
	ch_destino varchar(250) NULL, 
	ch_ciudescrip varchar(250) NULL, 
	ch_pedfecha varchar(250) NULL, 
	ch_pedfechaemb varchar(250) NULL, 
	ch_pedfechaent varchar(250) NULL, 
	ch_observa varchar(250) NULL,  
	ch_producto varchar(250) NULL, 
	ch_cantidad varchar(250) NULL, 
	ch_fechaembarque varchar(250) NULL, 
	ch_cajas varchar(250) NULL, 
	ch_ocedi varchar(250) NULL, 
	ch_cubicuadre varchar(250) NULL, 
	ch_pedidos3 varchar(250) NULL, 
	ch_occamion varchar(1) NULL, 
	ch_tipopedido varchar(8) NULL,      
	ch_orgventas varchar(4) NULL, 
	ch_canaldist varchar(2) NULL, 
	ch_division varchar(4) NULL,  
	nu_posicionitem int NULL, 
	ch_procedencia varchar(250) NULL, 
	ch_razonpedido varchar(250) NULL)

CREATE TABLE dbo.QS_TBL_QS3_ORDEN ( 
	nu_id_orden int NOT NULL,
	nu_id_estatus smallint NOT NULL, 
	da_registro datetime NOT NULL, 
	nu_id_archivo int NOT NULL, 
	da_proceso datetime NULL, 
	ch_tipopedido varchar(8) NULL,      
	ch_orgventas varchar(4) NULL, 
	ch_canaldist varchar(2) NULL, 
	ch_division varchar(2) NULL,  
	ch_destino varchar(250) NULL, 
	ch_pedfecha varchar(250) NULL, 
	ch_pedfechaemb varchar(250) NULL, 
	ch_pedfechaent varchar(250) NULL, 
	ch_producto varchar(250) NULL, 
	ch_cantidad varchar(250) NULL, 
	ch_origen varchar(250) NULL, 
	ch_almacen varchar(250) NULL, 
	ch_foliopedido varchar(250) NULL, 
	ch_estadopedido varchar(250) NULL, 
	ch_observa varchar(250) NULL,  
	ch_ocedi varchar(15) NULL, 
	ch_cubicuadre varchar(20) NULL, 
	ch_pedidos3 varchar(50) NULL, 
	ch_occamion varchar(1) NULL, 
	ch_pedtipo varchar(250) NULL, 
	nu_prioridad int NULL, 
	ch_razonpedido varchar(250) NULL)