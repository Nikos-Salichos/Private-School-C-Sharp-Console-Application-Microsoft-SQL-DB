USE [master]
GO
/****** Object:  Database [IndividualPartB]    Script Date: 20/12/2020 7:40:31 μμ ******/
CREATE DATABASE [IndividualPartB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IndividualPartB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IndividualPartB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IndividualPartB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IndividualPartB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [IndividualPartB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IndividualPartB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IndividualPartB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IndividualPartB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IndividualPartB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IndividualPartB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IndividualPartB] SET ARITHABORT OFF 
GO
ALTER DATABASE [IndividualPartB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IndividualPartB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IndividualPartB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IndividualPartB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IndividualPartB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IndividualPartB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IndividualPartB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IndividualPartB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IndividualPartB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IndividualPartB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IndividualPartB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IndividualPartB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IndividualPartB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IndividualPartB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IndividualPartB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IndividualPartB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IndividualPartB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IndividualPartB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IndividualPartB] SET  MULTI_USER 
GO
ALTER DATABASE [IndividualPartB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IndividualPartB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IndividualPartB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IndividualPartB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IndividualPartB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IndividualPartB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [IndividualPartB] SET QUERY_STORE = OFF
GO
USE [IndividualPartB]
GO
/****** Object:  Table [dbo].[Assignments]    Script Date: 20/12/2020 7:40:31 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignments](
	[AssignmentId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[SubmissionDate] [date] NOT NULL,
	[OralMark] [decimal](18, 0) NOT NULL,
	[TotalMark] [decimal](18, 0) NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_assignments] PRIMARY KEY CLUSTERED 
(
	[AssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssignmentsPerStudentPerCourse]    Script Date: 20/12/2020 7:40:31 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignmentsPerStudentPerCourse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AssignmentId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
 CONSTRAINT [PK_AssignmentsPerStudentPerCourse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 20/12/2020 7:40:31 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Stream] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 20/12/2020 7:40:31 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[TuitionFees] [int] NOT NULL,
 CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentsPerCourse]    Script Date: 20/12/2020 7:40:31 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentsPerCourse](
	[StudentPerCourseId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_studentspercourse] PRIMARY KEY CLUSTERED 
(
	[StudentPerCourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainers]    Script Date: 20/12/2020 7:40:31 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainers](
	[TrainerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_trainers] PRIMARY KEY CLUSTERED 
(
	[TrainerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainersPerCourse]    Script Date: 20/12/2020 7:40:31 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainersPerCourse](
	[TrainersPerCourseId] [int] IDENTITY(1,1) NOT NULL,
	[TrainerId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_trainerspercourse] PRIMARY KEY CLUSTERED 
(
	[TrainersPerCourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Assignments] ON 

INSERT [dbo].[Assignments] ([AssignmentId], [Title], [Description], [SubmissionDate], [OralMark], [TotalMark], [CourseId]) VALUES (2, N'Luna Park', N'Design a Luna Park', CAST(N'2020-12-15' AS Date), CAST(50 AS Decimal(18, 0)), CAST(80 AS Decimal(18, 0)), 1)
INSERT [dbo].[Assignments] ([AssignmentId], [Title], [Description], [SubmissionDate], [OralMark], [TotalMark], [CourseId]) VALUES (3, N'University', N'Design a University', CAST(N'2021-01-20' AS Date), CAST(60 AS Decimal(18, 0)), CAST(90 AS Decimal(18, 0)), 5)
INSERT [dbo].[Assignments] ([AssignmentId], [Title], [Description], [SubmissionDate], [OralMark], [TotalMark], [CourseId]) VALUES (4, N'Web Application', N'Design a Web Application', CAST(N'2021-03-05' AS Date), CAST(45 AS Decimal(18, 0)), CAST(70 AS Decimal(18, 0)), 6)
INSERT [dbo].[Assignments] ([AssignmentId], [Title], [Description], [SubmissionDate], [OralMark], [TotalMark], [CourseId]) VALUES (5, N'Factory', N'Design a Factory', CAST(N'2021-02-07' AS Date), CAST(51 AS Decimal(18, 0)), CAST(84 AS Decimal(18, 0)), 1)
INSERT [dbo].[Assignments] ([AssignmentId], [Title], [Description], [SubmissionDate], [OralMark], [TotalMark], [CourseId]) VALUES (6, N'Cinema', N'Design a Theater', CAST(N'2021-04-08' AS Date), CAST(38 AS Decimal(18, 0)), CAST(70 AS Decimal(18, 0)), 5)
INSERT [dbo].[Assignments] ([AssignmentId], [Title], [Description], [SubmissionDate], [OralMark], [TotalMark], [CourseId]) VALUES (7, N'House', N'Design a house', CAST(N'2021-02-02' AS Date), CAST(50 AS Decimal(18, 0)), CAST(80 AS Decimal(18, 0)), 1)
INSERT [dbo].[Assignments] ([AssignmentId], [Title], [Description], [SubmissionDate], [OralMark], [TotalMark], [CourseId]) VALUES (8, N'Gaming in JS', N'Design a pc game in javascript', CAST(N'2021-03-03' AS Date), CAST(50 AS Decimal(18, 0)), CAST(90 AS Decimal(18, 0)), 9)
INSERT [dbo].[Assignments] ([AssignmentId], [Title], [Description], [SubmissionDate], [OralMark], [TotalMark], [CourseId]) VALUES (9, N'iMA', N'Moving Average Indicator', CAST(N'2021-12-10' AS Date), CAST(50 AS Decimal(18, 0)), CAST(80 AS Decimal(18, 0)), 10)
INSERT [dbo].[Assignments] ([AssignmentId], [Title], [Description], [SubmissionDate], [OralMark], [TotalMark], [CourseId]) VALUES (10, N'CandleStick Pattern', N'Create a list of candlestick patterns', CAST(N'2020-01-02' AS Date), CAST(50 AS Decimal(18, 0)), CAST(70 AS Decimal(18, 0)), 11)
INSERT [dbo].[Assignments] ([AssignmentId], [Title], [Description], [SubmissionDate], [OralMark], [TotalMark], [CourseId]) VALUES (11, N'Smart Contract', N'Create smart contract in Nethereum', CAST(N'2021-06-05' AS Date), CAST(50 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), 12)
INSERT [dbo].[Assignments] ([AssignmentId], [Title], [Description], [SubmissionDate], [OralMark], [TotalMark], [CourseId]) VALUES (12, N'PineScript project A', N'Create a currency index', CAST(N'2021-02-05' AS Date), CAST(50 AS Decimal(18, 0)), CAST(80 AS Decimal(18, 0)), 13)
SET IDENTITY_INSERT [dbo].[Assignments] OFF
GO
SET IDENTITY_INSERT [dbo].[AssignmentsPerStudentPerCourse] ON 

INSERT [dbo].[AssignmentsPerStudentPerCourse] ([ID], [AssignmentId], [StudentId]) VALUES (17, 2, 1)
INSERT [dbo].[AssignmentsPerStudentPerCourse] ([ID], [AssignmentId], [StudentId]) VALUES (3, 2, 2)
INSERT [dbo].[AssignmentsPerStudentPerCourse] ([ID], [AssignmentId], [StudentId]) VALUES (19, 3, 2)
INSERT [dbo].[AssignmentsPerStudentPerCourse] ([ID], [AssignmentId], [StudentId]) VALUES (24, 3, 8)
INSERT [dbo].[AssignmentsPerStudentPerCourse] ([ID], [AssignmentId], [StudentId]) VALUES (23, 5, 6)
INSERT [dbo].[AssignmentsPerStudentPerCourse] ([ID], [AssignmentId], [StudentId]) VALUES (26, 5, 11)
INSERT [dbo].[AssignmentsPerStudentPerCourse] ([ID], [AssignmentId], [StudentId]) VALUES (29, 8, 14)
INSERT [dbo].[AssignmentsPerStudentPerCourse] ([ID], [AssignmentId], [StudentId]) VALUES (20, 10, 11)
INSERT [dbo].[AssignmentsPerStudentPerCourse] ([ID], [AssignmentId], [StudentId]) VALUES (27, 10, 13)
INSERT [dbo].[AssignmentsPerStudentPerCourse] ([ID], [AssignmentId], [StudentId]) VALUES (21, 11, 12)
INSERT [dbo].[AssignmentsPerStudentPerCourse] ([ID], [AssignmentId], [StudentId]) VALUES (30, 12, 15)
SET IDENTITY_INSERT [dbo].[AssignmentsPerStudentPerCourse] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [Title], [Stream], [Type], [StartDate], [EndDate]) VALUES (1, N'CB12', N'C', N'FULL TIME', CAST(N'2020-10-05' AS Date), CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Courses] ([CourseId], [Title], [Stream], [Type], [StartDate], [EndDate]) VALUES (5, N'CB12', N'JAVA', N'PART TIME', CAST(N'2020-12-10' AS Date), CAST(N'2021-12-01' AS Date))
INSERT [dbo].[Courses] ([CourseId], [Title], [Stream], [Type], [StartDate], [EndDate]) VALUES (6, N'CB12', N'SQL', N'FULL TIME', CAST(N'2020-01-15' AS Date), CAST(N'2021-02-20' AS Date))
INSERT [dbo].[Courses] ([CourseId], [Title], [Stream], [Type], [StartDate], [EndDate]) VALUES (8, N'CB13', N'PYTHON', N'FULL TIME', CAST(N'2021-05-12' AS Date), CAST(N'2021-12-30' AS Date))
INSERT [dbo].[Courses] ([CourseId], [Title], [Stream], [Type], [StartDate], [EndDate]) VALUES (9, N'CB13', N'JavaScript', N'Part Time', CAST(N'2021-01-12' AS Date), CAST(N'2021-06-12' AS Date))
INSERT [dbo].[Courses] ([CourseId], [Title], [Stream], [Type], [StartDate], [EndDate]) VALUES (10, N'CB14', N'MQL4', N'FULL TIME', CAST(N'2021-05-12' AS Date), CAST(N'2021-12-19' AS Date))
INSERT [dbo].[Courses] ([CourseId], [Title], [Stream], [Type], [StartDate], [EndDate]) VALUES (11, N'CB15', N'MQL5', N'FULL TIME', CAST(N'2020-12-15' AS Date), CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Courses] ([CourseId], [Title], [Stream], [Type], [StartDate], [EndDate]) VALUES (12, N'CB15', N'Nethereum', N'FULL TIME', CAST(N'2021-05-01' AS Date), CAST(N'2021-10-01' AS Date))
INSERT [dbo].[Courses] ([CourseId], [Title], [Stream], [Type], [StartDate], [EndDate]) VALUES (13, N'CB20', N'PineScript', N'Full', CAST(N'2021-01-01' AS Date), CAST(N'2022-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [DateOfBirth], [TuitionFees]) VALUES (1, N'Nikos', N'Salichos', CAST(N'1991-12-05' AS Date), 2000)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [DateOfBirth], [TuitionFees]) VALUES (2, N'Despoina', N'Salichou', CAST(N'1994-04-20' AS Date), 2500)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [DateOfBirth], [TuitionFees]) VALUES (3, N'Chara', N'Skoura', CAST(N'1993-04-15' AS Date), 1500)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [DateOfBirth], [TuitionFees]) VALUES (4, N'Maria', N'Evangelou', CAST(N'1995-08-30' AS Date), 1000)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [DateOfBirth], [TuitionFees]) VALUES (6, N'Giorgos', N'Tsoukas', CAST(N'1999-02-10' AS Date), 1200)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [DateOfBirth], [TuitionFees]) VALUES (7, N'Vaggelis', N'Nikolaou', CAST(N'1995-05-20' AS Date), 2300)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [DateOfBirth], [TuitionFees]) VALUES (8, N'Ioannis', N'Podo', CAST(N'1991-12-12' AS Date), 1500)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [DateOfBirth], [TuitionFees]) VALUES (9, N'Spyros', N'Tsamis', CAST(N'1990-10-12' AS Date), 1500)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [DateOfBirth], [TuitionFees]) VALUES (10, N'Angela', N'Demaj', CAST(N'1991-12-12' AS Date), 1500)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [DateOfBirth], [TuitionFees]) VALUES (11, N'Nikos', N'Papadopoulos', CAST(N'2000-05-12' AS Date), 1500)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [DateOfBirth], [TuitionFees]) VALUES (12, N'Thanasis', N'Papapaschalis', CAST(N'1980-08-05' AS Date), 2500)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [DateOfBirth], [TuitionFees]) VALUES (13, N'Maria', N'Dimou', CAST(N'1990-01-05' AS Date), 2500)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [DateOfBirth], [TuitionFees]) VALUES (14, N'Markos', N'Seferlis', CAST(N'1990-01-05' AS Date), 1500)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [DateOfBirth], [TuitionFees]) VALUES (15, N'Antonis', N'Roumpos', CAST(N'1995-12-28' AS Date), 1500)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentsPerCourse] ON 

INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (1, 1, 1)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (25, 1, 10)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (20, 2, 1)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (3, 2, 5)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (14, 2, 6)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (19, 2, 10)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (11, 3, 5)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (18, 3, 9)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (4, 4, 1)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (7, 4, 6)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (12, 6, 1)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (6, 6, 5)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (26, 6, 10)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (16, 7, 6)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (15, 7, 8)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (21, 8, 1)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (22, 8, 10)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (27, 11, 11)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (28, 12, 12)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (29, 13, 11)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (30, 14, 9)
INSERT [dbo].[StudentsPerCourse] ([StudentPerCourseId], [StudentId], [CourseId]) VALUES (31, 15, 13)
SET IDENTITY_INSERT [dbo].[StudentsPerCourse] OFF
GO
SET IDENTITY_INSERT [dbo].[Trainers] ON 

INSERT [dbo].[Trainers] ([TrainerId], [FirstName], [LastName], [Subject]) VALUES (1, N'Giorgos', N'Pasparakis', N'C')
INSERT [dbo].[Trainers] ([TrainerId], [FirstName], [LastName], [Subject]) VALUES (2, N'Panos', N'Bozas', N'SQL')
INSERT [dbo].[Trainers] ([TrainerId], [FirstName], [LastName], [Subject]) VALUES (3, N'Evangelia', N'Petrou', N'SQL')
INSERT [dbo].[Trainers] ([TrainerId], [FirstName], [LastName], [Subject]) VALUES (4, N'Ioannis', N'Christakis', N'JAVA')
INSERT [dbo].[Trainers] ([TrainerId], [FirstName], [LastName], [Subject]) VALUES (5, N'Sarantia', N'Tyrovola', N'Learn C#')
INSERT [dbo].[Trainers] ([TrainerId], [FirstName], [LastName], [Subject]) VALUES (6, N'Thanasis', N'Papa', N'MQL4 Master')
INSERT [dbo].[Trainers] ([TrainerId], [FirstName], [LastName], [Subject]) VALUES (7, N'JB', N'Marwood', N'MQL5')
INSERT [dbo].[Trainers] ([TrainerId], [FirstName], [LastName], [Subject]) VALUES (8, N'Richard', N'Hex', N'Hex')
INSERT [dbo].[Trainers] ([TrainerId], [FirstName], [LastName], [Subject]) VALUES (9, N'Giannis', N'Dimou', N'Api')
INSERT [dbo].[Trainers] ([TrainerId], [FirstName], [LastName], [Subject]) VALUES (10, N'Oliver', N'Velez', N'Teaching pinescript')
SET IDENTITY_INSERT [dbo].[Trainers] OFF
GO
SET IDENTITY_INSERT [dbo].[TrainersPerCourse] ON 

INSERT [dbo].[TrainersPerCourse] ([TrainersPerCourseId], [TrainerId], [CourseId]) VALUES (1, 1, 1)
INSERT [dbo].[TrainersPerCourse] ([TrainersPerCourseId], [TrainerId], [CourseId]) VALUES (9, 1, 9)
INSERT [dbo].[TrainersPerCourse] ([TrainersPerCourseId], [TrainerId], [CourseId]) VALUES (2, 3, 5)
INSERT [dbo].[TrainersPerCourse] ([TrainersPerCourseId], [TrainerId], [CourseId]) VALUES (4, 3, 6)
INSERT [dbo].[TrainersPerCourse] ([TrainersPerCourseId], [TrainerId], [CourseId]) VALUES (5, 4, 1)
INSERT [dbo].[TrainersPerCourse] ([TrainersPerCourseId], [TrainerId], [CourseId]) VALUES (6, 5, 1)
INSERT [dbo].[TrainersPerCourse] ([TrainersPerCourseId], [TrainerId], [CourseId]) VALUES (7, 5, 6)
INSERT [dbo].[TrainersPerCourse] ([TrainersPerCourseId], [TrainerId], [CourseId]) VALUES (8, 5, 8)
INSERT [dbo].[TrainersPerCourse] ([TrainersPerCourseId], [TrainerId], [CourseId]) VALUES (10, 6, 10)
INSERT [dbo].[TrainersPerCourse] ([TrainersPerCourseId], [TrainerId], [CourseId]) VALUES (13, 7, 11)
INSERT [dbo].[TrainersPerCourse] ([TrainersPerCourseId], [TrainerId], [CourseId]) VALUES (14, 8, 12)
INSERT [dbo].[TrainersPerCourse] ([TrainersPerCourseId], [TrainerId], [CourseId]) VALUES (15, 9, 9)
INSERT [dbo].[TrainersPerCourse] ([TrainersPerCourseId], [TrainerId], [CourseId]) VALUES (16, 10, 13)
SET IDENTITY_INSERT [dbo].[TrainersPerCourse] OFF
GO
/****** Object:  Index [IX_AssignmentsPerStudentPerCourse]    Script Date: 20/12/2020 7:40:31 μμ ******/
ALTER TABLE [dbo].[AssignmentsPerStudentPerCourse] ADD  CONSTRAINT [IX_AssignmentsPerStudentPerCourse] UNIQUE NONCLUSTERED 
(
	[AssignmentId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uq_StudentsPerCourse]    Script Date: 20/12/2020 7:40:31 μμ ******/
ALTER TABLE [dbo].[StudentsPerCourse] ADD  CONSTRAINT [uq_StudentsPerCourse] UNIQUE NONCLUSTERED 
(
	[StudentId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_156]    Script Date: 20/12/2020 7:40:31 μμ ******/
CREATE NONCLUSTERED INDEX [fkIdx_156] ON [dbo].[StudentsPerCourse]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_93]    Script Date: 20/12/2020 7:40:31 μμ ******/
CREATE NONCLUSTERED INDEX [fkIdx_93] ON [dbo].[StudentsPerCourse]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uq_TrainersPerCourse]    Script Date: 20/12/2020 7:40:31 μμ ******/
ALTER TABLE [dbo].[TrainersPerCourse] ADD  CONSTRAINT [uq_TrainersPerCourse] UNIQUE NONCLUSTERED 
(
	[TrainerId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_117]    Script Date: 20/12/2020 7:40:31 μμ ******/
CREATE NONCLUSTERED INDEX [fkIdx_117] ON [dbo].[TrainersPerCourse]
(
	[TrainerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_150]    Script Date: 20/12/2020 7:40:31 μμ ******/
CREATE NONCLUSTERED INDEX [fkIdx_150] ON [dbo].[TrainersPerCourse]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK_Assignments_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK_Assignments_Courses]
GO
ALTER TABLE [dbo].[AssignmentsPerStudentPerCourse]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentsPerStudentPerCourse_Assignments] FOREIGN KEY([AssignmentId])
REFERENCES [dbo].[Assignments] ([AssignmentId])
GO
ALTER TABLE [dbo].[AssignmentsPerStudentPerCourse] CHECK CONSTRAINT [FK_AssignmentsPerStudentPerCourse_Assignments]
GO
ALTER TABLE [dbo].[AssignmentsPerStudentPerCourse]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentsPerStudentPerCourse_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[AssignmentsPerStudentPerCourse] CHECK CONSTRAINT [FK_AssignmentsPerStudentPerCourse_Students]
GO
ALTER TABLE [dbo].[StudentsPerCourse]  WITH CHECK ADD  CONSTRAINT [FK_156] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[StudentsPerCourse] CHECK CONSTRAINT [FK_156]
GO
ALTER TABLE [dbo].[StudentsPerCourse]  WITH CHECK ADD  CONSTRAINT [FK_93] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[StudentsPerCourse] CHECK CONSTRAINT [FK_93]
GO
ALTER TABLE [dbo].[TrainersPerCourse]  WITH CHECK ADD  CONSTRAINT [FK_117] FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Trainers] ([TrainerId])
GO
ALTER TABLE [dbo].[TrainersPerCourse] CHECK CONSTRAINT [FK_117]
GO
ALTER TABLE [dbo].[TrainersPerCourse]  WITH CHECK ADD  CONSTRAINT [FK_150] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[TrainersPerCourse] CHECK CONSTRAINT [FK_150]
GO
USE [master]
GO
ALTER DATABASE [IndividualPartB] SET  READ_WRITE 
GO
