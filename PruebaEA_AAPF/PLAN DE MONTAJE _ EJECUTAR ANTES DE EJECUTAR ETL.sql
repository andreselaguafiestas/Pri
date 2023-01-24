/*PLAN DE MONTAJE */

/*
**********************************************************
EJECUTAR ESTE SCRIPT PARA CREAR LOS ARTEFACTOS NECESARIOS EN LA BASE DE DATOS
ANTES DE EJECUTAR EL ETL DE CARGA DE DATOS 
*/

/*01. crear base de datos*/
Create database TMP_DB_AAPF; 
GO

use TMP_DB_AAPF
go

/*02 BORRAR LA TABLA SI EXISTE*/
IF OBJECT_ID(N'[TMP_DB_AAPF].dbo.DTT_Oregon2', N'U') IS NOT NULL  
   DROP TABLE [TMP_DB_AAPF].[dbo].[DTT_Oregon2];  
GO

/*03 crear tabla para colocar los datos*/
	CREATE TABLE DTT_Oregon (
		[Year] varchar(50),
		[County] varchar(50),
		[Vehicle_Miles] varchar(50),
		[Country] varchar(50),
		[State] varchar(50)
)


/*04 crear usuario para ejecutar el ETL*/

CREATE LOGIN ETLUsr
WITH PASSWORD = 'pass123',
DEFAULT_DATABASE = TMP_DB_AAPF;

/*05 registrar usuario en la database*/
CREATE USER ETLUsr FOR LOGIN ETLUsr;  
GO  

/*06 grant de permisos en el objeto para insertar valores*/
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.DTT_Oregon TO ETLUsr;
