USE [master]
GO
/****** Object:  Database [Bichitos]    Script Date: 18/11/2023 12:35:37 ******/
CREATE DATABASE [Bichitos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bichitos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Bichitos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bichitos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Bichitos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Bichitos] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bichitos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bichitos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bichitos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bichitos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bichitos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bichitos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bichitos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bichitos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bichitos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bichitos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bichitos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bichitos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bichitos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bichitos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bichitos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bichitos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Bichitos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bichitos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bichitos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bichitos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bichitos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bichitos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bichitos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bichitos] SET RECOVERY FULL 
GO
ALTER DATABASE [Bichitos] SET  MULTI_USER 
GO
ALTER DATABASE [Bichitos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bichitos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bichitos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bichitos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bichitos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bichitos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bichitos', N'ON'
GO
ALTER DATABASE [Bichitos] SET QUERY_STORE = OFF
GO
USE [Bichitos]
GO
/****** Object:  Table [dbo].[Animales]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animales](
	[Id_Animal] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Animal] [varchar](255) NULL,
	[FechaBaja] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Animal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VerAnimales]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VerAnimales]
AS
SELECT        Nombre_Animal, FechaBaja
FROM            dbo.Animales
GO
/****** Object:  Table [dbo].[Razas]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Razas](
	[Id_Raza] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Raza] [varchar](255) NULL,
	[Id_Animal] [int] NULL,
	[FechaBaja] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Raza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mascotas]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mascotas](
	[Id_Mascota] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Mascota] [varchar](255) NULL,
	[Apodo] [varchar](255) NULL,
	[Nombre_Dueño] [varchar](255) NULL,
	[Id_Raza] [int] NULL,
	[FechaBaja] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Mascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VerMascotas]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VerMascotas]
AS
SELECT        dbo.Mascotas.Nombre_Mascota, dbo.Mascotas.Apodo, dbo.Mascotas.Nombre_Dueño, dbo.Mascotas.FechaBaja AS FechaBaja_Mascota, dbo.Razas.Nombre_Raza, dbo.Razas.FechaBaja AS FechaBaja_Raza, 
                         dbo.Animales.Nombre_Animal, dbo.Animales.FechaBaja AS FechaBaja_Animal
FROM            dbo.Mascotas INNER JOIN
                         dbo.Razas ON dbo.Mascotas.Id_Raza = dbo.Razas.Id_Raza INNER JOIN
                         dbo.Animales ON dbo.Razas.Id_Animal = dbo.Animales.Id_Animal
GO
/****** Object:  View [dbo].[VerRazas]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VerRazas]
AS
SELECT        Nombre_Raza, FechaBaja
FROM            dbo.Razas
GO
/****** Object:  View [dbo].[VistaGlobalBichitosActivos]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaGlobalBichitosActivos]
AS
SELECT        dbo.Animales.Nombre_Animal, dbo.Razas.Nombre_Raza, dbo.Mascotas.Nombre_Mascota, dbo.Mascotas.Apodo, dbo.Mascotas.Nombre_Dueño
FROM            dbo.Animales INNER JOIN
                         dbo.Razas ON dbo.Animales.Id_Animal = dbo.Razas.Id_Animal INNER JOIN
                         dbo.Mascotas ON dbo.Razas.Id_Raza = dbo.Mascotas.Id_Raza
WHERE        (dbo.Razas.FechaBaja IS NULL) AND (dbo.Mascotas.FechaBaja IS NULL) AND (dbo.Animales.FechaBaja IS NULL)
GO
/****** Object:  View [dbo].[VistaGlobalBichitosBorrados]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaGlobalBichitosBorrados]
AS
SELECT        dbo.Animales.Nombre_Animal AS [Nombre Animal], dbo.Razas.Nombre_Raza AS [Nombre Raza], dbo.Mascotas.Nombre_Mascota AS [Nombre Mascota], dbo.Mascotas.Apodo, dbo.Mascotas.Nombre_Dueño AS [Nombre Dueño], 
                         dbo.Animales.FechaBaja AS FechaBaja_Animal, dbo.Razas.FechaBaja AS FechaBaja_Raza, dbo.Animales.FechaBaja AS fecha_Baja_Mascota
FROM            dbo.Animales INNER JOIN
                         dbo.Razas ON dbo.Animales.Id_Animal = dbo.Razas.Id_Animal INNER JOIN
                         dbo.Mascotas ON dbo.Razas.Id_Raza = dbo.Mascotas.Id_Raza
WHERE        (dbo.Animales.FechaBaja IS NOT NULL) AND (dbo.Razas.FechaBaja IS NOT NULL) AND (dbo.Animales.FechaBaja IS NOT NULL)
GO
SET IDENTITY_INSERT [dbo].[Animales] ON 
GO
INSERT [dbo].[Animales] ([Id_Animal], [Nombre_Animal], [FechaBaja]) VALUES (2, N'Caballo', CAST(N'2023-11-14T09:01:51.320' AS DateTime))
GO
INSERT [dbo].[Animales] ([Id_Animal], [Nombre_Animal], [FechaBaja]) VALUES (3, N'Vaca', CAST(N'2023-11-14T09:31:23.277' AS DateTime))
GO
INSERT [dbo].[Animales] ([Id_Animal], [Nombre_Animal], [FechaBaja]) VALUES (4, N'Conejo', CAST(N'2023-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Animales] ([Id_Animal], [Nombre_Animal], [FechaBaja]) VALUES (5, N'Perro', NULL)
GO
INSERT [dbo].[Animales] ([Id_Animal], [Nombre_Animal], [FechaBaja]) VALUES (6, N'Gato', NULL)
GO
SET IDENTITY_INSERT [dbo].[Animales] OFF
GO
SET IDENTITY_INSERT [dbo].[Mascotas] ON 
GO
INSERT [dbo].[Mascotas] ([Id_Mascota], [Nombre_Mascota], [Apodo], [Nombre_Dueño], [Id_Raza], [FechaBaja]) VALUES (1, N'Toto', N'Tontino', N'Alejandro Santangelo', 2, NULL)
GO
INSERT [dbo].[Mascotas] ([Id_Mascota], [Nombre_Mascota], [Apodo], [Nombre_Dueño], [Id_Raza], [FechaBaja]) VALUES (2, N'Palta', N'Paltina', N'Paz Santangelo', 4, NULL)
GO
INSERT [dbo].[Mascotas] ([Id_Mascota], [Nombre_Mascota], [Apodo], [Nombre_Dueño], [Id_Raza], [FechaBaja]) VALUES (3, N'Cuqui', N'Cuchina', N'Paula Chianelli', 4, NULL)
GO
INSERT [dbo].[Mascotas] ([Id_Mascota], [Nombre_Mascota], [Apodo], [Nombre_Dueño], [Id_Raza], [FechaBaja]) VALUES (4, N'Pampa', N'Pampis', N'Paz Santangelo', 14, NULL)
GO
SET IDENTITY_INSERT [dbo].[Mascotas] OFF
GO
SET IDENTITY_INSERT [dbo].[Razas] ON 
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (1, N'Mustang', 2, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (2, N'Boxer', 5, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (3, N'Pastor Alemán', 5, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (4, N'Mestizo', 5, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (5, N'Bulldog Francés', 5, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (6, N'Chihuahua', 5, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (7, N'Salchicha', 5, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (8, N'Golden Retriever', 5, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (9, N'Labrador', 5, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (10, N'Beagle', 5, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (11, N'Árabe', 2, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (12, N'Frisón', 2, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (13, N'Pura Sangre Inglés', 2, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (14, N'Criollo Argentino', 2, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (15, N'Silla Argentino', 2, CAST(N'2023-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (16, N'Petiso Argentino', 2, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (17, N'Holstein', 2, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (18, N'Siamés', 6, CAST(N'2023-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (19, N'Maine Coon', 6, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (20, N'Esfinge', 6, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (21, N'Burmés', 6, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (22, N'Birmano', 6, NULL)
GO
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Animal], [FechaBaja]) VALUES (24, N'Bulldog Inglés', 5, NULL)
GO
SET IDENTITY_INSERT [dbo].[Razas] OFF
GO
ALTER TABLE [dbo].[Mascotas]  WITH CHECK ADD FOREIGN KEY([Id_Raza])
REFERENCES [dbo].[Razas] ([Id_Raza])
GO
ALTER TABLE [dbo].[Razas]  WITH CHECK ADD FOREIGN KEY([Id_Animal])
REFERENCES [dbo].[Animales] ([Id_Animal])
GO
/****** Object:  StoredProcedure [dbo].[AgregarAnimal]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarAnimal]
   
    @Nombre_Animal VARCHAR(250),
    @FechaBaja DATETIME = NULL
AS
BEGIN
    INSERT INTO Animales ( Nombre_Animal, FechaBaja)
    VALUES ( @Nombre_Animal, @FechaBaja);
END;
GO
/****** Object:  StoredProcedure [dbo].[AgregarMascota]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarMascota]
    
    @Nombre_Mascota VARCHAR(250),
    @Apodo VARCHAR(250),
    @Nombre_Dueño VARCHAR(250),
	 @FechaBaja DATETIME = NULL,
    
    @Nombre_Raza VARCHAR(250),
   
    @Nombre_Animal VARCHAR(250)
   
AS
BEGIN
    -- Agregar la mascota a la tabla Mascotas
    INSERT INTO Mascotas ( Nombre_Mascota, Apodo, Nombre_Dueño, FechaBaja)
    VALUES ( @Nombre_Mascota, @Apodo, @Nombre_Dueño, @FechaBaja);

    -- Agregar la raza a la tabla Razas
    INSERT INTO Razas ( Nombre_Raza)
    VALUES ( @Nombre_Raza);

    -- Agregar el animal a la tabla Animales
    INSERT INTO Animales ( Nombre_Animal)
    VALUES ( @Nombre_Animal);
END;

GO
/****** Object:  StoredProcedure [dbo].[AgregarRaza]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarRaza]
   
    @Nombre_Raza VARCHAR(250),
   
    @FechaBaja DATETIME = NULL
AS
BEGIN
    INSERT INTO Razas ( Nombre_Raza, FechaBaja)
    VALUES ( @Nombre_Raza, @FechaBaja);
END;
GO
/****** Object:  StoredProcedure [dbo].[BorrarAnimal]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BorrarAnimal]
    @Nombre_Animal VARCHAR(250)
AS
BEGIN
    UPDATE Bichitos.dbo.Animales
    SET FechaBaja = GETDATE() -- Establece la FechaBaja como la fecha actual
    WHERE Nombre_Animal = @Nombre_Animal;
END
GO
/****** Object:  StoredProcedure [dbo].[BorrarMascota]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BorrarMascota]
    @Nombre_Mascota NVARCHAR(50)
AS
BEGIN
    UPDATE Mascotas
    SET FechaBaja = GETDATE()
    WHERE Nombre_Mascota = @Nombre_Mascota AND FechaBaja IS NULL;
END;
GO
/****** Object:  StoredProcedure [dbo].[BorrarRaza]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BorrarRaza]

    @Id_Raza INT,
    @Nombre_Raza VARCHAR(250)
AS
BEGIN
    UPDATE Razas
    SET FechaBaja = GETDATE() 
    WHERE Id_Raza = @Id_Raza OR Nombre_Raza = @Nombre_Raza;
END;


GO
/****** Object:  StoredProcedure [dbo].[ModificarAnimal]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarAnimal]
    @Nombre_Animal VARCHAR(250)
AS
BEGIN
    UPDATE Animales
    SET Nombre_Animal = @Nombre_Animal;

    -- Opcional: Imprimir un mensaje de éxito
    PRINT 'Animal modificado correctamente.';
END;
GO
/****** Object:  StoredProcedure [dbo].[ModificarMascota]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarMascota]
    @Id_Mascota INT,
    @Nombre_Mascota VARCHAR(250),
    @Apodo VARCHAR(250),
    @Nombre_Dueño VARCHAR(250)
AS
BEGIN
    UPDATE Mascotas
    SET 
        Nombre_Mascota = @Nombre_Mascota,
        Apodo = @Apodo,
        Nombre_Dueño = @Nombre_Dueño
    WHERE Id_Mascota = @Id_Mascota;
END;
GO
/****** Object:  StoredProcedure [dbo].[ModificarRaza]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarRaza]
    @Id_Raza INT,
    @Nombre_Raza VARCHAR(250)
AS
BEGIN
    UPDATE Razas
    SET Nombre_Raza = @Nombre_Raza
    WHERE Id_Raza = @Id_Raza;
END;
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarAnimal]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SeleccionarAnimal]
    @Nombre_Animal NVARCHAR(100) = NULL,
    @Id_Animal INT = NULL
AS
BEGIN
    SELECT
        Id_Animal,
        Nombre_Animal
    FROM
        Animales
    WHERE
        Nombre_Animal LIKE '%' + @Nombre_Animal + '%' OR @Nombre_Animal IS NULL;
END;

GO
/****** Object:  StoredProcedure [dbo].[SeleccionarMascota]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SeleccionarMascota]
    @Id_Mascota int,
    @Nombre_Mascota NVARCHAR(250) = NULL,
    @Apodo NVARCHAR(250) = NULL,
    @Nombre_Dueño NVARCHAR(250) = NULL,
    @Id_Raza INT = NULL,
    @Nombre_Raza NVARCHAR(250) = NULL,
    @Id_Animal INT = NULL,
    @Nombre_Animal NVARCHAR(250) = NULL
AS
BEGIN
    SELECT
        Mascotas.Id_Mascota,
        Mascotas.Nombre_Mascota,
        Mascotas.Apodo,
        Mascotas.Nombre_Dueño,
		Razas.Id_Raza,
        Razas.Nombre_Raza,
        Animales.Id_Animal,
        Animales.Nombre_Animal
        
      
    FROM Mascotas
        INNER JOIN Razas ON Mascotas.Id_Raza = Razas.Id_Raza
        INNER JOIN Animales ON Razas.Id_Animal = Animales.Id_Animal
    WHERE
        (@Nombre_Mascota IS NULL OR Mascotas.Nombre_Mascota LIKE '%' + @Nombre_Mascota + '%')
        AND (@Apodo IS NULL OR Mascotas.Apodo LIKE '%' + @Apodo + '%')
        AND (@Nombre_Dueño IS NULL OR Mascotas.Nombre_Dueño LIKE '%' + @Nombre_Dueño + '%')
        AND (@Id_Raza IS NULL OR Razas.Id_Raza = @Id_Raza)
        AND (@Nombre_Raza IS NULL OR Razas.Nombre_Raza LIKE '%' + @Nombre_Raza + '%')
        AND (@Id_Animal IS NULL OR Animales.Id_Animal = @Id_Animal)
        AND (@Nombre_Animal IS NULL OR Animales.Nombre_Animal LIKE '%' + @Nombre_Animal + '%');
END;
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarRaza]    Script Date: 18/11/2023 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SeleccionarRaza]
    @Id_Raza INT = NULL,
    @Nombre_Raza NVARCHAR(250) = NULL,
    @Id_Animal INT = NULL,
    @Nombre_Animal NVARCHAR(250) = NULL
AS
BEGIN
    SELECT
        Razas.Id_Raza,
        Razas.Nombre_Raza,
        Razas.Id_Animal,
        Animales.Nombre_Animal
    FROM
        Razas
        INNER JOIN Animales ON Razas.Id_Animal = Animales.Id_Animal
    WHERE
        (@Nombre_Raza IS NULL OR Razas.Nombre_Raza LIKE '%' + @Nombre_Raza + '%')
        AND (@Nombre_Animal IS NULL OR Animales.Nombre_Animal LIKE '%' + @Nombre_Animal + '%');
        
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Animales"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VerAnimales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VerAnimales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[24] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Mascotas"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Razas"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Animales"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 119
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1815
         Alias = 2340
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VerMascotas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VerMascotas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Razas"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VerRazas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VerRazas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[38] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Animales"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Razas"
            Begin Extent = 
               Top = 8
               Left = 337
               Bottom = 138
               Right = 507
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Mascotas"
            Begin Extent = 
               Top = 120
               Left = 38
               Bottom = 250
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2610
         Alias = 1560
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaGlobalBichitosActivos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaGlobalBichitosActivos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[34] 2[7] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Animales"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Razas"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Mascotas"
            Begin Extent = 
               Top = 120
               Left = 38
               Bottom = 250
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2595
         Alias = 1710
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaGlobalBichitosBorrados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaGlobalBichitosBorrados'
GO
USE [master]
GO
ALTER DATABASE [Bichitos] SET  READ_WRITE 
GO
