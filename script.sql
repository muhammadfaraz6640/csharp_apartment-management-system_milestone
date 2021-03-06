CREATE DATABASE [appartment] 
( NAME = N'appartment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\appartment.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'appartment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\appartment_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
/*GO
ALTER DATABASE [appartment] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [appartment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [appartment] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [appartment] SET ANSI_NULLS OFF
GO
ALTER DATABASE [appartment] SET ANSI_PADDING OFF
GO
ALTER DATABASE [appartment] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [appartment] SET ARITHABORT OFF
GO
ALTER DATABASE [appartment] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [appartment] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [appartment] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [appartment] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [appartment] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [appartment] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [appartment] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [appartment] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [appartment] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [appartment] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [appartment] SET  DISABLE_BROKER
GO
ALTER DATABASE [appartment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [appartment] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [appartment] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [appartment] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [appartment] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [appartment] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [appartment] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [appartment] SET  READ_WRITE
GO
ALTER DATABASE [appartment] SET RECOVERY FULL
GO
ALTER DATABASE [appartment] SET  MULTI_USER
GO
ALTER DATABASE [appartment] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [appartment] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'appartment', N'ON'
GO
USE [appartment]
GO*/
/****** Object:  Table [dbo].[tb]    Script Date: 07/13/2019 01:19:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb](
	[Fno] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Amount] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Date] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[resident]    Script Date: 07/13/2019 01:19:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resident](
	[Fno] [int] NOT NULL,
	[Members] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Pho] [nvarchar](50) NULL,
	[Nic] [nvarchar](50) NULL,
	[Room] [int] NULL,
	[Img] [nvarchar](50) NULL,
 CONSTRAINT [PK_resident] PRIMARY KEY CLUSTERED 
(
	[Fno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp]    Script Date: 07/13/2019 01:19:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp](
	[Serial] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CNIC] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Designation] [nvarchar](50) NULL,
	[Img] [nvarchar](50) NULL,
 CONSTRAINT [PK_emp] PRIMARY KEY CLUSTERED 
(
	[Serial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tenant]    Script Date: 07/13/2019 01:19:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tenant](
	[Flatno] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[fammem] [nvarchar](50) NULL,
	[Nic] [nvarchar](50) NULL,
	[Phno] [nvarchar](50) NULL,
	[Img1] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parking]    Script Date: 07/13/2019 01:19:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parking](
	[Fl] [int] NULL,
	[Model] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Pn] [nvarchar](50) NULL,
	[plno] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_tenant_resident]    Script Date: 07/13/2019 01:19:54 ******/
ALTER TABLE [dbo].[tenant]  WITH CHECK ADD  CONSTRAINT [FK_tenant_resident] FOREIGN KEY([Flatno])
REFERENCES [dbo].[resident] ([Fno])
GO
ALTER TABLE [dbo].[tenant] CHECK CONSTRAINT [FK_tenant_resident]
GO
/****** Object:  ForeignKey [FK_parking_resident]    Script Date: 07/13/2019 01:19:54 ******/
ALTER TABLE [dbo].[parking]  WITH CHECK ADD  CONSTRAINT [FK_parking_resident] FOREIGN KEY([Fl])
REFERENCES [dbo].[resident] ([Fno])
GO
ALTER TABLE [dbo].[parking] CHECK CONSTRAINT [FK_parking_resident]
GO
