USE [master]
GO
/****** Object:  Database [LID_Games_Arcade_BD]    Script Date: 23/11/2023 11:55:18 ******/
CREATE DATABASE [LID_Games_Arcade_BD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LID_Games_Arcade_BD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LID_Games_Arcade_BD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LID_Games_Arcade_BD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LID_Games_Arcade_BD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LID_Games_Arcade_BD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET ARITHABORT OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET RECOVERY FULL 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET  MULTI_USER 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LID_Games_Arcade_BD', N'ON'
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET QUERY_STORE = OFF
GO
USE [LID_Games_Arcade_BD]
GO
/****** Object:  Table [dbo].[juego]    Script Date: 23/11/2023 11:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[juego](
	[idJuego] [int] IDENTITY(1,1) NOT NULL,
	[nombreJuego] [nchar](20) NOT NULL,
 CONSTRAINT [PK_juego] PRIMARY KEY CLUSTERED 
(
	[idJuego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puntaje]    Script Date: 23/11/2023 11:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puntaje](
	[idPuntaje] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idJuego] [int] NOT NULL,
	[puntos] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_Puntaje] PRIMARY KEY CLUSTERED 
(
	[idPuntaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 23/11/2023 11:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombreUsuario] [nchar](3) NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Puntaje]  WITH CHECK ADD  CONSTRAINT [FK_Puntaje_juego] FOREIGN KEY([idJuego])
REFERENCES [dbo].[juego] ([idJuego])
GO
ALTER TABLE [dbo].[Puntaje] CHECK CONSTRAINT [FK_Puntaje_juego]
GO
ALTER TABLE [dbo].[Puntaje]  WITH CHECK ADD  CONSTRAINT [FK_Puntaje_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Puntaje] CHECK CONSTRAINT [FK_Puntaje_usuario]
GO
/****** Object:  StoredProcedure [dbo].[SP_ENCONTRAR_USUARIO]    Script Date: 23/11/2023 11:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ENCONTRAR_USUARIO](
 
 @nameUser nvarchar(3),
 @IDRETURN int output,
 @ERRORID int output,
 @ERRORDESCRIPCION nvarchar(max) output
 
)
AS
BEGIN
BEGIN TRY
	IF EXISTS (SELECT idUsuario FROM usuario WHERE nombreUsuario =@nameUser) --¿el usuario está registrada?
		-- Si, el usuario si está registrada. 
		BEGIN
			select @IDRETURN = idUsuario 
			FROM usuario WHERE nombreUsuario =@nameUser

			  
					set @ERRORID = 0;
					set @ERRORDESCRIPCION = 'Usuario encontrado';
		END

		ELSE 
		BEGIN
		set @idReturn = 0;
					set @ERRORID = 1;
					set @ERRORDESCRIPCION = 'Usuario no encontrado';
		END
	
	END TRY
	
	BEGIN CATCH
		set @idReturn = -1;
		set @errorId = ERROR_NUMBER();
		set @errorDescripcion = ERROR_MESSAGE();
		
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_INGRESAR_PUNTAJES]    Script Date: 23/11/2023 11:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_INGRESAR_PUNTAJES](
 
 @idUser int,
 @puntajeUser decimal(5,2),
 @idGame int,
 @IDRETURN int output,
 @ERRORID int output,
 @ERRORDESCRIPCION nvarchar(max) output
)
AS
BEGIN
	
	BEGIN TRY
	IF EXISTS (SELECT * FROM usuario WHERE [idUsuario] = @idUser) --¿el usuario está registrada?
		-- Si, el usuario si está registrada. 
		BEGIN
			     IF EXISTS (SELECT * FROM juego WHERE idJuego =@idGame) --¿el juego está registrada?
		-- Si, el juego si está registrada. 
						BEGIN
						--AQUI VAMOS A INGRESAR TODO PORQUE TODO EXISTE
						
							insert into [dbo].[Puntaje]([idUsuario],[idJuego],[puntos]) 
							values(@idUser, @idGame, @puntajeUser);

							set @idReturn = scope_identity();
							set @ERRORID = 0;
							set @ERRORDESCRIPCION = 'Puntaje ingresado';
						END
                 ELSE
				 --ERROR PORQUE NO EXISTE JUEGO
						BEGIN
							set @idReturn = scope_identity();
							set @ERRORID = 1;
							set @ERRORDESCRIPCION = 'Juego no existe';
						END
		END

	ELSE
	--ERROR PORQUE EL USUARIO NO EXISTE
		BEGIN
					
					set @idReturn = scope_identity();
					set @ERRORID = 1;
					set @ERRORDESCRIPCION = 'Usuario no existe';
	
		END
	
	END TRY
	
	BEGIN CATCH
		set @idReturn = -1;
		set @errorId = ERROR_NUMBER();
		set @errorDescripcion = ERROR_MESSAGE();
		
	END CATCH


END
GO
/****** Object:  StoredProcedure [dbo].[SP_INGRESAR_USUARIO]    Script Date: 23/11/2023 11:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_INGRESAR_USUARIO](
 
 @nameUser nvarchar(3),
 @IDRETURN int output,
 @ERRORID int output,
 @ERRORDESCRIPCION nvarchar(max) output

)
AS
BEGIN
BEGIN TRY
	
		BEGIN		
					insert into [dbo].[usuario](nombreUsuario) 
					values(@nameUser);
				
					set @IDRETURN = scope_identity();
					set @ERRORID = 0;
					set @ERRORDESCRIPCION = 'Usuario creado';
	
		END
		
	
	END TRY
	
	BEGIN CATCH
		set @idReturn = -1;
		set @errorId = ERROR_NUMBER();
		set @errorDescripcion = ERROR_MESSAGE();
		
	END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_PUNTAJES]    Script Date: 23/11/2023 11:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_OBTENER_PUNTAJES]
AS
BEGIN
	SELECT [nombreUsuario] , [puntos], [idJuego]  
	FROM [dbo].[usuario] INNER JOIN [dbo].[Puntaje] 
	ON [dbo].[usuario].[idUsuario] = [dbo].[Puntaje].[idUsuario]
END
GO
USE [master]
GO
ALTER DATABASE [LID_Games_Arcade_BD] SET  READ_WRITE 
GO
