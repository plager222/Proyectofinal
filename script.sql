USE [master]
GO
/****** Object:  Database [Proyectofinal]    Script Date: 10/7/2023 10:58:09 ******/
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
/****** Object:  User [usuario2]    Script Date: 10/7/2023 10:58:09 ******/
CREATE USER [usuario2] FOR LOGIN [usuario1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alumno]    Script Date: 10/7/2023 10:58:09 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [usuario2]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 10/7/2023 10:58:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[IdPedido] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Estado] [varchar](max) NOT NULL,
	[IdPromocion] [int] NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos_items]    Script Date: 10/7/2023 10:58:09 ******/
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
/****** Object:  Table [dbo].[Postres]    Script Date: 10/7/2023 10:58:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postres](
	[IdPostre] [int] IDENTITY(1,1) NOT NULL,
	[NombrePostre] [varchar](max) NOT NULL,
	[Precio] [float] NOT NULL,
	[img] [nvarchar](200) NULL,
 CONSTRAINT [PK_Postres] PRIMARY KEY CLUSTERED 
(
	[IdPostre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 10/7/2023 10:58:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Precio] [int] NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Imagen] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promocion]    Script Date: 10/7/2023 10:58:09 ******/
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
/****** Object:  Table [dbo].[Promocion_Productos]    Script Date: 10/7/2023 10:58:09 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/7/2023 10:58:09 ******/
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
SET IDENTITY_INSERT [dbo].[Postres] ON 

INSERT [dbo].[Postres] ([IdPostre], [NombrePostre], [Precio], [img]) VALUES (1, N'Torta de Frutilla', 700, N'image-8@2x.png')
INSERT [dbo].[Postres] ([IdPostre], [NombrePostre], [Precio], [img]) VALUES (2, N'Sambayon', 700, N'image-10@2x.png')
INSERT [dbo].[Postres] ([IdPostre], [NombrePostre], [Precio], [img]) VALUES (3, N'Panqueque de DDL', 700, N'image-11@2x.png')
INSERT [dbo].[Postres] ([IdPostre], [NombrePostre], [Precio], [img]) VALUES (5, N'Mousse de banana', 700, N'image-12@2x.png')
INSERT [dbo].[Postres] ([IdPostre], [NombrePostre], [Precio], [img]) VALUES (9, N'Mokaccino', 700, N'image-13@2x.pn')
INSERT [dbo].[Postres] ([IdPostre], [NombrePostre], [Precio], [img]) VALUES (10, N'Suspiro de frutilla', 700, N'image-14@2x.png')
INSERT [dbo].[Postres] ([IdPostre], [NombrePostre], [Precio], [img]) VALUES (11, N'Maximo de arandanos', 700, N'image-15@2x.png')
INSERT [dbo].[Postres] ([IdPostre], [NombrePostre], [Precio], [img]) VALUES (12, N'Manzana asada', 700, N'image-16@2x.png')
INSERT [dbo].[Postres] ([IdPostre], [NombrePostre], [Precio], [img]) VALUES (13, N'Manjar', 700, N'image-17@2x.png')
INSERT [dbo].[Postres] ([IdPostre], [NombrePostre], [Precio], [img]) VALUES (14, N'Mousse de chocolate', 700, N'image-18@2x.png')
SET IDENTITY_INSERT [dbo].[Postres] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([IdProducto], [Precio], [Nombre], [Imagen]) VALUES (3, 700, N'Torta de Frutilla', N'https://viandasnutra.com/wp-content/uploads/2022/07/Cheesecake.jpg')
INSERT [dbo].[Productos] ([IdProducto], [Precio], [Nombre], [Imagen]) VALUES (4, 700, N'Sambayon', N'https://viandasnutra.com/wp-content/uploads/2022/07/Sambayon-300x300.jpg')
INSERT [dbo].[Productos] ([IdProducto], [Precio], [Nombre], [Imagen]) VALUES (5, 700, N'Panqueque de DDL', N'https://viandasnutra.com/wp-content/uploads/2022/07/Panqueque-de-Dulce-de-Leche.jpg')
INSERT [dbo].[Productos] ([IdProducto], [Precio], [Nombre], [Imagen]) VALUES (6, 700, N'Mousse de banana', N'https://viandasnutra.com/wp-content/uploads/2022/07/Cheesecake-de-Dulce-de-Leche-300x300.jpg')
INSERT [dbo].[Productos] ([IdProducto], [Precio], [Nombre], [Imagen]) VALUES (7, 700, N'Suspiro de frutilla', N'https://viandasnutra.com/wp-content/uploads/2022/07/Delicia-de-Frutilla-300x300.jpg')
INSERT [dbo].[Productos] ([IdProducto], [Precio], [Nombre], [Imagen]) VALUES (8, 700, N'Mokaccino', N'https://viandasnutra.com/wp-content/uploads/2022/07/Ricoton-de-Dulce-de-Leche-300x300.jpg')
INSERT [dbo].[Productos] ([IdProducto], [Precio], [Nombre], [Imagen]) VALUES (9, 700, N'Maximo de arandanos', N'https://viandasnutra.com/wp-content/uploads/2022/07/Tiramisu-300x300.jpg')
INSERT [dbo].[Productos] ([IdProducto], [Precio], [Nombre], [Imagen]) VALUES (10, 700, N'Manzana asada', N'https://viandasnutra.com/wp-content/uploads/2022/07/Apple-pie-300x300.jpg')
INSERT [dbo].[Productos] ([IdProducto], [Precio], [Nombre], [Imagen]) VALUES (11, 700, N'Manjar', N'https://viandasnutra.com/wp-content/uploads/2022/07/Manjar-300x300.jpg')
INSERT [dbo].[Productos] ([IdProducto], [Precio], [Nombre], [Imagen]) VALUES (12, 700, N'Mousse de chocolate', N'https://viandasnutra.com/wp-content/uploads/2022/07/Mousse-de-Chocolate-300x300.jpg')
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
