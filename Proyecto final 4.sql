USE [master]
GO
/****** Object:  Database [Proyectofinal]    Script Date: 5/6/2023 10:04:46 ******/
CREATE DATABASE [Proyectofinal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proyectofinal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Proyectofinal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Proyectofinal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Proyectofinal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Proyectofinal] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proyectofinal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proyectofinal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proyectofinal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proyectofinal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proyectofinal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proyectofinal] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proyectofinal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proyectofinal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proyectofinal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proyectofinal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proyectofinal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proyectofinal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proyectofinal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proyectofinal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proyectofinal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proyectofinal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Proyectofinal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proyectofinal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proyectofinal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proyectofinal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proyectofinal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proyectofinal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proyectofinal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proyectofinal] SET RECOVERY FULL 
GO
ALTER DATABASE [Proyectofinal] SET  MULTI_USER 
GO
ALTER DATABASE [Proyectofinal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proyectofinal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proyectofinal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proyectofinal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Proyectofinal] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Proyectofinal', N'ON'
GO
ALTER DATABASE [Proyectofinal] SET QUERY_STORE = OFF
GO
USE [Proyectofinal]
GO
/****** Object:  User [Productos]    Script Date: 5/6/2023 10:04:46 ******/
CREATE USER [Productos] FOR LOGIN [Productos] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alumno]    Script Date: 5/6/2023 10:04:46 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Productos]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 5/6/2023 10:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[IdPedido] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Estado] [varchar](max) NOT NULL,
	[IdPromocion] [int]  NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos_items]    Script Date: 5/6/2023 10:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos_items](
	[IdPedido] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Pedidos_items] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 5/6/2023 10:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Precio] [int] NOT NULL,
	[Calorias] [int] NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promocion]    Script Date: 5/6/2023 10:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promocion](
	[IdPromocion] [int] IDENTITY(1,1) NOT NULL,
	[Precio] [int] NOT NULL,
	[Fecha_de_vencimiento] [datetime] NOT NULL,
 CONSTRAINT [PK_Promocion] PRIMARY KEY CLUSTERED 
(
	[IdPromocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promocion_Productos]    Script Date: 5/6/2023 10:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promocion_Productos](
	[IdPromocion] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NULL,
 CONSTRAINT [PK_Promocion_Productos] PRIMARY KEY CLUSTERED 
(
	[IdPromocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/6/2023 10:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](max) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([IdProducto], [Precio], [Calorias], [Descripcion], [Nombre]) VALUES (2, 500, 90, N'tarta de verdura con jamon y queso', N'tarta verdura y jyq')
INSERT [dbo].[Productos] ([IdProducto], [Precio], [Calorias], [Descripcion], [Nombre]) VALUES (3, 600, 70, N'ravioles de 4 quesos', N'raviolitos')
INSERT [dbo].[Productos] ([IdProducto], [Precio], [Calorias], [Descripcion], [Nombre]) VALUES (6, 480, 35, N'tarta de choclo con pedazos de verdura', N'tarta de zapallito')
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Promocion] FOREIGN KEY([IdPromocion])
REFERENCES [dbo].[Promocion] ([IdPromocion])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Promocion]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Usuario]
GO
ALTER TABLE [dbo].[Pedidos_items]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_items_Pedidos] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedidos] ([IdPedido])
GO
ALTER TABLE [dbo].[Pedidos_items] CHECK CONSTRAINT [FK_Pedidos_items_Pedidos]
GO
ALTER TABLE [dbo].[Pedidos_items]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_items_Productos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[Pedidos_items] CHECK CONSTRAINT [FK_Pedidos_items_Productos]
GO
ALTER TABLE [dbo].[Promocion]  WITH CHECK ADD  CONSTRAINT [FK_Promocion_Promocion_Productos] FOREIGN KEY([IdPromocion])
REFERENCES [dbo].[Promocion_Productos] ([IdPromocion])
GO
ALTER TABLE [dbo].[Promocion] CHECK CONSTRAINT [FK_Promocion_Promocion_Productos]
GO
ALTER TABLE [dbo].[Promocion_Productos]  WITH CHECK ADD  CONSTRAINT [FK_Promocion_Productos_Productos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[Promocion_Productos] CHECK CONSTRAINT [FK_Promocion_Productos_Productos]
GO
USE [master]
GO
ALTER DATABASE [Proyectofinal] SET  READ_WRITE 
GO
