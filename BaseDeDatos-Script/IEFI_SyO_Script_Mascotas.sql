CREATE DATABASE [Mascotas]
USE [Mascotas]
GO
/****** Object:  Table [dbo].[Animales]    Script Date: 21/11/2023 12:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animales](
	[Id_Animal] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Animal] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Animal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mascotas]    Script Date: 21/11/2023 12:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mascotas](
	[Id_Mascota] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Mascota] [varchar](250) NOT NULL,
	[Apodo_Mascota] [varchar](250) NULL,
	[Id_Raza] [int] NULL,
	[Id_Propietario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Mascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propietarios_Mascotas]    Script Date: 21/11/2023 12:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propietarios_Mascotas](
	[Id_Propietario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Propietario] [varchar](250) NOT NULL,
	[Telefono] [varchar](250) NULL,
	[email] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Propietario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Razas]    Script Date: 21/11/2023 12:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Razas](
	[Id_Raza] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Raza] [varchar](250) NOT NULL,
	[Id_Animal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Raza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Animales] ON 
GO
INSERT [dbo].[Animales] ([Id_Animal], [Nombre_Animal]) VALUES (1, N'Perro')
GO
INSERT [dbo].[Animales] ([Id_Animal], [Nombre_Animal]) VALUES (2, N'Caballo')
GO
INSERT [dbo].[Animales] ([Id_Animal], [Nombre_Animal]) VALUES (3, N'Gato')
GO
INSERT [dbo].[Animales] ([Id_Animal], [Nombre_Animal]) VALUES (4, N'Vaca')
GO
SET IDENTITY_INSERT [dbo].[Animales] OFF
GO
SET IDENTITY_INSERT [dbo].[Mascotas] ON 
GO
INSERT [dbo].[Mascotas] ([Id_Mascota], [Nombre_Mascota], [Apodo_Mascota], [Id_Raza], [Id_Propietario]) VALUES (1, N'Toto', N'Tontino', 1, 1)
GO
INSERT [dbo].[Mascotas] ([Id_Mascota], [Nombre_Mascota], [Apodo_Mascota], [Id_Raza], [Id_Propietario]) VALUES (2, N'Palta', N'Paltita', 3, 2)
GO
INSERT [dbo].[Mascotas] ([Id_Mascota], [Nombre_Mascota], [Apodo_Mascota], [Id_Raza], [Id_Propietario]) VALUES (3, N'Cuqui', N'cuquina', 3, 3)
GO
SET IDENTITY_INSERT [dbo].[Mascotas] OFF
GO
SET IDENTITY_INSERT [dbo].[Propietarios_Mascotas] ON 
GO
INSERT [dbo].[Propietarios_Mascotas] ([Id_Propietario], [Nombre_Propietario], [Telefono], [email]) VALUES (1, N'Alejandro Santangelo', N'354869875', N'artesaniaslarustica@gmail.com')
GO
INSERT [dbo].[Propietarios_Mascotas] ([Id_Propietario], [Nombre_Propietario], [Telefono], [email]) VALUES (2, N'Paz Santangelo', N'3548634542', N'paz_santangelo@hotmail.com')
GO
INSERT [dbo].[Propietarios_Mascotas] ([Id_Propietario], [Nombre_Propietario], [Telefono], [email]) VALUES (3, N'Paula Chianelli', N'354869874', N'maria_paula@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Propietarios_Mascotas] OFF
GO
SET IDENTITY_INSERT [dbo].[Razas] ON 
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal]) VALUES (1, N'Boxer', 1)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal]) VALUES (3, N'Mestizo', 1)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal]) VALUES (4, N'Mustang', 2)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal]) VALUES (5, N'Pastor Alemán', 1)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal]) VALUES (6, N'Árabe', 2)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal]) VALUES (7, N'Criollo Argentino', 2)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal]) VALUES (8, N'Silla Argentino', 2)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal]) VALUES (9, N'Siamés', 3)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal]) VALUES (10, N'Maine Coon', 3)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal]) VALUES (11, N'Birmano', 3)
GO
SET IDENTITY_INSERT [dbo].[Razas] OFF
GO
ALTER TABLE [dbo].[Mascotas]  WITH CHECK ADD FOREIGN KEY([Id_Propietario])
REFERENCES [dbo].[Propietarios_Mascotas] ([Id_Propietario])
GO
ALTER TABLE [dbo].[Mascotas]  WITH CHECK ADD FOREIGN KEY([Id_Raza])
REFERENCES [dbo].[Razas] ([Id_Raza])
GO
ALTER TABLE [dbo].[Razas]  WITH CHECK ADD FOREIGN KEY([Id_Animal])
REFERENCES [dbo].[Animales] ([Id_Animal])
GO
USE [master]
GO
ALTER DATABASE [Mascotas] SET  READ_WRITE 
GO
