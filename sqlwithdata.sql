USE [master]
GO
/****** Object:  Database [Teacher_CourseDB]    Script Date: 2021-10-12 11:55:52 AM ******/
CREATE DATABASE [Teacher_CourseDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Teacher_CourseDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Teacher_CourseDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Teacher_CourseDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Teacher_CourseDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Teacher_CourseDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Teacher_CourseDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Teacher_CourseDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Teacher_CourseDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Teacher_CourseDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Teacher_CourseDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Teacher_CourseDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Teacher_CourseDB] SET  MULTI_USER 
GO
ALTER DATABASE [Teacher_CourseDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Teacher_CourseDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Teacher_CourseDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Teacher_CourseDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Teacher_CourseDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Teacher_CourseDB] SET QUERY_STORE = OFF
GO
USE [Teacher_CourseDB]
GO
/****** Object:  Table [dbo].[CourseAssignments]    Script Date: 2021-10-12 11:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssignments](
	[EmployeeId] [int] NOT NULL,
	[CourseCode] [nvarchar](50) NOT NULL,
	[GroupNumber] [int] NOT NULL,
	[AssignedDate] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2021-10-12 11:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseCode] [nvarchar](50) NOT NULL,
	[CourseTitle] [varchar](50) NOT NULL,
	[Duration] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2021-10-12 11:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[JobTitle] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 2021-10-12 11:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupNumber] [int] NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2021-10-12 11:55:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Courses] ([CourseCode], [CourseTitle], [Duration]) VALUES (N'COMP101', N'Introduction to Structure Programming', 90)
INSERT [dbo].[Courses] ([CourseCode], [CourseTitle], [Duration]) VALUES (N'COMP102', N'Advanced Object Programming in C# ', 75)
INSERT [dbo].[Courses] ([CourseCode], [CourseTitle], [Duration]) VALUES (N'COMP103', N'Introduction to Java', 75)
INSERT [dbo].[Courses] ([CourseCode], [CourseTitle], [Duration]) VALUES (N'COMP104', N'Advanced Programming in Java', 90)
INSERT [dbo].[Courses] ([CourseCode], [CourseTitle], [Duration]) VALUES (N'COMP105', N'Web Development with PHP', 90)
GO
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Email], [JobTitle]) VALUES (1234, N'Mary', N'Brown', N'mary@yahoo.com', N'Teacher')
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Email], [JobTitle]) VALUES (1235, N'Wei', N'Huang', N'wei@gmail.com', N'Teacher')
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Email], [JobTitle]) VALUES (1236, N'Michael', N'Freitag', N'michael@hotmail.com ', N'Teacher')
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Email], [JobTitle]) VALUES (4444, N'Henry', N'Cadieux', N'henry@yahoo.com', N'Coordinator')
GO
INSERT [dbo].[Groups] ([GroupNumber], [GroupName]) VALUES (1212, N'DEC Programming')
INSERT [dbo].[Groups] ([GroupNumber], [GroupName]) VALUES (1214, N'DEC Programming')
INSERT [dbo].[Groups] ([GroupNumber], [GroupName]) VALUES (1216, N'AEC Networking')
INSERT [dbo].[Groups] ([GroupNumber], [GroupName]) VALUES (1218, N'AEC Programming')
INSERT [dbo].[Groups] ([GroupNumber], [GroupName]) VALUES (1220, N'DEC Networking')
GO
INSERT [dbo].[Users] ([UserName], [Password]) VALUES (N'1234', N'Mary1234')
INSERT [dbo].[Users] ([UserName], [Password]) VALUES (N'1235', N'Wei1235')
INSERT [dbo].[Users] ([UserName], [Password]) VALUES (N'1236', N'Michael1236')
INSERT [dbo].[Users] ([UserName], [Password]) VALUES (N'4444', N'Henry4444')
GO
USE [master]
GO
ALTER DATABASE [Teacher_CourseDB] SET  READ_WRITE 
GO
