USE [master]
GO
/****** Object:  Database [TP11Integral]    Script Date: 21/11/2023 10:03:06 ******/
CREATE DATABASE [TP11Integral]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP11Integral', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP11Integral.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP11Integral_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP11Integral_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TP11Integral] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP11Integral].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP11Integral] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP11Integral] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP11Integral] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP11Integral] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP11Integral] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP11Integral] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP11Integral] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP11Integral] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP11Integral] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP11Integral] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP11Integral] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP11Integral] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP11Integral] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP11Integral] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP11Integral] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP11Integral] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP11Integral] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP11Integral] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP11Integral] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP11Integral] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP11Integral] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP11Integral] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP11Integral] SET RECOVERY FULL 
GO
ALTER DATABASE [TP11Integral] SET  MULTI_USER 
GO
ALTER DATABASE [TP11Integral] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP11Integral] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP11Integral] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP11Integral] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP11Integral] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TP11Integral', N'ON'
GO
ALTER DATABASE [TP11Integral] SET QUERY_STORE = OFF
GO
USE [TP11Integral]
GO
/****** Object:  User [alumno]    Script Date: 21/11/2023 10:03:06 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Alquiler]    Script Date: 21/11/2023 10:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alquiler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Anio] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[Semana] [int] NOT NULL,
	[IDUsuario] [int] NOT NULL,
	[IDCasa] [int] NOT NULL,
	[FechaOperacion] [date] NOT NULL,
 CONSTRAINT [PK_Alquiler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casa]    Script Date: 21/11/2023 10:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casa](
	[IDCasa] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_casa] [varchar](50) NOT NULL,
	[Direccion_casa] [varchar](50) NOT NULL,
	[Precio] [real] NOT NULL,
	[Pileta] [bit] NOT NULL,
	[Parrila] [bit] NOT NULL,
	[Cantidad_ambientes] [int] NOT NULL,
	[Balcon] [bit] NOT NULL,
	[FotoCasa] [text] NOT NULL,
 CONSTRAINT [PK_CasaAAlquilar] PRIMARY KEY CLUSTERED 
(
	[IDCasa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorito]    Script Date: 21/11/2023 10:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorito](
	[IDFavoritos] [int] IDENTITY(1,1) NOT NULL,
	[IDUsuario] [int] NOT NULL,
	[IDCasa] [int] NOT NULL,
 CONSTRAINT [PK_Favorito] PRIMARY KEY CLUSTERED 
(
	[IDFavoritos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registro]    Script Date: 21/11/2023 10:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro](
	[IDUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_usuario] [varchar](50) NOT NULL,
	[Apellido_usuario] [varchar](50) NOT NULL,
	[Telefono] [int] NULL,
	[Email] [varchar](50) NOT NULL,
	[Contrasena] [varchar](50) NOT NULL,
	[FotoDePerfil] [varchar](200) NULL,
 CONSTRAINT [PK_Registro] PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Registro] ON 

INSERT [dbo].[Registro] ([IDUsuario], [Nombre_usuario], [Apellido_usuario], [Telefono], [Email], [Contrasena], [FotoDePerfil]) VALUES (3, N'juan', N'perez', NULL, N'tomi@gmail.com', N'asda', NULL)
INSERT [dbo].[Registro] ([IDUsuario], [Nombre_usuario], [Apellido_usuario], [Telefono], [Email], [Contrasena], [FotoDePerfil]) VALUES (4, N'juan', N'perez', NULL, N'tomi@gmail.com', N'sdada', NULL)
INSERT [dbo].[Registro] ([IDUsuario], [Nombre_usuario], [Apellido_usuario], [Telefono], [Email], [Contrasena], [FotoDePerfil]) VALUES (5, N'juan', N'perez', NULL, N'tomi@gmail.com', N'dsad', NULL)
INSERT [dbo].[Registro] ([IDUsuario], [Nombre_usuario], [Apellido_usuario], [Telefono], [Email], [Contrasena], [FotoDePerfil]) VALUES (6, N'ads', N'a', NULL, N'asd@adsd', N'sad', NULL)
INSERT [dbo].[Registro] ([IDUsuario], [Nombre_usuario], [Apellido_usuario], [Telefono], [Email], [Contrasena], [FotoDePerfil]) VALUES (7, N'raian', N'hu', NULL, N'raian@raian', N'hola', NULL)
SET IDENTITY_INSERT [dbo].[Registro] OFF
GO
ALTER TABLE [dbo].[Favorito]  WITH CHECK ADD  CONSTRAINT [FK_Favorito_CasaAAlquilar] FOREIGN KEY([IDCasa])
REFERENCES [dbo].[Casa] ([IDCasa])
GO
ALTER TABLE [dbo].[Favorito] CHECK CONSTRAINT [FK_Favorito_CasaAAlquilar]
GO
/****** Object:  StoredProcedure [dbo].[CantidadAmbientes]    Script Date: 21/11/2023 10:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CantidadAmbientes]
@cantAmbientes int
	AS
	BEGIN
		SELECT * FROM Casa WHERE Cantidad_ambientes = @cantAmbientes
	END
GO
/****** Object:  StoredProcedure [dbo].[EditarPerfil]    Script Date: 21/11/2023 10:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditarPerfil]
@nombreU Varchar(50),
@apellidoU Varchar(50),
@gmail VARCHAR(50),
@contrasena VARCHAR(50),
@telefono Int,
@foto varchar (200)
AS
	BEGIN
UPDATE Registro
SET Nombre_usuario = @nombreU, Apellido_usuario = @apellidoU,Telefono = @telefono, FotoDePerfil = @foto
Where Email = @gmail
	END 
GO
/****** Object:  StoredProcedure [dbo].[GuardarFavoritos]    Script Date: 21/11/2023 10:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GuardarFavoritos]
@IdUser int,
@IdCasa int
	AS
	BEGIN 
		INSERT INTO Favorito (IDUsuario, IDCasa) VALUES (@IdUser, @IdCasa) 
	END 
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesion]    Script Date: 21/11/2023 10:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IniciarSesion]
 @gmail VARCHAR(50),
 @contrasena VARCHAR(50)
	AS
	BEGIN
		Select * from Registro R where R.Email = @gmail and R.Contrasena = @contrasena
	END 
GO
/****** Object:  StoredProcedure [dbo].[ObtenerSemanasDisponibles]    Script Date: 21/11/2023 10:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerSemanasDisponibles]
@IdCasa int,
@mes int,
@anio int
	AS
	BEGIN
		SELECT Semana FROM Alquiler WHERE IDCasa = @IdCasa AND Mes = @mes AND Anio = @anio
	END 
GO
/****** Object:  StoredProcedure [dbo].[Registrarte]    Script Date: 21/11/2023 10:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Registrarte]
@nombreU Varchar(50),
@apellidoU Varchar(50),
@gmail VARCHAR(50),
@contrasena VARCHAR(50)
	AS
	BEGIN
	Insert into Registro
	(Nombre_usuario,Apellido_usuario,Email,Contrasena)
	Values
	(@nombreU,@apellidoU,@gmail,@contrasena)
		
	END 
GO
/****** Object:  StoredProcedure [dbo].[Reservar]    Script Date: 21/11/2023 10:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[Reservar]
@IdUser int,
@IdCasa int,
@anio int,
@mes int,
@semana int
	AS
	BEGIN 
		INSERT INTO Alquiler(Anio,Mes,IDUsuario,IDCasa,Semana) VALUES (@anio, @mes,@IdUser,@IdCasa,@semana) 
	END 
GO
/****** Object:  StoredProcedure [dbo].[TraerCasas]    Script Date: 21/11/2023 10:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TraerCasas]
	AS
	BEGIN
		SELECT * FROM Casa
	END 
GO
/****** Object:  StoredProcedure [dbo].[VerFavoritos]    Script Date: 21/11/2023 10:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerFavoritos]
@IdUser int
	AS 
	BEGIN
		SELECT * FROM Favorito WHERE IDUsuario = @IdUser
	END 
GO
USE [master]
GO
ALTER DATABASE [TP11Integral] SET  READ_WRITE 
GO
