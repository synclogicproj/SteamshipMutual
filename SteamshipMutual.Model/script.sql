USE [master]
GO
/****** Object:  Database [test]    Script Date: 06/09/2020 17:17:52 ******/
CREATE DATABASE [test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [test] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test] SET ARITHABORT OFF 
GO
ALTER DATABASE [test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test] SET RECOVERY FULL 
GO
ALTER DATABASE [test] SET  MULTI_USER 
GO
ALTER DATABASE [test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [test] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'test', N'ON'
GO
ALTER DATABASE [test] SET QUERY_STORE = OFF
GO
USE [test]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [test]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 06/09/2020 17:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesFigures]    Script Date: 06/09/2020 17:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesFigures](
	[SalesRef] [int] IDENTITY(1,1) NOT NULL,
	[SalesDate] [date] NOT NULL,
	[SalesAmount] [float] NOT NULL,
	[StaffId] [int] NOT NULL,
 CONSTRAINT [PK_SalesFigures] PRIMARY KEY CLUSTERED 
(
	[SalesRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 06/09/2020 17:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffId] [int] IDENTITY(1,1) NOT NULL,
	[ManagerId] [int] NULL,
	[Name] [varchar](50) NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyId], [Name]) VALUES (1, N'Steamship Mutual')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[SalesFigures] ON 

INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (1, CAST(N'2018-05-01' AS Date), 1230, 1)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (2, CAST(N'2019-12-01' AS Date), 567, 1)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (3, CAST(N'2019-11-18' AS Date), 677, 1)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (4, CAST(N'2020-08-01' AS Date), 156230, 1)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (5, CAST(N'2018-05-01' AS Date), 234, 2)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (6, CAST(N'2018-03-01' AS Date), 4354, 2)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (7, CAST(N'2018-05-01' AS Date), 456, 2)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (8, CAST(N'2019-05-01' AS Date), 567, 2)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (9, CAST(N'2018-09-01' AS Date), 78, 2)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (10, CAST(N'2020-05-01' AS Date), 789, 2)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (11, CAST(N'2020-05-19' AS Date), 234, 2)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (12, CAST(N'2020-05-17' AS Date), 4354, 2)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (13, CAST(N'2019-05-01' AS Date), 456, 2)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (14, CAST(N'2019-08-01' AS Date), 567, 2)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (15, CAST(N'2018-05-08' AS Date), 78, 2)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (16, CAST(N'2020-05-01' AS Date), 789, 2)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (17, CAST(N'2019-05-01' AS Date), 2334, 3)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (18, CAST(N'2019-05-01' AS Date), 5456, 3)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (19, CAST(N'2020-05-01' AS Date), 567, 3)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (20, CAST(N'2020-08-01' AS Date), 5345, 3)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (21, CAST(N'2018-05-01' AS Date), 234, 4)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (22, CAST(N'2018-05-20' AS Date), 645, 4)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (23, CAST(N'2019-05-01' AS Date), 5667, 5)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (24, CAST(N'2020-05-01' AS Date), 5678, 5)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (25, CAST(N'2018-08-01' AS Date), 789, 5)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (26, CAST(N'2019-10-01' AS Date), 345, 5)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (27, CAST(N'2019-05-25' AS Date), 676, 5)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (28, CAST(N'2018-05-01' AS Date), 566, 6)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (29, CAST(N'2019-05-01' AS Date), 8789, 6)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (30, CAST(N'2019-12-01' AS Date), 89089, 6)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (31, CAST(N'2020-05-01' AS Date), 34554, 7)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (32, CAST(N'2019-05-20' AS Date), 78866, 7)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (33, CAST(N'2020-08-01' AS Date), 784456, 8)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (34, CAST(N'2019-05-19' AS Date), 6745643, 8)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (35, CAST(N'2017-05-01' AS Date), 3434577, 8)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (36, CAST(N'2018-05-01' AS Date), 345, 8)
INSERT [dbo].[SalesFigures] ([SalesRef], [SalesDate], [SalesAmount], [StaffId]) VALUES (37, CAST(N'2019-01-01' AS Date), 45566, 8)
SET IDENTITY_INSERT [dbo].[SalesFigures] OFF
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([StaffId], [ManagerId], [Name], [CompanyId]) VALUES (1, NULL, N'Mario Speedwagon', 1)
INSERT [dbo].[Staff] ([StaffId], [ManagerId], [Name], [CompanyId]) VALUES (2, NULL, N'Petey Cruiser', 1)
INSERT [dbo].[Staff] ([StaffId], [ManagerId], [Name], [CompanyId]) VALUES (3, 1, N'Anna Sthesia', 1)
INSERT [dbo].[Staff] ([StaffId], [ManagerId], [Name], [CompanyId]) VALUES (4, 1, N'Paul Molive', 1)
INSERT [dbo].[Staff] ([StaffId], [ManagerId], [Name], [CompanyId]) VALUES (5, 1, N'Anna Mull', 1)
INSERT [dbo].[Staff] ([StaffId], [ManagerId], [Name], [CompanyId]) VALUES (6, 2, N'Gail Forcewind', 1)
INSERT [dbo].[Staff] ([StaffId], [ManagerId], [Name], [CompanyId]) VALUES (7, 2, N'Paige Turner', 1)
INSERT [dbo].[Staff] ([StaffId], [ManagerId], [Name], [CompanyId]) VALUES (8, 2, N'Bob Frapples', 1)
SET IDENTITY_INSERT [dbo].[Staff] OFF
ALTER TABLE [dbo].[SalesFigures]  WITH CHECK ADD  CONSTRAINT [FK_SalesFigures_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[SalesFigures] CHECK CONSTRAINT [FK_SalesFigures_Staff]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Company]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Staff] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Staff]
GO
USE [master]
GO
ALTER DATABASE [test] SET  READ_WRITE 
GO
