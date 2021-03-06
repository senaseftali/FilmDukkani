USE [master]
GO
/****** Object:  Database [FilmDukkaniDB]    Script Date: 7.01.2018 13:41:13 ******/
CREATE DATABASE [FilmDukkaniDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FilmDukkaniDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL_2014\MSSQL\DATA\FilmDukkaniDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FilmDukkaniDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL_2014\MSSQL\DATA\FilmDukkaniDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FilmDukkaniDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FilmDukkaniDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FilmDukkaniDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FilmDukkaniDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FilmDukkaniDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FilmDukkaniDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FilmDukkaniDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET RECOVERY FULL 
GO
ALTER DATABASE [FilmDukkaniDB] SET  MULTI_USER 
GO
ALTER DATABASE [FilmDukkaniDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FilmDukkaniDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FilmDukkaniDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FilmDukkaniDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FilmDukkaniDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FilmDukkaniDB', N'ON'
GO
USE [FilmDukkaniDB]
GO
/****** Object:  Table [dbo].[Adresler]    Script Date: 7.01.2018 13:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adresler](
	[AdresID] [int] IDENTITY(1,1) NOT NULL,
	[Cadde] [nvarchar](50) NULL,
	[Sokak] [nvarchar](50) NOT NULL,
	[Mahalle] [nvarchar](50) NOT NULL,
	[BinaNo] [int] NOT NULL,
	[Kat] [int] NULL,
	[DaireNo] [int] NULL,
	[Ilce] [nvarchar](50) NOT NULL,
	[Il] [nvarchar](50) NOT NULL,
	[PostaKodu] [nvarchar](5) NULL,
 CONSTRAINT [PK_Adresler] PRIMARY KEY CLUSTERED 
(
	[AdresID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Calisanlar]    Script Date: 7.01.2018 13:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calisanlar](
	[CalisanID] [int] IDENTITY(1,1) NOT NULL,
	[CalisanAdi] [nvarchar](50) NOT NULL,
	[CalisanSoyadi] [nvarchar](50) NOT NULL,
	[Cinsiyet] [nvarchar](10) NOT NULL,
	[Telefon] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Pozisyon] [nvarchar](50) NOT NULL,
	[AdresID] [int] NOT NULL,
	[SubeID] [int] NOT NULL,
	[Fotograf] [nvarchar](500) NOT NULL,
	[Sifre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Calisanlar] PRIMARY KEY CLUSTERED 
(
	[CalisanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Filmler]    Script Date: 7.01.2018 13:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filmler](
	[FilmID] [int] IDENTITY(1,1) NOT NULL,
	[FilmAdi] [nvarchar](50) NOT NULL,
	[YonetmenID] [int] NOT NULL,
	[KategoriID] [int] NOT NULL,
	[OyuncuID] [int] NOT NULL,
	[Ozet] [nvarchar](50) NOT NULL,
	[YapimYili] [datetime] NOT NULL,
	[Resim] [nvarchar](500) NOT NULL,
	[Odul] [nvarchar](50) NOT NULL,
	[SubeID] [int] NOT NULL,
	[Sure] [nvarchar](50) NOT NULL,
	[Fiyat] [money] NOT NULL,
	[StokMiktari] [int] NOT NULL,
	[Fragman] [nvarchar](50) NULL,
 CONSTRAINT [PK_Filmler] PRIMARY KEY CLUSTERED 
(
	[FilmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 7.01.2018 13:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[KategoriID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 7.01.2018 13:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[MusteriID] [int] IDENTITY(1,1) NOT NULL,
	[MusteriAdi] [nvarchar](50) NOT NULL,
	[MusteriSoyadi] [nvarchar](50) NOT NULL,
	[AdresID] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Telefon] [nvarchar](50) NOT NULL,
	[Sifre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Oyuncular]    Script Date: 7.01.2018 13:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oyuncular](
	[OyuncuID] [int] IDENTITY(1,1) NOT NULL,
	[OyuncuAdi] [nvarchar](50) NOT NULL,
	[OyuncuSoyadi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Oyuncular] PRIMARY KEY CLUSTERED 
(
	[OyuncuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subeler]    Script Date: 7.01.2018 13:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subeler](
	[SubeID] [int] IDENTITY(1,1) NOT NULL,
	[SubeAdi] [nvarchar](50) NOT NULL,
	[AdresID] [int] NOT NULL,
 CONSTRAINT [PK_Subeler] PRIMARY KEY CLUSTERED 
(
	[SubeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Yonetmenler]    Script Date: 7.01.2018 13:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yonetmenler](
	[YonetmenID] [int] IDENTITY(1,1) NOT NULL,
	[YonetmenAdi] [nvarchar](50) NOT NULL,
	[YonetmenSoyadi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Yonetmenler] PRIMARY KEY CLUSTERED 
(
	[YonetmenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Calisanlar]  WITH CHECK ADD  CONSTRAINT [FK_Calisanlar_Adresler] FOREIGN KEY([AdresID])
REFERENCES [dbo].[Adresler] ([AdresID])
GO
ALTER TABLE [dbo].[Calisanlar] CHECK CONSTRAINT [FK_Calisanlar_Adresler]
GO
ALTER TABLE [dbo].[Calisanlar]  WITH CHECK ADD  CONSTRAINT [FK_Calisanlar_Subeler] FOREIGN KEY([SubeID])
REFERENCES [dbo].[Subeler] ([SubeID])
GO
ALTER TABLE [dbo].[Calisanlar] CHECK CONSTRAINT [FK_Calisanlar_Subeler]
GO
ALTER TABLE [dbo].[Filmler]  WITH CHECK ADD  CONSTRAINT [FK_Filmler_Kategoriler] FOREIGN KEY([KategoriID])
REFERENCES [dbo].[Kategoriler] ([KategoriID])
GO
ALTER TABLE [dbo].[Filmler] CHECK CONSTRAINT [FK_Filmler_Kategoriler]
GO
ALTER TABLE [dbo].[Filmler]  WITH CHECK ADD  CONSTRAINT [FK_Filmler_Oyuncular] FOREIGN KEY([OyuncuID])
REFERENCES [dbo].[Oyuncular] ([OyuncuID])
GO
ALTER TABLE [dbo].[Filmler] CHECK CONSTRAINT [FK_Filmler_Oyuncular]
GO
ALTER TABLE [dbo].[Filmler]  WITH CHECK ADD  CONSTRAINT [FK_Filmler_Subeler] FOREIGN KEY([SubeID])
REFERENCES [dbo].[Subeler] ([SubeID])
GO
ALTER TABLE [dbo].[Filmler] CHECK CONSTRAINT [FK_Filmler_Subeler]
GO
ALTER TABLE [dbo].[Filmler]  WITH CHECK ADD  CONSTRAINT [FK_Filmler_Yonetmenler] FOREIGN KEY([YonetmenID])
REFERENCES [dbo].[Yonetmenler] ([YonetmenID])
GO
ALTER TABLE [dbo].[Filmler] CHECK CONSTRAINT [FK_Filmler_Yonetmenler]
GO
ALTER TABLE [dbo].[Musteriler]  WITH CHECK ADD  CONSTRAINT [FK_Musteriler_Adresler] FOREIGN KEY([AdresID])
REFERENCES [dbo].[Adresler] ([AdresID])
GO
ALTER TABLE [dbo].[Musteriler] CHECK CONSTRAINT [FK_Musteriler_Adresler]
GO
ALTER TABLE [dbo].[Subeler]  WITH CHECK ADD  CONSTRAINT [FK_Subeler_Adresler] FOREIGN KEY([AdresID])
REFERENCES [dbo].[Adresler] ([AdresID])
GO
ALTER TABLE [dbo].[Subeler] CHECK CONSTRAINT [FK_Subeler_Adresler]
GO
USE [master]
GO
ALTER DATABASE [FilmDukkaniDB] SET  READ_WRITE 
GO
