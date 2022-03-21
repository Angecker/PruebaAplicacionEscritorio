USE [PRUEBA_ANGELICAE]
GO

INSERT INTO [dbo].[Tbl_ProgramacionVuelos] ([IdCiudadOrigen_FK] ,[IdCiudadDestino_FK] ,[Fecha] ,[HoraSalida] ,[HoraLlegada] ,[NumeroDeVuelo] ,[Aerolinea] ,[EstadoDeVuelo])
     VALUES (1,	3,	5,	'2022-03-21 14:07:14.000',	'01:02:03',	'02:04:00',	123, 'AVIANCA A TIEMPO')
GO


