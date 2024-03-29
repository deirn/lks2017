USE [master]
GO
/****** Object:  Database [LKSN2017]    Script Date: 15/02/2021 13:56:28 ******/
CREATE DATABASE [LKSN2017]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LKSN2017', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LKSN2017.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LKSN2017_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LKSN2017_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LKSN2017] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LKSN2017].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LKSN2017] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LKSN2017] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LKSN2017] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LKSN2017] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LKSN2017] SET ARITHABORT OFF 
GO
ALTER DATABASE [LKSN2017] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LKSN2017] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LKSN2017] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LKSN2017] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LKSN2017] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LKSN2017] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LKSN2017] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LKSN2017] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LKSN2017] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LKSN2017] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LKSN2017] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LKSN2017] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LKSN2017] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LKSN2017] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LKSN2017] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LKSN2017] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LKSN2017] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LKSN2017] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LKSN2017] SET  MULTI_USER 
GO
ALTER DATABASE [LKSN2017] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LKSN2017] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LKSN2017] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LKSN2017] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LKSN2017] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LKSN2017] SET QUERY_STORE = OFF
GO
USE [LKSN2017]
GO
/****** Object:  Table [dbo].[DetailSchedule]    Script Date: 15/02/2021 13:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailSchedule](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleId] [int] NULL,
	[SubjectId] [char](5) NULL,
	[TeacherId] [char](5) NULL,
	[Day] [varchar](10) NULL,
	[ShiftId] [int] NULL,
 CONSTRAINT [PK_DetailSchedule$] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HeaderSchedule]    Script Date: 15/02/2021 13:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeaderSchedule](
	[ScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](5) NULL,
	[Finalize] [int] NULL,
 CONSTRAINT [PK_HeaderSchedule$] PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shift]    Script Date: 15/02/2021 13:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shift](
	[ShiftId] [int] NOT NULL,
	[Time] [char](13) NULL,
 CONSTRAINT [PK_Shift$] PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 15/02/2021 13:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectId] [char](5) NOT NULL,
	[Name] [varchar](50) NULL,
	[Assignment] [int] NULL,
	[MidExam] [int] NULL,
	[FinalExam] [int] NULL,
	[Shift] [int] NULL,
	[ForGrade] [int] NULL,
 CONSTRAINT [PK_Subject$] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 15/02/2021 13:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [varchar](8) NOT NULL,
	[Name] [varchar](50) NULL,
	[PhoneNumber] [varchar](12) NULL,
	[DateofBirth] [date] NULL,
	[Gender] [varchar](7) NULL,
	[Address] [varchar](100) NULL,
	[Photo] [varchar](100) NULL,
 CONSTRAINT [PK_Teacher$] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Schedule]    Script Date: 15/02/2021 13:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Schedule]
AS
SELECT dbo.Subject.Name AS SubjectName, dbo.Teacher.Name AS TeacherName, dbo.HeaderSchedule.ClassName, dbo.DetailSchedule.Day, dbo.Shift.Time, dbo.DetailSchedule.SubjectId, dbo.DetailSchedule.TeacherId, 
                  dbo.DetailSchedule.ShiftId, dbo.DetailSchedule.ScheduleId, dbo.DetailSchedule.DetailId
FROM     dbo.DetailSchedule INNER JOIN
                  dbo.Subject ON dbo.DetailSchedule.SubjectId = dbo.Subject.SubjectId LEFT OUTER JOIN
                  dbo.Teacher ON dbo.DetailSchedule.TeacherId = dbo.Teacher.TeacherId INNER JOIN
                  dbo.Shift ON dbo.DetailSchedule.ShiftId = dbo.Shift.ShiftId INNER JOIN
                  dbo.HeaderSchedule ON dbo.DetailSchedule.ScheduleId = dbo.HeaderSchedule.ScheduleId
GO
/****** Object:  Table [dbo].[DetailClass]    Script Date: 15/02/2021 13:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailClass](
	[DetailClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](5) NULL,
	[StudentId] [varchar](8) NULL,
 CONSTRAINT [PK_DetailClass$] PRIMARY KEY CLUSTERED 
(
	[DetailClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 15/02/2021 13:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [varchar](8) NOT NULL,
	[Name] [varchar](50) NULL,
	[Address] [varchar](150) NULL,
	[Gender] [varchar](7) NULL,
	[DateofBirth] [date] NULL,
	[PhoneNumber] [varchar](12) NULL,
	[Photo] [varchar](100) NULL,
 CONSTRAINT [PK_Student$] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ClassStudent]    Script Date: 15/02/2021 13:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ClassStudent]
AS
SELECT dbo.DetailClass.ClassName, dbo.Student.StudentId, dbo.Student.Name, dbo.Student.Gender
FROM     dbo.DetailClass INNER JOIN
                  dbo.Student ON dbo.DetailClass.StudentId = dbo.Student.StudentId
GO
/****** Object:  Table [dbo].[DetailScore]    Script Date: 15/02/2021 13:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailScore](
	[ScoreDetailId] [int] IDENTITY(1,1) NOT NULL,
	[DetailId] [int] NOT NULL,
	[StudentId] [varchar](8) NOT NULL,
	[Assignment] [int] NULL,
	[MidExam] [int] NULL,
	[FinalExam] [int] NULL,
 CONSTRAINT [PK_DetailScore] PRIMARY KEY CLUSTERED 
(
	[ScoreDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StudentScore]    Script Date: 15/02/2021 13:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentScore]
AS
SELECT dbo.DetailScore.ScoreDetailId, dbo.DetailScore.StudentId, dbo.Student.Name AS StudentName, dbo.Subject.SubjectId, dbo.Subject.Name AS SubjectName, dbo.DetailScore.Assignment, dbo.DetailScore.MidExam, 
                  dbo.DetailScore.FinalExam
FROM     dbo.DetailScore INNER JOIN
                  dbo.Student ON dbo.DetailScore.StudentId = dbo.Student.StudentId INNER JOIN
                  dbo.DetailSchedule ON dbo.DetailScore.DetailId = dbo.DetailSchedule.DetailId INNER JOIN
                  dbo.Subject ON dbo.DetailSchedule.SubjectId = dbo.Subject.SubjectId
GO
/****** Object:  Table [dbo].[Class]    Script Date: 15/02/2021 13:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassName] [varchar](5) NOT NULL,
	[Grade] [int] NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expertise]    Script Date: 15/02/2021 13:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expertise](
	[ExpertiseId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [varchar](8) NOT NULL,
	[SubjectId] [char](5) NOT NULL,
 CONSTRAINT [PK_Expertise] PRIMARY KEY CLUSTERED 
(
	[ExpertiseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 15/02/2021 13:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](8) NULL,
	[password] [varchar](10) NULL,
	[role] [varchar](8) NULL,
 CONSTRAINT [PK_User$] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Class] ([ClassName], [Grade]) VALUES (N'XA', 1)
INSERT [dbo].[Class] ([ClassName], [Grade]) VALUES (N'XB', 1)
INSERT [dbo].[Class] ([ClassName], [Grade]) VALUES (N'XIA', 2)
INSERT [dbo].[Class] ([ClassName], [Grade]) VALUES (N'XIB', 2)
INSERT [dbo].[Class] ([ClassName], [Grade]) VALUES (N'XIIA', 3)
INSERT [dbo].[Class] ([ClassName], [Grade]) VALUES (N'XIIB', 3)
GO
SET IDENTITY_INSERT [dbo].[DetailClass] ON 

INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (2, N'XA', N'20170002')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (3, N'XA', N'20170003')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (4, N'XA', N'20170004')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (5, N'XA', N'20170005')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (6, N'XA', N'20170006')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (7, N'XA', N'20170007')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (8, N'XA', N'20170008')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (9, N'XA', N'20170009')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (10, N'XA', N'20170010')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (11, N'XB', N'20170011')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (12, N'XB', N'20170012')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (13, N'XB', N'20170013')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (14, N'XB', N'20170014')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (15, N'XB', N'20170015')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (16, N'XB', N'20170016')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (17, N'XB', N'20170017')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (18, N'XB', N'20170018')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (19, N'XB', N'20170019')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (20, N'XIA', N'20160001')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (21, N'XIA', N'20160002')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (22, N'XIA', N'20160003')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (23, N'XIA', N'20160004')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (24, N'XIA', N'20160005')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (25, N'XIA', N'20160006')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (26, N'XIA', N'20160007')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (27, N'XIA', N'20160008')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (28, N'XIA', N'20160009')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (29, N'XIB', N'20160010')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (30, N'XIB', N'20160011')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (31, N'XIB', N'20160012')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (32, N'XIB', N'20160013')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (33, N'XIB', N'20160014')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (34, N'XIB', N'20160015')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (35, N'XIB', N'20160016')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (36, N'XIB', N'20160017')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (37, N'XIB', N'20160018')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (39, N'XIIA', N'20150002')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (40, N'XIIA', N'20150003')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (41, N'XIIA', N'20150004')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (42, N'XIIA', N'20150005')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (43, N'XIIA', N'20150006')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (44, N'XIIA', N'20150007')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (45, N'XIIA', N'20150008')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (46, N'XIIB', N'20150009')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (47, N'XIIB', N'20150010')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (48, N'XIIB', N'20150011')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (49, N'XIIB', N'20150012')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (50, N'XIIB', N'20150013')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (51, N'XIIB', N'20150014')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (52, N'XIIB', N'20150015')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (56, N'XA', N'20150016')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (58, N'XIA', N'20150001')
SET IDENTITY_INSERT [dbo].[DetailClass] OFF
GO
SET IDENTITY_INSERT [dbo].[DetailSchedule] ON 

INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (1, 1, N'S1001', N'T0001', N'Monday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (2, 1, N'S1001', NULL, N'Monday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (3, 1, N'S1001', NULL, N'Monday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (4, 1, N'S1002', NULL, N'Monday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (5, 1, N'S1002', NULL, N'Monday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (6, 1, N'S1003', NULL, N'Tuesday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (7, 1, N'S1003', NULL, N'Tuesday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (8, 1, N'S1003', NULL, N'Wednesday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (9, 1, N'S1003', NULL, N'Wednesday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (10, 1, N'S1004', NULL, N'Wednesday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (11, 1, N'S1004', NULL, N'Wednesday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (12, 1, N'S1004', NULL, N'Tuesday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (13, 1, N'S1004', NULL, N'Tuesday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (14, 1, N'S1005', NULL, N'Monday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (15, 1, N'S1005', NULL, N'Monday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (16, 1, N'S1006', NULL, N'Monday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (17, 1, N'S1006', NULL, N'Tuesday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (18, 1, N'S1007', NULL, N'Tuesday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (19, 1, N'S1007', NULL, N'Tuesday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (20, 1, N'S1008', NULL, N'Wednesday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (21, 1, N'S1008', NULL, N'Wednesday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (22, 1, N'S1009', NULL, N'Thrusday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (23, 1, N'S1009', NULL, N'Thrusday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (24, 1, N'S1009', NULL, N'Thrusday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (25, 1, N'S1010', NULL, N'Thrusday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (26, 1, N'S1010', NULL, N'Thrusday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (27, 1, N'S1011', NULL, N'Wednesday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (28, 1, N'S1011', NULL, N'Wednesday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (29, 1, N'S1012', NULL, N'Friday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (30, 1, N'S1012', NULL, N'Friday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (31, 1, N'S1013', NULL, N'Friday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (32, 1, N'S1013', NULL, N'Friday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (33, 1, N'S1013', NULL, N'Saturday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (34, 1, N'S1013', NULL, N'Saturday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (35, 1, N'S1014', NULL, N'Tuesday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (36, 1, N'S1014', NULL, N'Friday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (37, 1, N'S1014', NULL, N'Friday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (38, 1, N'S1015', NULL, N'Thrusday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (39, 1, N'S1015', NULL, N'Saturday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (40, 1, N'S1015', NULL, N'Saturday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (41, 1, N'S1016', NULL, N'Thrusday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (42, 1, N'S1016', NULL, N'Thrusday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (43, 1, N'S1016', NULL, N'Saturday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (44, 1, N'S1016', NULL, N'Saturday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (45, 1, N'S1017', NULL, N'Friday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (46, 1, N'S1017', NULL, N'Friday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (47, 1, N'S1017', NULL, N'Saturday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (48, 1, N'S1017', NULL, N'Saturday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (49, 2, N'S2001', NULL, N'Monday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (50, 2, N'S2001', NULL, N'Tuesday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (51, 2, N'S2001', NULL, N'Wednesday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (52, 2, N'S2002', NULL, N'Monday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (53, 2, N'S2002', NULL, N'Tuesday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (54, 2, N'S2003', NULL, N'Wednesday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (55, 2, N'S2003', NULL, N'Wednesday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (56, 2, N'S2003', NULL, N'Thrusday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (57, 2, N'S2003', NULL, N'Thrusday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (58, 2, N'S2004', NULL, N'Monday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (59, 2, N'S2004', NULL, N'Monday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (60, 2, N'S2004', NULL, N'Tuesday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (61, 2, N'S2004', NULL, N'Tuesday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (62, 2, N'S2005', NULL, N'Monday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (63, 2, N'S2005', NULL, N'Monday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (64, 2, N'S2006', NULL, N'Monday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (65, 2, N'S2006', NULL, N'Monday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (66, 2, N'S2007', NULL, N'Tuesday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (67, 2, N'S2007', NULL, N'Tuesday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (68, 2, N'S2008', NULL, N'Tuesday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (69, 2, N'S2008', NULL, N'Tuesday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (70, 2, N'S2009', NULL, N'Wednesday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (71, 2, N'S2009', NULL, N'Wednesday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (72, 2, N'S2009', NULL, N'Wednesday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (73, 2, N'S2010', NULL, N'Wednesday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (74, 2, N'S2010', NULL, N'Wednesday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (75, 2, N'S2011', NULL, N'Thrusday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (76, 2, N'S2011', NULL, N'Thrusday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (77, 2, N'S2011', NULL, N'Thrusday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (78, 2, N'S2011', NULL, N'Thrusday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (79, 2, N'S2012', NULL, N'Friday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (80, 2, N'S2012', NULL, N'Friday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (81, 2, N'S2012', NULL, N'Saturday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (82, 2, N'S2012', NULL, N'Saturday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (83, 2, N'S2013', NULL, N'Thrusday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (84, 2, N'S2013', NULL, N'Thrusday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (85, 2, N'S2014', NULL, N'Friday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (86, 2, N'S2014', NULL, N'Friday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (87, 2, N'S2014', NULL, N'Saturday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (88, 2, N'S2014', NULL, N'Saturday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (89, 2, N'S2015', NULL, N'Friday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (90, 2, N'S2015', NULL, N'Friday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (91, 2, N'S2015', NULL, N'Saturday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (92, 2, N'S2015', NULL, N'Saturday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (93, 2, N'S2016', NULL, N'Friday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (94, 2, N'S2016', NULL, N'Friday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (95, 2, N'S2016', NULL, N'Saturday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (96, 2, N'S2016', NULL, N'Saturday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (97, 3, N'S2001', NULL, N'Saturday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (98, 3, N'S2001', NULL, N'Friday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (99, 3, N'S2001', NULL, N'Thrusday', 1)
GO
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (100, 3, N'S2002', NULL, N'Saturday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (101, 3, N'S2002', NULL, N'Friday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (102, 3, N'S2003', NULL, N'Thrusday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (103, 3, N'S2003', NULL, N'Thrusday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (104, 3, N'S2003', NULL, N'Wednesday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (105, 3, N'S2003', NULL, N'Wednesday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (106, 3, N'S2004', NULL, N'Saturday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (107, 3, N'S2004', NULL, N'Saturday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (108, 3, N'S2004', NULL, N'Friday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (109, 3, N'S2004', NULL, N'Friday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (110, 3, N'S2005', NULL, N'Saturday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (111, 3, N'S2005', NULL, N'Saturday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (112, 3, N'S2006', NULL, N'Saturday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (113, 3, N'S2006', NULL, N'Saturday', 8)
SET IDENTITY_INSERT [dbo].[DetailSchedule] OFF
GO
SET IDENTITY_INSERT [dbo].[DetailScore] ON 

INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (1, 29, N'20170012', 55, 16, 59)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (2, 6, N'20170003', 98, 16, 63)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (3, 10, N'20170004', 75, 22, 47)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (4, 16, N'20170006', 81, 22, 62)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (5, 35, N'20170014', 40, 22, 45)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (6, 4, N'20170019', 83, 22, 59)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (7, 22, N'20170009', 66, 22, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (8, 20, N'20170008', 48, 22, 44)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (9, 4, N'20170002', 87, 22, 44)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (10, 1, N'20170001', 74, 23, 56)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (11, 1, N'20170018', 78, 23, 61)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (12, 18, N'20170007', 80, 23, 52)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (13, 38, N'20170015', 60, 23, 51)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (14, 45, N'20170017', 50, 23, 46)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (15, 27, N'20170011', 53, 24, 60)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (16, 31, N'20170013', 77, 24, 76)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (17, 41, N'20170016', 88, 42, 86)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (18, 25, N'20170010', 65, 46, 64)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (19, 14, N'20170005', 77, 51, 69)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (20, 64, N'20160006', 69, 58, 69)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (21, 58, N'20160004', 43, 59, 76)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (22, 52, N'20160018', 91, 62, 81)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (23, 68, N'20160008', 57, 64, 64)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (24, 83, N'20160013', 49, 65, 66)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (25, 89, N'20160015', 51, 70, 69)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (26, 73, N'20160010', 94, 76, 73)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (27, 75, N'20160011', 69, 77, 75)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (28, 85, N'20160014', 81, 86, 88)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (29, 54, N'20160003', 84, 86, 90)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (30, 70, N'20160009', 44, 90, 78)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (31, 93, N'20160016', 75, 99, 91)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (32, 52, N'20160002', 81, 52, 70)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (33, 66, N'20160007', 92, 76, 78)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (34, 49, N'20160001', 59, 42, 44)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (35, 49, N'20160017', 80, 77, 95)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (36, 62, N'20160005', 72, 74, 66)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (37, 79, N'20160012', 89, 96, 65)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (38, 100, N'20150014', 67, 43, 54)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (39, 110, N'20150005', 42, 94, 82)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (40, 97, N'20150007', 54, 94, 73)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (41, 100, N'20150002', 57, 100, 54)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (42, 112, N'20150006', 71, 91, 95)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (43, 106, N'20150010', 98, 73, 54)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (44, 97, N'20150013', 79, 60, 46)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (45, 110, N'20150011', 44, 73, 82)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (46, 102, N'20150009', 43, 78, 44)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (47, 106, N'20150016', 44, 73, 49)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (48, 97, N'20150001', 61, 86, 43)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (49, 102, N'20150015', 79, 79, 65)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (50, 100, N'20150008', 48, 70, 55)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (51, 112, N'20150012', 87, 94, 84)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (52, 106, N'20150004', 46, 73, 62)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (53, 102, N'20150003', 81, 99, 82)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (54, 4, N'20170019', 75, 80, 57)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (55, 1, N'20170018', 65, 50, 71)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (56, 45, N'20170017', 52, 86, 65)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (57, 41, N'20170016', 47, 80, 84)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (58, 38, N'20170015', 50, 72, 42)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (59, 35, N'20170014', 70, 86, 83)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (60, 31, N'20170013', 58, 92, 82)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (61, 29, N'20170012', 65, 74, 100)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (62, 27, N'20170011', 48, 62, 98)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (63, 25, N'20170010', 98, 66, 55)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (64, 22, N'20170009', 98, 65, 46)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (65, 20, N'20170008', 60, 58, 68)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (66, 18, N'20170007', 98, 68, 61)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (67, 16, N'20170006', 58, 51, 92)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (68, 14, N'20170005', 82, 81, 74)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (69, 10, N'20170004', 45, 54, 89)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (70, 6, N'20170003', 89, 77, 82)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (71, 4, N'20170002', 40, 64, 68)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (72, 1, N'20170001', 99, 67, 54)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (73, 85, N'20160014', 89, 91, 52)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (74, 66, N'20160007', 84, 53, 70)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (75, 62, N'20160005', 48, 69, 40)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (76, 49, N'20160017', 63, 42, 54)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (77, 75, N'20160011', 74, 42, 46)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (78, 54, N'20160003', 63, 67, 82)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (79, 68, N'20160008', 84, 80, 89)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (80, 83, N'20160013', 61, 78, 93)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (81, 52, N'20160018', 78, 41, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (82, 64, N'20160006', 80, 88, 77)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (83, 49, N'20160001', 68, 72, 60)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (84, 79, N'20160012', 78, 50, 83)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (85, 93, N'20160016', 42, 92, 77)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (86, 58, N'20160004', 43, 75, 98)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (87, 89, N'20160015', 74, 64, 95)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (88, 73, N'20160010', 84, 71, 99)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (89, 70, N'20160009', 88, 93, 84)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (90, 52, N'20160002', 68, 97, 60)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (91, 112, N'20150012', 82, 60, 74)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (92, 106, N'20150004', 53, 69, 97)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (93, 100, N'20150008', 80, 96, 42)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (94, 112, N'20150006', 53, 99, 53)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (95, 102, N'20150003', 52, 55, 52)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (96, 110, N'20150005', 46, 42, 59)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (97, 97, N'20150013', 59, 67, 49)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (98, 97, N'20150007', 66, 43, 42)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (99, 100, N'20150002', 49, 64, 89)
GO
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (100, 106, N'20150010', 65, 67, 40)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (101, 110, N'20150011', 66, 84, 87)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (102, 102, N'20150009', 93, 98, 76)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (103, 100, N'20150014', 45, 92, 74)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (104, 97, N'20150001', 40, 89, 52)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (105, 102, N'20150015', 72, 64, 65)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (106, 106, N'20150016', 58, 93, 67)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (107, 38, N'20170015', 92, 65, 40)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (108, 20, N'20170008', 54, 62, 54)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (109, 16, N'20170006', 84, 57, 94)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (110, 10, N'20170004', 49, 55, 100)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (111, 29, N'20170012', 100, 78, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (112, 45, N'20170017', 70, 81, 43)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (113, 14, N'20170005', 100, 58, 73)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (114, 31, N'20170013', 69, 63, 100)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (115, 4, N'20170002', 95, 52, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (116, 35, N'20170014', 45, 94, 99)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (117, 27, N'20170011', 92, 67, 89)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (118, 22, N'20170009', 95, 44, 55)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (119, 25, N'20170010', 52, 82, 45)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (120, 1, N'20170001', 55, 43, 48)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (121, 41, N'20170016', 63, 86, 47)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (122, 6, N'20170003', 72, 40, 40)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (123, 18, N'20170007', 88, 53, 97)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (124, 1, N'20170018', 63, 84, 64)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (125, 4, N'20170019', 83, 81, 68)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (126, 85, N'20160014', 77, 90, 44)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (127, 58, N'20160004', 85, 58, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (128, 79, N'20160012', 67, 70, 92)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (129, 49, N'20160001', 63, 83, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (130, 52, N'20160018', 65, 63, 79)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (131, 49, N'20160017', 42, 85, 85)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (132, 68, N'20160008', 99, 62, 98)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (133, 89, N'20160015', 42, 47, 54)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (134, 64, N'20160006', 80, 67, 96)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (135, 70, N'20160009', 71, 65, 79)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (136, 73, N'20160010', 77, 63, 80)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (137, 66, N'20160007', 99, 42, 48)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (138, 52, N'20160002', 86, 55, 98)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (139, 54, N'20160003', 77, 62, 87)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (140, 75, N'20160011', 87, 46, 47)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (141, 83, N'20160013', 62, 41, 62)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (142, 62, N'20160005', 77, 85, 60)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (143, 93, N'20160016', 53, 71, 96)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (144, 97, N'20150007', 46, 98, 54)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (145, 102, N'20150003', 43, 62, 98)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (146, 106, N'20150010', 53, 67, 98)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (147, 112, N'20150006', 72, 99, 47)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (148, 100, N'20150014', 88, 69, 65)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (149, 102, N'20150015', 77, 95, 63)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (150, 102, N'20150009', 95, 90, 53)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (151, 106, N'20150016', 84, 80, 64)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (152, 106, N'20150004', 48, 61, 80)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (153, 97, N'20150013', 54, 43, 58)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (154, 97, N'20150001', 97, 93, 85)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (155, 110, N'20150011', 95, 78, 47)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (156, 100, N'20150008', 54, 58, 57)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (157, 100, N'20150002', 85, 40, 97)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (158, 110, N'20150005', 94, 84, 98)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (159, 112, N'20150012', 81, 86, 60)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (160, 25, N'20170010', 86, 83, 80)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (161, 45, N'20170017', 50, 47, 98)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (162, 27, N'20170011', 75, 64, 80)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (163, 38, N'20170015', 87, 50, 56)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (164, 35, N'20170014', 71, 76, 98)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (165, 22, N'20170009', 81, 64, 73)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (166, 6, N'20170003', 97, 46, 45)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (167, 1, N'20170018', 74, 97, 80)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (168, 1, N'20170001', 99, 60, 51)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (169, 41, N'20170016', 77, 47, 87)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (170, 10, N'20170004', 82, 71, 71)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (171, 16, N'20170006', 93, 63, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (172, 4, N'20170019', 94, 48, 72)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (173, 29, N'20170012', 77, 49, 95)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (174, 14, N'20170005', 92, 96, 58)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (175, 31, N'20170013', 58, 58, 82)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (176, 18, N'20170007', 69, 47, 73)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (177, 20, N'20170008', 55, 68, 57)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (178, 4, N'20170002', 80, 90, 75)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (179, 70, N'20160009', 73, 41, 71)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (180, 52, N'20160002', 65, 59, 40)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (181, 75, N'20160011', 56, 60, 76)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (182, 93, N'20160016', 76, 77, 60)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (183, 49, N'20160001', 55, 99, 57)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (184, 83, N'20160013', 91, 73, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (185, 64, N'20160006', 84, 58, 75)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (186, 58, N'20160004', 40, 79, 71)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (187, 89, N'20160015', 82, 57, 97)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (188, 85, N'20160014', 87, 99, 84)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (189, 49, N'20160017', 66, 51, 99)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (190, 54, N'20160003', 62, 79, 92)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (191, 66, N'20160007', 47, 99, 79)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (192, 79, N'20160012', 86, 64, 95)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (193, 73, N'20160010', 87, 49, 81)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (194, 68, N'20160008', 58, 71, 67)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (195, 52, N'20160018', 75, 65, 58)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (196, 62, N'20160005', 51, 96, 91)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (197, 110, N'20150005', 51, 95, 75)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (198, 110, N'20150011', 100, 71, 91)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (199, 100, N'20150002', 63, 65, 94)
GO
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (200, 112, N'20150012', 69, 81, 59)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (201, 106, N'20150016', 49, 95, 54)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (202, 97, N'20150013', 96, 71, 90)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (203, 100, N'20150014', 99, 51, 67)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (204, 106, N'20150004', 86, 74, 94)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (205, 106, N'20150010', 40, 85, 91)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (206, 97, N'20150007', 47, 55, 67)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (207, 102, N'20150015', 80, 96, 76)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (208, 100, N'20150008', 61, 59, 58)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (209, 102, N'20150009', 77, 69, 44)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (210, 112, N'20150006', 56, 94, 100)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (211, 102, N'20150003', 70, 54, 50)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (212, 97, N'20150001', 73, 95, 100)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (213, 6, N'20170003', 96, 90, 87)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (214, 20, N'20170008', 87, 94, 48)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (215, 1, N'20170018', 55, 100, 87)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (216, 31, N'20170013', 45, 44, 84)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (217, 38, N'20170015', 42, 55, 68)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (218, 41, N'20170016', 97, 77, 100)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (219, 10, N'20170004', 83, 45, 66)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (220, 4, N'20170019', 68, 88, 51)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (221, 16, N'20170006', 58, 90, 75)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (222, 1, N'20170001', 46, 67, 99)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (223, 35, N'20170014', 83, 94, 50)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (224, 27, N'20170011', 45, 87, 97)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (225, 18, N'20170007', 89, 87, 93)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (226, 45, N'20170017', 85, 69, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (227, 25, N'20170010', 87, 44, 63)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (228, 4, N'20170002', 75, 61, 68)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (229, 29, N'20170012', 81, 54, 40)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (230, 22, N'20170009', 78, 40, 68)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (231, 14, N'20170005', 61, 95, 58)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (232, 52, N'20160002', 93, 94, 73)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (233, 70, N'20160009', 40, 85, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (234, 66, N'20160007', 89, 43, 90)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (235, 68, N'20160008', 51, 68, 61)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (236, 49, N'20160001', 94, 67, 94)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (237, 64, N'20160006', 91, 79, 51)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (238, 85, N'20160014', 51, 43, 76)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (239, 73, N'20160010', 75, 75, 43)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (240, 93, N'20160016', 56, 78, 46)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (241, 89, N'20160015', 76, 60, 46)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (242, 79, N'20160012', 48, 51, 46)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (243, 49, N'20160017', 64, 58, 57)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (244, 75, N'20160011', 61, 40, 94)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (245, 58, N'20160004', 97, 51, 62)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (246, 62, N'20160005', 63, 81, 98)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (247, 83, N'20160013', 78, 50, 95)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (248, 52, N'20160018', 88, 53, 88)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (249, 54, N'20160003', 100, 57, 100)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (250, 97, N'20150013', 74, 61, 56)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (251, 100, N'20150014', 89, 80, 42)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (252, 102, N'20150009', 88, 45, 97)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (253, 106, N'20150016', 43, 54, 61)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (254, 112, N'20150012', 66, 77, 92)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (255, 102, N'20150003', 72, 44, 40)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (256, 110, N'20150005', 67, 52, 94)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (257, 102, N'20150015', 55, 70, 83)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (258, 97, N'20150001', 55, 89, 89)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (259, 97, N'20150007', 65, 69, 70)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (260, 106, N'20150004', 79, 43, 96)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (261, 100, N'20150008', 76, 85, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (262, 110, N'20150011', 100, 95, 60)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (263, 106, N'20150010', 58, 57, 78)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (264, 112, N'20150006', 94, 90, 97)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [DetailId], [StudentId], [Assignment], [MidExam], [FinalExam]) VALUES (265, 100, N'20150002', 55, 48, 60)
SET IDENTITY_INSERT [dbo].[DetailScore] OFF
GO
SET IDENTITY_INSERT [dbo].[Expertise] ON 

INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (1, N'T0016', N'S3003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (2, N'T0020', N'S3007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (3, N'T0016', N'S1009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (4, N'T0003', N'S2006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (5, N'T0012', N'S1005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (6, N'T0003', N'S1003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (7, N'T0006', N'S2009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (8, N'T0009', N'S1002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (9, N'T0007', N'S1007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (10, N'T0007', N'S3014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (11, N'T0004', N'S2007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (12, N'T0012', N'S1012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (13, N'T0013', N'S2016')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (14, N'T0006', N'S3013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (15, N'T0015', N'S1008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (16, N'T0014', N'S1014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (17, N'T0014', N'S1007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (18, N'T0017', N'S1010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (19, N'T0008', N'S2011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (20, N'T0018', N'S1011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (21, N'T0007', N'S2010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (22, N'T0018', N'S2001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (23, N'T0009', N'S2012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (24, N'T0010', N'S1010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (25, N'T0001', N'S2004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (26, N'T0005', N'S3012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (27, N'T0003', N'S3010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (28, N'T0010', N'S1003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (29, N'T0008', N'S1008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (30, N'T0017', N'S1017')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (31, N'T0015', N'S3002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (32, N'T0014', N'S3001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (33, N'T0020', N'S1013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (34, N'T0002', N'S3009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (35, N'T0010', N'S2013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (36, N'T0019', N'S2002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (37, N'T0005', N'S1005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (38, N'T0016', N'S1016')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (39, N'T0004', N'S3011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (40, N'T0005', N'S2008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (41, N'T0017', N'S3004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (42, N'T0002', N'S2005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (43, N'T0013', N'S1006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (44, N'T0009', N'S1009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (45, N'T0018', N'S3005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (46, N'T0002', N'S1002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (47, N'T0020', N'S2003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (48, N'T0001', N'S1001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (49, N'T0013', N'S1013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (50, N'T0012', N'S2015')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (51, N'T0006', N'S1006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (52, N'T0011', N'S1011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (53, N'T0019', N'S3006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (54, N'T0004', N'S1004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (55, N'T0011', N'S2014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (56, N'T0019', N'S1012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (57, N'T0015', N'S1015')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (58, N'T0008', N'S1001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (59, N'T0011', N'S1004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (60, N'T0001', N'S3008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (61, N'T0015', N'S2003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (62, N'T0007', N'S1001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (63, N'T0001', N'S1002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (64, N'T0002', N'S1003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (65, N'T0003', N'S1004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (66, N'T0004', N'S1005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (67, N'T0005', N'S1006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (68, N'T0006', N'S1007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (69, N'T0007', N'S1008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (70, N'T0008', N'S1009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (71, N'T0009', N'S1010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (72, N'T0010', N'S1011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (73, N'T0011', N'S1012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (74, N'T0012', N'S1013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (75, N'T0013', N'S1014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (76, N'T0014', N'S1015')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (77, N'T0015', N'S1016')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (78, N'T0016', N'S1017')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (79, N'T0017', N'S2001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (80, N'T0018', N'S2002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (81, N'T0019', N'S2003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (82, N'T0020', N'S2004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (83, N'T0001', N'S2005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (84, N'T0002', N'S2006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (85, N'T0003', N'S2007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (86, N'T0004', N'S2008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (87, N'T0005', N'S2009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (88, N'T0006', N'S2010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (89, N'T0007', N'S2011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (90, N'T0008', N'S2012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (91, N'T0009', N'S2013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (92, N'T0010', N'S2014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (93, N'T0011', N'S2015')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (94, N'T0012', N'S2016')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (95, N'T0013', N'S3001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (96, N'T0014', N'S3002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (97, N'T0015', N'S3003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (98, N'T0016', N'S3004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (99, N'T0017', N'S3005')
GO
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (100, N'T0018', N'S3006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (101, N'T0019', N'S3007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (102, N'T0020', N'S3008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (103, N'T0001', N'S3009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (104, N'T0002', N'S3010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (105, N'T0003', N'S3011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (106, N'T0004', N'S3012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (107, N'T0005', N'S3013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (108, N'T0006', N'S3014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (109, N'T0020', N'S1014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (110, N'T0019', N'S1015')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (111, N'T0018', N'S1016')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (112, N'T0005', N'S1017')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (113, N'T0016', N'S2001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (114, N'T0015', N'S2002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (115, N'T0014', N'S2003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (116, N'T0013', N'S2004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (117, N'T0012', N'S2005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (118, N'T0011', N'S2006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (119, N'T0010', N'S2007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (120, N'T0009', N'S2008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (121, N'T0008', N'S2009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (122, N'T0017', N'S2010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (123, N'T0006', N'S2011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (124, N'T0005', N'S2012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (125, N'T0004', N'S2013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (126, N'T0003', N'S2014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (127, N'T0002', N'S2015')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (128, N'T0001', N'S2016')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (129, N'T0020', N'S3001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (130, N'T0019', N'S3002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (131, N'T0018', N'S3003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (132, N'T0012', N'S3004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (133, N'T0016', N'S3005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (134, N'T0015', N'S3006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (135, N'T0014', N'S3007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (136, N'T0013', N'S3008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (137, N'T0012', N'S3009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (138, N'T0011', N'S3010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (139, N'T0010', N'S3011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (140, N'T0009', N'S3012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (141, N'T0008', N'S3013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (142, N'T0019', N'S3014')
SET IDENTITY_INSERT [dbo].[Expertise] OFF
GO
SET IDENTITY_INSERT [dbo].[HeaderSchedule] ON 

INSERT [dbo].[HeaderSchedule] ([ScheduleId], [ClassName], [Finalize]) VALUES (1, N'XA', 1)
INSERT [dbo].[HeaderSchedule] ([ScheduleId], [ClassName], [Finalize]) VALUES (2, N'XB', 0)
INSERT [dbo].[HeaderSchedule] ([ScheduleId], [ClassName], [Finalize]) VALUES (3, N'XIA', 1)
INSERT [dbo].[HeaderSchedule] ([ScheduleId], [ClassName], [Finalize]) VALUES (4, N'XIB', 0)
INSERT [dbo].[HeaderSchedule] ([ScheduleId], [ClassName], [Finalize]) VALUES (5, N'XIIA', 0)
INSERT [dbo].[HeaderSchedule] ([ScheduleId], [ClassName], [Finalize]) VALUES (6, N'XIIB', 0)
SET IDENTITY_INSERT [dbo].[HeaderSchedule] OFF
GO
INSERT [dbo].[Shift] ([ShiftId], [Time]) VALUES (1, N'07:00 - 07:50')
INSERT [dbo].[Shift] ([ShiftId], [Time]) VALUES (2, N'07:50 - 08:40')
INSERT [dbo].[Shift] ([ShiftId], [Time]) VALUES (3, N'08:40 - 09:30')
INSERT [dbo].[Shift] ([ShiftId], [Time]) VALUES (4, N'09:50 - 10:40')
INSERT [dbo].[Shift] ([ShiftId], [Time]) VALUES (5, N'10:40 - 11:30')
INSERT [dbo].[Shift] ([ShiftId], [Time]) VALUES (6, N'11:30 - 12:20')
INSERT [dbo].[Shift] ([ShiftId], [Time]) VALUES (7, N'12:40 - 13:30')
INSERT [dbo].[Shift] ([ShiftId], [Time]) VALUES (8, N'13:30 - 14:20')
GO
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150001', N'M. ARIF BASRI', N'264 Burrows Center', N'Male', CAST(N'1999-05-19' AS Date), N'081235509036', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150002', N'MARTINUS GAI BARA LIRA PARERA', N'2704 Barnett Avenue', N'Male', CAST(N'1999-05-20' AS Date), N'0818765488', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150003', N'MARVIN FURIANTO', N'1 Chinook Hill', N'Male', CAST(N'1999-05-21' AS Date), N'08165384904', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150004', N'MOHAMAD FATHUR BAWAFIE', N'7 Comanche Point', N'Male', CAST(N'1999-05-22' AS Date), N'0812357490', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150005', N'MUHAMMAD FADIL KAMAL', N'91597 Service Park', N'Male', CAST(N'1999-05-23' AS Date), N'0819475858', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150006', N'MUHAMMAD FARHAN HIDAYAT', N'3 Bluestem Center', N'Male', CAST(N'1999-05-24' AS Date), N'08135454532', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150007', N'MUHAMMAD HANIF', N'5 Oneill Hill', N'Male', CAST(N'1999-05-25' AS Date), N'08132757599', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150008', N'MUHAMMAD ILHAM RAHMADI', N'6 Steensland Place', N'Male', CAST(N'1999-05-26' AS Date), N'0812675899', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150009', N'MUHAMMAD REYNALDI', N'10030 Fieldstone Plaza', N'Male', CAST(N'1999-05-27' AS Date), N'0812546789', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150010', N'NAMIRA MUFIDA ADIEN', N'9 Parkside Court', N'Female', CAST(N'1999-05-28' AS Date), N'08123565332', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150011', N'NIXON', N'2365 Ridge Oak Drive', N'Male', CAST(N'1999-05-29' AS Date), N'08528564744', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150012', N'RIANDA ANGGAR KUSUMA', N'4 Hoffman Avenue', N'Male', CAST(N'1999-05-30' AS Date), N'08126754554', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150013', N'RICKY RIZALDI', N'7634 Gerald Point', N'Male', CAST(N'1999-05-31' AS Date), N'08164954777', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150014', N'SAMUEL BUDIMAN', N'97564 Westport Avenue', N'Male', CAST(N'1999-06-01' AS Date), N'08172554678', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150015', N'SAMUEL SANJAYA SUTANTO', N'771 Meadow Valley Lane', N'Male', CAST(N'1999-06-02' AS Date), N'0818204773', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150016', N'SHAVIRA', N'96 Elmside Place', N'Female', CAST(N'1999-06-03' AS Date), N'08135678494', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160001', N'HAM, RICHARD ADHIKA HARTONO', N'20805 Sunfield Alley', N'Male', CAST(N'2000-09-17' AS Date), N'0812889798', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160002', N'HENDRAWAN HADIKUSUMA', N'083 Center Trail', N'Male', CAST(N'2000-09-18' AS Date), N'08523677748', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160003', N'IGNATIUS KEVIN LANATA', N'7 Monterey Alley', N'Male', CAST(N'2000-09-19' AS Date), N'08577565555', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160004', N'INDRA KURNIAWAN', N'05888 Moland Way', N'Male', CAST(N'2000-09-20' AS Date), N'08123556565', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160005', N'JEREMY SETIAWAN', N'7 Pleasure Trail', N'Male', CAST(N'2000-09-21' AS Date), N'08123556676', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160006', N'JOHAN', N'6853 Kenwood Place', N'Male', CAST(N'2000-09-22' AS Date), N'08129674399', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160007', N'KATILI JIWO ADI WIYONO', N'38 Northport Circle', N'Male', CAST(N'2000-09-23' AS Date), N'08123657645', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160008', N'KEVIN FAUSTA', N'9652 Lunder Way', N'Male', CAST(N'2000-09-24' AS Date), N'08126643434', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160009', N'KEVIN HADINATA', N'819 Debra Alley', N'Male', CAST(N'2000-09-25' AS Date), N'0812332555', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160010', N'KEVIN KUSWANDI', N'610 Columbus Center', N'Male', CAST(N'2000-09-26' AS Date), N'0812366454', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160011', N'KEVIN SETIADI GUNAWAN', N'24727 Northwestern Avenue', N'Male', CAST(N'2000-09-27' AS Date), N'08125656767', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160012', N'KEVIN YULIAS', N'355 Troy Hill', N'Male', CAST(N'2000-09-28' AS Date), N'0812355665', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160013', N'KRESNA ADJIE DEWANTARA', N'00751 Center Court', N'Male', CAST(N'2000-09-29' AS Date), N'0818407446', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160014', N'LAYARDA PUTRA ANGKASA', N'1551 Lyons Point', N'Male', CAST(N'2000-09-30' AS Date), N'0819475656', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160015', N'LEON NATANTO', N'354 Nobel Alley', N'Male', CAST(N'2000-10-01' AS Date), N'08125678966', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160016', N'LEONARDO KURNIAWAN', N'44 Loeprich Trail', N'Male', CAST(N'2000-10-02' AS Date), N'089965474894', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160017', N'LISA INDRAPUTRI', N'7617 Manley Junction', N'Female', CAST(N'2000-10-03' AS Date), N'08957447999', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160018', N'M YOGA PRANATA', N'43819 Namekagon Circle', N'Male', CAST(N'2000-10-04' AS Date), N'0813873535', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170001', N'ACHMAD RAFII SYAFRAN', N'2 Starling Drive', N'Male', CAST(N'2001-05-15' AS Date), N'08124556565', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170002', N'ADITYA PUTRA BUDIMAN', N'672 Swallow Trail', N'Male', CAST(N'2001-05-16' AS Date), N'0812356565', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170003', N'ALBERT PRATAMA PUTRA TJHIA', N'94327 Moland Avenue', N'Male', CAST(N'2001-05-17' AS Date), N'0816565343', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170004', N'ANDI LIWANTORO SUSANTO', N'73 Hoffman Hill', N'Male', CAST(N'2001-05-18' AS Date), N'08127998343', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170005', N'AUDIA LAVENA', N'20 Hanover Plaza', N'Female', CAST(N'2001-05-19' AS Date), N'08124566465', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170006', N'BELIGA', N'49 Sullivan Street', N'Male', CAST(N'2001-05-20' AS Date), N'081236656544', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170007', N'BRYAN', N'62946 Nevada Place', N'Male', CAST(N'2001-05-21' AS Date), N'08525676767', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170008', N'CALVIN LAURENSIUS NATA', N'400 Northview Parkway', N'Male', CAST(N'2001-05-22' AS Date), N'08125656545', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170009', N'CALVIN THEMDUANG', N'180 Bay Way', N'Male', CAST(N'2001-05-23' AS Date), N'08125652343', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170010', N'CARISSA', N'26 Golf Course Court', N'Female', CAST(N'2001-05-24' AS Date), N'0819556563', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170011', N'CHANDRA BUNJAYA', N'089 Northridge Place', N'Male', CAST(N'2001-05-25' AS Date), N'0818356565', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170012', N'CHRISTIN YOHANA', N'860 Northwestern Point', N'Female', CAST(N'2001-05-26' AS Date), N'08180754663', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170013', N'CORNELLIUS GANOR ALBARADIE', N'8 Lukken Parkway', N'Male', CAST(N'2001-05-27' AS Date), N'08123555666', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170014', N'DEDDY SUPRIYADI', N'32 Carpenter Avenue', N'Male', CAST(N'2001-05-28' AS Date), N'08123653332', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170015', N'EDWINDO LAURENZO WIJANTO', N'4532 Pond Avenue', N'Male', CAST(N'2001-05-29' AS Date), N'081235563132', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170016', N'EZRA INDRASTATA SPINOZA', N'0 Dunning Junction', N'Male', CAST(N'2001-05-30' AS Date), N'08135656563', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170017', N'FAJRUL EMIRULLAH', N'13455 Grover Center', N'Male', CAST(N'2001-05-31' AS Date), N'085659766353', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170018', N'FREDRICK WIDJAYA', N'3 Anhalt Place', N'Male', CAST(N'2001-10-17' AS Date), N'083155665450', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170019', N'GERALDY OSCAR REINARD', N'520 Northridge Point', N'Male', CAST(N'2001-06-02' AS Date), N'08123656564', NULL)
GO
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1001', N'agama', 20, 30, 50, 3, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1002', N'PKN', 20, 30, 50, 2, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1003', N'bahasa indonesia', 30, 35, 35, 4, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1004', N'matematika', 30, 30, 40, 4, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1005', N'sejarah', 40, 30, 30, 2, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1006', N'bahasa inggris', 25, 35, 40, 2, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1007', N'seni budaya', 40, 30, 30, 2, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1008', N'prakarya', 25, 35, 40, 2, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1009', N'olahraga', 40, 30, 30, 3, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1010', N'fisika', 40, 30, 30, 2, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1011', N'pemrograman dasar', 30, 35, 35, 2, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1012', N'sistem komputer', 30, 30, 40, 2, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1013', N'perakitan komputer', 25, 35, 40, 4, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1014', N'simulasi digital', 30, 30, 40, 3, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1015', N'sistem operasi', 25, 35, 40, 3, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1016', N'jaringan dasar', 20, 30, 50, 4, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1017', N'pemrograman web', 30, 30, 40, 4, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2001', N'agama', 20, 30, 50, 3, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2002', N'PKN', 20, 30, 50, 2, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2003', N'bahasa indonesia', 30, 35, 35, 4, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2004', N'matematika', 30, 30, 40, 4, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2005', N'sejarah', 40, 30, 30, 2, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2006', N'bahasa inggris', 25, 35, 40, 2, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2007', N'seni budaya', 20, 30, 50, 2, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2008', N'prakarya', 30, 30, 40, 2, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2009', N'olahraga', 30, 35, 35, 3, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2010', N'fisika', 25, 35, 40, 2, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2011', N'pemrograman dasar', 20, 30, 50, 4, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2012', N'sistem komputer', 30, 30, 40, 4, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2013', N'komputer terapan', 30, 35, 35, 2, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2014', N'komunikasi data', 25, 35, 40, 4, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2015', N'sistem operasi jaringan', 20, 30, 50, 4, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2016', N'administrasi server', 30, 30, 40, 4, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3001', N'agama', 20, 30, 50, 3, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3002', N'PKN', 20, 30, 50, 2, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3003', N'bahasa indonesia', 30, 35, 35, 4, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3004', N'matematika', 30, 30, 40, 4, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3005', N'sejarah', 40, 30, 30, 2, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3006', N'bahasa inggris', 25, 35, 40, 2, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3007', N'seni budaya', 20, 30, 50, 2, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3008', N'prakarya', 30, 30, 40, 2, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3009', N'olahraga', 30, 35, 35, 3, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3010', N'jaringan nirkable', 25, 35, 40, 4, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3011', N'keamanan jaringan', 20, 30, 50, 4, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3012', N'trouble shooting jaringan', 30, 30, 40, 4, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3013', N'rancang bangun jaringan', 30, 35, 35, 4, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3014', N'kerja proyek', 30, 30, 40, 8, 3)
GO
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0001', N'Deren', N'085860619210', CAST(N'1980-08-12' AS Date), N'Male', N'Jl. Gatot Subroto No. 101, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0002', N'Barry Ron', N'083527836201', CAST(N'1980-08-13' AS Date), N'Male', N'Jl. Bengawan Asri No. 11, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0003', N'Merry Antony', N'081024168959', CAST(N'1980-08-14' AS Date), N'Female', N'Jl. Bumi Asri Indah No. 13, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0004', N'Christi', N'083840886410', CAST(N'1980-08-15' AS Date), N'Female', N'Komp. Griya Bima Asri Blok.B No. 47, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0005', N'Alan Reynaldi', N'087181912892', CAST(N'1980-08-16' AS Date), N'Male', N'Jl. Sudirman No. 492, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0006', N'Richard Sentosa', N'084139640318', CAST(N'1980-08-17' AS Date), N'Male', N'Jl. Keraton No. 842, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0007', N'Brenda', N'085271078084', CAST(N'1980-08-18' AS Date), N'Female', N'Komp. Wartawan Blok. E No. 198, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0008', N'Reza Mulyadi', N'089600460157', CAST(N'1980-08-19' AS Date), N'Male', N'Jl. Istimewa Gg. Hj Sahid No. 19, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0009', N'Brandon', N'082907690980', CAST(N'1980-08-20' AS Date), N'Male', N'Jl. AH Nasution No. 74, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0010', N'Reynold', N'085998471025', CAST(N'1980-08-21' AS Date), N'Male', N'Komp. Solo Makmur Blok. F No. 58, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0011', N'Adam hudin', N'087314677817', CAST(N'1980-08-22' AS Date), N'Male', N'Jl. Yos Sudarso No. 79, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0012', N'Conny Ken', N'083629914049', CAST(N'1980-08-23' AS Date), N'Female', N'Jl. Vandenburg Gg. Hj Kalam No. 26, Surakarta ', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0013', N'Cindy', N'082808492208', CAST(N'1980-08-24' AS Date), N'Female', N'Jl. Keraton No. 387, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0014', N'Kristian', N'083407419721', CAST(N'1980-08-25' AS Date), N'Male', N'Jl. Gatot Subroto No. 41, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0015', N'Dimas Santoso', N'083064285597', CAST(N'1980-08-26' AS Date), N'Male', N'Komp. Solo Makmur Blok. K No. 28, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0016', N'Tito Gunawan', N'085603050550', CAST(N'1980-08-27' AS Date), N'Male', N'Jl. Solo Baru No. 192,Sukoharjo', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0017', N'Kurnia Jaya', N'089643299667', CAST(N'1980-08-28' AS Date), N'Male', N'Komp. Bumi Sari Indah No.77, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0018', N'Ilman Halim', N'087948727992', CAST(N'1980-08-29' AS Date), N'Male', N'Komp. Griya Bima Asri Blok.D No. 37, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0019', N'George Tan', N'084928397718', CAST(N'1980-09-01' AS Date), N'Male', N'Jl. Vandenburg Gg. Hj Kasim No. 16, Surakarta ', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0020', N'Ina Haminah', N'087893774922', CAST(N'1980-09-02' AS Date), N'Female', N'Jl. Sudirman No. 292, Surakarta', N'-')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (1, N'T0001', N'test', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (2, N'T0002', N'JkDZtsgfn2', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (3, N'T0003', N'Wwmw4k44Y', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (4, N'T0004', N'tP2mA1eR', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (5, N'T0005', N'Iq7ySHrWAW', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (6, N'T0006', N'L71lWreH', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (7, N'T0007', N'KlveW4SNxT', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (8, N'T0008', N'UTIPqhpgQJ', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (9, N'T0009', N'u3pHcE', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (10, N'T0010', N'NYFtKV3X69', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (11, N'T0011', N'NuzCoRV9b', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (12, N'T0012', N'45f3fp', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (13, N'T0013', N'EIeq3p2stc', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (14, N'T0014', N'abaOSBCDmR', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (15, N'T0015', N'Y3zRn5', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (16, N'T0016', N'teyG82', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (17, N'T0017', N'ebs6Vf', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (18, N'T0018', N'fXkf3y', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (19, N'T0019', N'999zQD', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (20, N'T0020', N'MHp3XA', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (21, N'20170001', N'eGECi5', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (22, N'20170002', N'DIZ5DACG3g', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (23, N'20170003', N'MPqYq1ltew', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (24, N'20170004', N'Ua5hgvRV8a', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (25, N'20170005', N'KeQ8azJ', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (26, N'20170006', N'V1drEKo9Zp', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (27, N'20170007', N'0eXtq6IUy', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (28, N'20170008', N'D7gBH42', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (29, N'20170009', N'do9kditorr', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (30, N'20170010', N'PYpKZMz', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (31, N'20170011', N'Azl0SqG04l', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (32, N'20170012', N'BdTNFg', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (33, N'20170013', N'aafTWce', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (34, N'20170014', N'APldwi8l08', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (35, N'20170015', N'OC2AIr', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (36, N'20170016', N'SQujTUAUD', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (37, N'20170017', N'bJIjm4I2A', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (38, N'20170018', N'HPLdqZgmSW', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (39, N'20170019', N'JDYCO1gWYH', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (40, N'20160001', N'uVqRQE', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (41, N'20160002', N'tPbfeUIJ', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (42, N'20160003', N'v3wzAuNr', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (43, N'20160004', N'NK2kk5prEY', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (44, N'20160005', N'IMz0SSb9c', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (45, N'20160006', N'X4bLBpezmQ', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (46, N'20160007', N'UqJvwY30Mb', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (47, N'20160008', N'vDa3DKHC', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (48, N'20160009', N'j2ZnIre5g', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (49, N'20160010', N'CXELges', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (50, N'20160011', N'9PWMU5KU', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (51, N'20160012', N'gCUcSD50I', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (52, N'20160013', N'pgpI3lj1Rv', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (53, N'20160014', N'6EpVNgzetJ', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (54, N'20160015', N'x8wF88', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (55, N'20160016', N'YfalDMxQ5g', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (56, N'20160017', N'MAny0N', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (57, N'20160018', N'nZU1mpNqe', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (58, N'20150001', N'x2IPQLMXT3', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (59, N'20150002', N'C7YyOl57al', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (60, N'20150003', N'kLgr066hz', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (61, N'20150004', N'gt2L1l', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (62, N'20150005', N'6fF4wM4fK', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (63, N'20150006', N'VjX2lrgfAj', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (64, N'20150007', N'uclFtykmT', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (65, N'20150008', N'7iRgSPuthW', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (66, N'20150009', N'kyiWJOpvd', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (67, N'20150010', N'XLVqyzFIRO', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (68, N'20150011', N'4T7IK5ACix', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (69, N'20150012', N'ZV36Knqj', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (70, N'20150013', N'GeJpI8z', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (71, N'20150014', N'66LcsiI7z', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (72, N'20150015', N'XqpdIsxP2', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (73, N'20150016', N'1PBnCC', N'Student')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[DetailClass]  WITH CHECK ADD  CONSTRAINT [FK_DetailClass_Class] FOREIGN KEY([ClassName])
REFERENCES [dbo].[Class] ([ClassName])
GO
ALTER TABLE [dbo].[DetailClass] CHECK CONSTRAINT [FK_DetailClass_Class]
GO
ALTER TABLE [dbo].[DetailClass]  WITH CHECK ADD  CONSTRAINT [FK_DetailClass_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[DetailClass] CHECK CONSTRAINT [FK_DetailClass_Student]
GO
ALTER TABLE [dbo].[DetailSchedule]  WITH CHECK ADD  CONSTRAINT [FK_DetailSchedule_HeaderSchedule] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[HeaderSchedule] ([ScheduleId])
GO
ALTER TABLE [dbo].[DetailSchedule] CHECK CONSTRAINT [FK_DetailSchedule_HeaderSchedule]
GO
ALTER TABLE [dbo].[DetailSchedule]  WITH CHECK ADD  CONSTRAINT [FK_DetailSchedule_Shift] FOREIGN KEY([ShiftId])
REFERENCES [dbo].[Shift] ([ShiftId])
GO
ALTER TABLE [dbo].[DetailSchedule] CHECK CONSTRAINT [FK_DetailSchedule_Shift]
GO
ALTER TABLE [dbo].[DetailSchedule]  WITH CHECK ADD  CONSTRAINT [FK_DetailSchedule_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[DetailSchedule] CHECK CONSTRAINT [FK_DetailSchedule_Subject]
GO
ALTER TABLE [dbo].[DetailScore]  WITH NOCHECK ADD  CONSTRAINT [FK_DetailScore_DetailSchedule] FOREIGN KEY([DetailId])
REFERENCES [dbo].[DetailSchedule] ([DetailId])
GO
ALTER TABLE [dbo].[DetailScore] CHECK CONSTRAINT [FK_DetailScore_DetailSchedule]
GO
ALTER TABLE [dbo].[DetailScore]  WITH NOCHECK ADD  CONSTRAINT [FK_DetailScore_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[DetailScore] CHECK CONSTRAINT [FK_DetailScore_Student]
GO
ALTER TABLE [dbo].[Expertise]  WITH NOCHECK ADD  CONSTRAINT [FK_Expertise_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[Expertise] CHECK CONSTRAINT [FK_Expertise_Subject]
GO
ALTER TABLE [dbo].[Expertise]  WITH NOCHECK ADD  CONSTRAINT [FK_Expertise_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
GO
ALTER TABLE [dbo].[Expertise] CHECK CONSTRAINT [FK_Expertise_Teacher]
GO
ALTER TABLE [dbo].[HeaderSchedule]  WITH CHECK ADD  CONSTRAINT [FK_HeaderSchedule_Class] FOREIGN KEY([ClassName])
REFERENCES [dbo].[Class] ([ClassName])
GO
ALTER TABLE [dbo].[HeaderSchedule] CHECK CONSTRAINT [FK_HeaderSchedule_Class]
GO
ALTER TABLE [dbo].[User]  WITH NOCHECK ADD  CONSTRAINT [FK_User_Student] FOREIGN KEY([username])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Student]
GO
ALTER TABLE [dbo].[User]  WITH NOCHECK ADD  CONSTRAINT [FK_User_Teacher] FOREIGN KEY([username])
REFERENCES [dbo].[Teacher] ([TeacherId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Teacher]
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
         Begin Table = "DetailClass"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 148
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Student"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 1
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
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ClassStudent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ClassStudent'
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
         Begin Table = "DetailSchedule"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Subject"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Teacher"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Shift"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 126
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HeaderSchedule"
            Begin Extent = 
               Top = 7
               Left = 1016
               Bottom = 148
               Right = 1210
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
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Schedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Schedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Schedule'
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
         Begin Table = "DetailScore"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Student"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "DetailSchedule"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Subject"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 170
               Right = 968
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
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StudentScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StudentScore'
GO
USE [master]
GO
ALTER DATABASE [LKSN2017] SET  READ_WRITE 
GO
