USE [master]
GO

/****** Object:  Database [XYZMortgage]    Script Date: 12/5/2020 6:48:12 PM ******/
CREATE DATABASE [XYZMortgage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XYZMortgage', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\XYZMortgage.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'XYZMortgage_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\XYZMortgage_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XYZMortgage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [XYZMortgage] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [XYZMortgage] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [XYZMortgage] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [XYZMortgage] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [XYZMortgage] SET ARITHABORT OFF 
GO

ALTER DATABASE [XYZMortgage] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [XYZMortgage] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [XYZMortgage] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [XYZMortgage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [XYZMortgage] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [XYZMortgage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [XYZMortgage] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [XYZMortgage] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [XYZMortgage] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [XYZMortgage] SET  DISABLE_BROKER 
GO

ALTER DATABASE [XYZMortgage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [XYZMortgage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [XYZMortgage] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [XYZMortgage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [XYZMortgage] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [XYZMortgage] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [XYZMortgage] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [XYZMortgage] SET RECOVERY FULL 
GO

ALTER DATABASE [XYZMortgage] SET  MULTI_USER 
GO

ALTER DATABASE [XYZMortgage] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [XYZMortgage] SET DB_CHAINING OFF 
GO

ALTER DATABASE [XYZMortgage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [XYZMortgage] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [XYZMortgage] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [XYZMortgage] SET QUERY_STORE = OFF
GO

ALTER DATABASE [XYZMortgage] SET  READ_WRITE 
GO

USE [XYZMortgage]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 12/5/2020 6:47:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[SSN] [varchar](10) NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[AddressLine1] [varchar](100) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_SSN] UNIQUE NONCLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

insert into [dbo].[Customer] values(1234567891,'John','Bosh','XYZ Rd','Westlane','NY')
insert into [dbo].[Customer] values(1234567892,'Smith','Kary','Newlane Rd','Westbusy','NY')
insert into [dbo].[Customer] values(1234567893,'Cary','Leone','Walhter Rd','Westbusy','CT')
insert into [dbo].[Customer] values(1234567894,'Lacie','Perry','Circle Rd','Woodbrige','NJ')
GO


CREATE TABLE [dbo].[Loan](
	[LoanId] [int] IDENTITY(1,1) NOT NULL,
	[OriginationDate] [date] NULL,
	[LoanAmount] [decimal](18, 0) NULL,
	[InterestRate] [decimal](5, 2) NULL,
	[TermMonth] [int] NULL,
	[Balance] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[LoanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CustomerLoan](
	[CustomerId] [int] NULL,
	[LoanId] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CustomerLoan]  WITH CHECK ADD  CONSTRAINT [FK_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO

ALTER TABLE [dbo].[CustomerLoan] CHECK CONSTRAINT [FK_CustomerId]
GO

ALTER TABLE [dbo].[CustomerLoan]  WITH CHECK ADD  CONSTRAINT [FK_LoanId] FOREIGN KEY([LoanId])
REFERENCES [dbo].[Loan] ([LoanId])
GO

 ALTER TABLE [CustomerLoan]
	ADD UNIQUE (CustomerId,LoanId);
GO


  insert into [XYZMortgage].[dbo].[Loan] values('12/10/2020',100000,3.45,180,50000)
  insert into [XYZMortgage].[dbo].[Loan] values('08/10/2017',5000000,6.22,180,80000)
  insert into [XYZMortgage].[dbo].[Loan] values('02/10/2009',300000,3.107,180,90000)
  insert into [XYZMortgage].[dbo].[Loan] values('07/10/2015',200000,5.0,180,10000)

 insert into [XYZMortgage].[dbo].[CustomerLoan] values(1,3)
  insert into [XYZMortgage].[dbo].[CustomerLoan] values(2,1)
  insert into [XYZMortgage].[dbo].[CustomerLoan] values(3,3)
  insert into [XYZMortgage].[dbo].[CustomerLoan] values(4,2)

GO


