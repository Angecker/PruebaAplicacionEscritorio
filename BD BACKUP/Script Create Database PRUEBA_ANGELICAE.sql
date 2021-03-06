USE [master]
GO
/****** Object:  Database [PRUEBA_ANGELICAE]    Script Date: 21/03/2022 5:43:05 p. m. ******/
CREATE DATABASE [PRUEBA_ANGELICAE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRUEBA_ANGELICAE', FILENAME = N'C:\Users\myriam.enriquez\PRUEBA_ANGELICAE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRUEBA_ANGELICAE_log', FILENAME = N'C:\Users\myriam.enriquez\PRUEBA_ANGELICAE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRUEBA_ANGELICAE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET  MULTI_USER 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET QUERY_STORE = OFF
GO
USE [PRUEBA_ANGELICAE]
GO
/****** Object:  Table [dbo].[Tbl_Credenciales]    Script Date: 21/03/2022 5:43:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Credenciales](
	[Usuario] [varchar](50) NOT NULL,
	[Contrasenia] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Tbl_Login] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Pais]    Script Date: 21/03/2022 5:43:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Pais](
	[P_Pais_Id_Pk] [int] IDENTITY(1,1) NOT NULL,
	[P_Descripcion] [varchar](500) NOT NULL,
	[P_Padre_Id_Fk] [int] NULL,
	[P_Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Tbl_Pais] PRIMARY KEY CLUSTERED 
(
	[P_Pais_Id_Pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ProgramacionVuelos]    Script Date: 21/03/2022 5:43:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ProgramacionVuelos](
	[IdProgramacionVuelos_PK] [int] IDENTITY(1,1) NOT NULL,
	[IdCiudadOrigen_FK] [int] NOT NULL,
	[IdCiudadDestino_FK] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[HoraSalida] [time](7) NOT NULL,
	[HoraLlegada] [time](7) NOT NULL,
	[NumeroDeVuelo] [int] NOT NULL,
	[Aerolinea] [varchar](50) NOT NULL,
	[EstadoDeVuelo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tbl_ProgramacionVuelos] PRIMARY KEY CLUSTERED 
(
	[IdProgramacionVuelos_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tbl_ProgramacionVuelos]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_ProgramacionVuelos_Tbl_Pais] FOREIGN KEY([IdCiudadOrigen_FK])
REFERENCES [dbo].[Tbl_Pais] ([P_Pais_Id_Pk])
GO
ALTER TABLE [dbo].[Tbl_ProgramacionVuelos] CHECK CONSTRAINT [FK_Tbl_ProgramacionVuelos_Tbl_Pais]
GO
ALTER TABLE [dbo].[Tbl_ProgramacionVuelos]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_ProgramacionVuelos_Tbl_Pais1] FOREIGN KEY([IdCiudadDestino_FK])
REFERENCES [dbo].[Tbl_Pais] ([P_Pais_Id_Pk])
GO
ALTER TABLE [dbo].[Tbl_ProgramacionVuelos] CHECK CONSTRAINT [FK_Tbl_ProgramacionVuelos_Tbl_Pais1]
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateProgramacionVuelos]    Script Date: 21/03/2022 5:43:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ANGELICA ENRIQUEZ
-- Create date: 21 DE MARZO DE 2022
-- Description:	PRUEBA
-- =============================================
CREATE PROCEDURE [dbo].[SP_CreateProgramacionVuelos]
	-- Add the parameters for the stored procedure here
	@IdCiudadOrigen_FK int, 
	@IdCiudadDestino_FK int,
	@Fecha datetime,
    @HoraSalida time(7),
    @HoraLlegada time(7),
    @NumeroDeVuelo int,
    @Aerolinea varchar(50),
    @EstadoDeVuelo varchar(50)
AS
BEGIN

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Tbl_ProgramacionVuelos]
           ([IdCiudadOrigen_FK]
           ,[IdCiudadDestino_FK]
           ,[Fecha]
           ,[HoraSalida]
           ,[HoraLlegada]
           ,[NumeroDeVuelo]
           ,[Aerolinea]
           ,[EstadoDeVuelo])
     VALUES
           (@IdCiudadOrigen_FK
           ,@IdCiudadDestino_FK
           ,@Fecha
           ,@HoraSalida
           ,@HoraLlegada
           ,@NumeroDeVuelo
           ,@Aerolinea
           ,@EstadoDeVuelo)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 21/03/2022 5:43:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ANGELICA ENRIQUEZ
-- Create date: 21 DE MARZO DE 2022
-- Description:	PRUEBA
-- =============================================
--EXEC [SP_Login] 'ANGELICA', 'Ange123*'
CREATE PROCEDURE [dbo].[SP_Login] 
	@Usuario varchar(50),
	@Contrasenia varchar(50)

AS
BEGIN

		SELECT [Usuario]
			  ,[Contrasenia]
			  ,[Estado]
		  FROM [dbo].[Tbl_Credenciales]
		 WHERE [Usuario] = @Usuario
		   AND [Contrasenia] = @Contrasenia
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ShowCiudades]    Script Date: 21/03/2022 5:43:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ANGELICA ENRIQUEZ
-- Create date: 21 DE MARZO DE 2022
-- Description:	PRUEBA
-- =============================================
--EXEC [SP_ShowCiudades]
CREATE PROCEDURE [dbo].[SP_ShowCiudades] 

AS
BEGIN

		SELECT --PAIS.[P_Pais_Id_Pk], PAIS.[P_Descripcion], 
			   --DEPTO.[P_Pais_Id_Pk], DEPTO.[P_Descripcion], 
			   CIUD.[P_Pais_Id_Pk] ID, 
			   --CIUD.[P_Descripcion],
			   PAIS.[P_Descripcion] + ' | ' + DEPTO.[P_Descripcion] + ' | ' + CIUD.[P_Descripcion] AS CIUDADES
		  FROM [dbo].[Tbl_Pais] PAIS
		  JOIN [dbo].[Tbl_Pais] DEPTO ON PAIS.[P_Pais_Id_Pk] = DEPTO.[P_Padre_Id_Fk]
		  JOIN [dbo].[Tbl_Pais] CIUD ON DEPTO.[P_Pais_Id_Pk] = CIUD.[P_Padre_Id_Fk]
		 WHERE CIUD.[P_Estado] = 1
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ShowProgramacionVuelos]    Script Date: 21/03/2022 5:43:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ANGELICA ENRIQUEZ
-- Create date: 21 DE MARZO DE 2022
-- Description:	PRUEBA
-- =============================================
--EXEC [SP_ShowProgramacionVuelos] 0, NULL
CREATE PROCEDURE [dbo].[SP_ShowProgramacionVuelos] 
	@FlagVuelo bit,
	@NumeroDeVuelo int NULL

AS
BEGIN

	IF ( @FlagVuelo = 1)

		SELECT [IdProgramacionVuelos_PK]
			  ,PAIS.[P_Descripcion] + ' | ' + DEPTO.[P_Descripcion] + ' | ' + CIUD.[P_Descripcion] AS[IdCiudadOrigen_FK]
			  ,PAISDT.[P_Descripcion] + ' | ' + DEPTODT.[P_Descripcion] + ' | ' + CIUDDT.[P_Descripcion] AS [IdCiudadDestino_FK]
			  ,[Fecha]
			  ,[HoraSalida]
			  ,[HoraLlegada]
			  ,[NumeroDeVuelo]
			  ,[Aerolinea]
			  ,[EstadoDeVuelo]
		  FROM [dbo].[Tbl_ProgramacionVuelos] PV 
		  JOIN [dbo].[Tbl_Pais] CIUD ON CIUD.[P_Pais_Id_Pk] = PV.[IdCiudadOrigen_FK]
		  JOIN [dbo].[Tbl_Pais] DEPTO ON DEPTO.[P_Pais_Id_Pk] = CIUD.[P_Padre_Id_Fk]
		  JOIN [dbo].[Tbl_Pais] PAIS ON DEPTO.[P_Pais_Id_Pk] = PAIS.[P_Padre_Id_Fk]
		  JOIN [dbo].[Tbl_Pais] CIUDDT ON CIUDDT.[P_Pais_Id_Pk] = PV.[IdCiudadDestino_FK]
		  JOIN [dbo].[Tbl_Pais] DEPTODT ON DEPTODT.[P_Pais_Id_Pk] = CIUDDT.[P_Padre_Id_Fk]
		  JOIN [dbo].[Tbl_Pais] PAISDT ON DEPTODT.[P_Pais_Id_Pk] = PAISDT.[P_Padre_Id_Fk]
		 WHERE CIUD.[P_Estado] = 1
		   AND CIUDDT.[P_Estado] = 1
		   AND [NumeroDeVuelo] = @NumeroDeVuelo
	
	ELSE

		SELECT [NumeroDeVuelo]
			  ,[Aerolinea]
			  ,[EstadoDeVuelo]
		  FROM [dbo].[Tbl_ProgramacionVuelos] PV 
		  JOIN [dbo].[Tbl_Pais] CIUD ON CIUD.[P_Pais_Id_Pk] = PV.[IdCiudadOrigen_FK]
		  JOIN [dbo].[Tbl_Pais] DEPTO ON DEPTO.[P_Pais_Id_Pk] = CIUD.[P_Padre_Id_Fk]
		  JOIN [dbo].[Tbl_Pais] PAIS ON DEPTO.[P_Pais_Id_Pk] = PAIS.[P_Padre_Id_Fk]
		  JOIN [dbo].[Tbl_Pais] CIUDDT ON CIUDDT.[P_Pais_Id_Pk] = PV.[IdCiudadDestino_FK]
		  JOIN [dbo].[Tbl_Pais] DEPTODT ON DEPTODT.[P_Pais_Id_Pk] = CIUDDT.[P_Padre_Id_Fk]
		  JOIN [dbo].[Tbl_Pais] PAISDT ON DEPTODT.[P_Pais_Id_Pk] = PAISDT.[P_Padre_Id_Fk]
		 WHERE CIUD.[P_Estado] = 1
		   AND CIUDDT.[P_Estado] = 1

END
GO
USE [master]
GO
ALTER DATABASE [PRUEBA_ANGELICAE] SET  READ_WRITE 
GO
