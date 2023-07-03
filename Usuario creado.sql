USE [master]
GO
CREATE LOGIN [usuario1] WITH PASSWORD='Producto', DEFAULT_DATABASE=[Proyectofinal], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

USE [Proyectofinal]
GO
CREATE USER [usuario2] FOR LOGIN [usuario1]
GO
USE [Proyectofinal]
GO
ALTER ROLE [db_owner] ADD MEMBER [usuario2]
GO