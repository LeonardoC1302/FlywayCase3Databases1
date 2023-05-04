USE [master]
GO
/****** Object:  Database [caso3]    Script Date: 29/4/2023 12:32:19 ******/
CREATE DATABASE [caso3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'caso3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\caso3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'caso3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\caso3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [caso3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [caso3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [caso3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [caso3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [caso3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [caso3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [caso3] SET ARITHABORT OFF 
GO
ALTER DATABASE [caso3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [caso3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [caso3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [caso3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [caso3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [caso3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [caso3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [caso3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [caso3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [caso3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [caso3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [caso3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [caso3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [caso3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [caso3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [caso3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [caso3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [caso3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [caso3] SET  MULTI_USER 
GO
ALTER DATABASE [caso3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [caso3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [caso3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [caso3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [caso3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [caso3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [caso3] SET QUERY_STORE = ON
GO
ALTER DATABASE [caso3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [caso3]
GO
/****** Object:  Table [dbo].[addresses]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addresses](
	[addressId] [int] IDENTITY(1,1) NOT NULL,
	[countryId] [int] NOT NULL,
	[stateId] [int] NOT NULL,
	[cityId] [int] NOT NULL,
	[geoLocation] [geography] NOT NULL,
 CONSTRAINT [PK_addresses] PRIMARY KEY CLUSTERED 
(
	[addressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[agreements]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agreements](
	[agreementId] [int] IDENTITY(1,1) NOT NULL,
	[agreementName] [varchar](50) NOT NULL,
	[agreementDescription] [varchar](80) NOT NULL,
	[agreementStatusId] [int] NOT NULL,
 CONSTRAINT [PK_agreements] PRIMARY KEY CLUSTERED 
(
	[agreementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[agreementStatus]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agreementStatus](
	[agreementSatusId] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_agreementStatus] PRIMARY KEY CLUSTERED 
(
	[agreementSatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brands]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brands](
	[brandId] [int] IDENTITY(1,1) NOT NULL,
	[brandName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_brands] PRIMARY KEY CLUSTERED 
(
	[brandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cars]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cars](
	[carId] [int] IDENTITY(1,1) NOT NULL,
	[carPlate] [varchar](50) NOT NULL,
	[carTypeId] [int] NOT NULL,
	[carCapacity] [int] NOT NULL,
 CONSTRAINT [PK_cars] PRIMARY KEY CLUSTERED 
(
	[carId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carTypes]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carTypes](
	[carTypeId] [int] IDENTITY(1,1) NOT NULL,
	[carTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_carTypes] PRIMARY KEY CLUSTERED 
(
	[carTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[certifications]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[certifications](
	[certificationId] [int] IDENTITY(1,1) NOT NULL,
	[certificationName] [varchar](50) NOT NULL,
	[enabled] [binary](1) NOT NULL,
 CONSTRAINT [PK_certifications] PRIMARY KEY CLUSTERED 
(
	[certificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[certificationsXproducer]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[certificationsXproducer](
	[certificationXproducerId] [int] IDENTITY(1,1) NOT NULL,
	[certificationId] [int] NOT NULL,
	[producerId] [int] NOT NULL,
 CONSTRAINT [PK_certificationsXproducer] PRIMARY KEY CLUSTERED 
(
	[certificationXproducerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cities](
	[cityId] [int] IDENTITY(1,1) NOT NULL,
	[zipcode] [int] NOT NULL,
	[stateId] [int] NOT NULL,
	[cityName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_cities] PRIMARY KEY CLUSTERED 
(
	[cityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[citiesXcontract]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[citiesXcontract](
	[cityXcontractId] [int] IDENTITY(1,1) NOT NULL,
	[cityId] [int] NOT NULL,
	[contractId] [int] NOT NULL,
 CONSTRAINT [PK_citiesXcontract] PRIMARY KEY CLUSTERED 
(
	[cityXcontractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[collectionAssignments]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[collectionAssignments](
	[collectionAssignmentId] [int] IDENTITY(1,1) NOT NULL,
	[collectorId] [int] NOT NULL,
	[producerId] [int] NOT NULL,
	[collectionDate] [date] NOT NULL,
	[collectionPointId] [int] NOT NULL,
	[volumen] [decimal](18, 0) NULL,
 CONSTRAINT [PK_collectionAssignments] PRIMARY KEY CLUSTERED 
(
	[collectionAssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[collectionPoints]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[collectionPoints](
	[collectionPointId] [int] NOT NULL,
	[pointName] [varchar](50) NOT NULL,
	[enabled] [bit] NOT NULL,
	[address] [geography] NOT NULL,
 CONSTRAINT [PK_collectionPoints] PRIMARY KEY CLUSTERED 
(
	[collectionPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[collections]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[collections](
	[collectionId] [int] IDENTITY(1,1) NOT NULL,
	[containerId] [int] NOT NULL,
	[collectionAssignmentId] [int] NOT NULL,
	[contractId] [int] NOT NULL,
 CONSTRAINT [PK_collections] PRIMARY KEY CLUSTERED 
(
	[collectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[collectors]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[collectors](
	[collectorId] [int] IDENTITY(1,1) NOT NULL,
	[collectorName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_collectors] PRIMARY KEY CLUSTERED 
(
	[collectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[collectorsXMovements]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[collectorsXMovements](
	[collectorXmovementId] [int] IDENTITY(1,1) NOT NULL,
	[collectorId] [int] NOT NULL,
	[wasteMovementId] [int] NOT NULL,
 CONSTRAINT [PK_collectorsXMovements] PRIMARY KEY CLUSTERED 
(
	[collectorXmovementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactsXcollectors]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactsXcollectors](
	[contactXcollectorId] [int] IDENTITY(1,1) NOT NULL,
	[contactValueId] [int] NOT NULL,
	[collectorId] [int] NOT NULL,
 CONSTRAINT [PK_contactsXcollectors] PRIMARY KEY CLUSTERED 
(
	[contactXcollectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactsXparticipant]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactsXparticipant](
	[contactXparticipantId] [int] IDENTITY(1,1) NOT NULL,
	[participantId] [int] NOT NULL,
	[contactValueId] [int] NOT NULL,
 CONSTRAINT [PK_contactsXparticipant] PRIMARY KEY CLUSTERED 
(
	[contactXparticipantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactsXproducers]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactsXproducers](
	[contactXproducerId] [int] IDENTITY(1,1) NOT NULL,
	[contactValueId] [int] NOT NULL,
	[producerId] [int] NOT NULL,
 CONSTRAINT [PK_contactsXproducers] PRIMARY KEY CLUSTERED 
(
	[contactXproducerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactTypes]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactTypes](
	[contactTypeId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_contactTypes] PRIMARY KEY CLUSTERED 
(
	[contactTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactValues]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactValues](
	[contactValueId] [int] IDENTITY(1,1) NOT NULL,
	[value] [varchar](50) NOT NULL,
	[posstime] [datetime] NOT NULL,
	[enabled] [binary](1) NOT NULL,
	[contactTypeId] [int] NOT NULL,
 CONSTRAINT [PK_contactValues] PRIMARY KEY CLUSTERED 
(
	[contactValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[containerActions]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[containerActions](
	[containerActionId] [int] IDENTITY(1,1) NOT NULL,
	[actionName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_containerActions] PRIMARY KEY CLUSTERED 
(
	[containerActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[containerMovements]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[containerMovements](
	[movementId] [int] NOT NULL,
	[containerActionId] [int] NOT NULL,
	[containerId] [int] NOT NULL,
	[postime] [date] NOT NULL,
	[quantity] [decimal](16, 4) NOT NULL,
	[fromProducerId] [int] NOT NULL,
	[checksum] [varbinary](10) NULL,
 CONSTRAINT [PK_containerMovements_1] PRIMARY KEY CLUSTERED 
(
	[movementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[containers]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[containers](
	[containerId] [int] IDENTITY(1,1) NOT NULL,
	[containerName] [varchar](50) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[containerTypeId] [int] NOT NULL,
 CONSTRAINT [PK_containers] PRIMARY KEY CLUSTERED 
(
	[containerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[containerTypes]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[containerTypes](
	[containerTypeId] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [varchar](50) NOT NULL,
	[brandId] [int] NOT NULL,
	[modelId] [int] NOT NULL,
	[capacity] [decimal](14, 2) NOT NULL,
	[measureId] [int] NOT NULL,
 CONSTRAINT [PK_containerTypes] PRIMARY KEY CLUSTERED 
(
	[containerTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contractAgreements]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contractAgreements](
	[contractAgreementId] [int] IDENTITY(1,1) NOT NULL,
	[contractId] [int] NOT NULL,
	[agreementId] [int] NOT NULL,
 CONSTRAINT [PK_contractAgreements] PRIMARY KEY CLUSTERED 
(
	[contractAgreementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contractParticipants]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contractParticipants](
	[contractParticipantId] [int] IDENTITY(1,1) NOT NULL,
	[contractId] [int] NOT NULL,
	[producerId] [int] NULL,
	[collectorId] [int] NULL,
	[participantId] [int] NULL,
	[participantPercentage] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_contractParticipants] PRIMARY KEY CLUSTERED 
(
	[contractParticipantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contracts]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contracts](
	[contractId] [int] IDENTITY(1,1) NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
	[contractStatusId] [int] NOT NULL,
 CONSTRAINT [PK_contracts] PRIMARY KEY CLUSTERED 
(
	[contractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contractStatus]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contractStatus](
	[contractStatusId] [int] IDENTITY(1,1) NOT NULL,
	[contractStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_contractStatus] PRIMARY KEY CLUSTERED 
(
	[contractStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[countries]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries](
	[countryId] [int] IDENTITY(1,1) NOT NULL,
	[countryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_countries] PRIMARY KEY CLUSTERED 
(
	[countryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[currency]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[currency](
	[currencyId] [int] NOT NULL,
	[currencyAcronymn] [varchar](50) NOT NULL,
	[currencyName] [varchar](50) NOT NULL,
	[symbol] [varchar](5) NOT NULL,
	[currencyDefault] [varchar](50) NOT NULL,
 CONSTRAINT [PK_currency] PRIMARY KEY CLUSTERED 
(
	[currencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[currencyExchanges]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[currencyExchanges](
	[exchangeId] [int] NOT NULL,
	[exchangeRate] [decimal](12, 4) NOT NULL,
	[currencyId] [int] NOT NULL,
	[exchangeDefault] [decimal](12, 4) NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
	[username] [nchar](10) NOT NULL,
	[checksum] [varbinary](50) NOT NULL,
 CONSTRAINT [PK_exchangeRate] PRIMARY KEY CLUSTERED 
(
	[exchangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[eventLogs]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eventLogs](
	[eventId] [int] NOT NULL,
	[posttime] [timestamp] NOT NULL,
	[computer] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[checksum] [varchar](50) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[referenceId1] [bigint] NOT NULL,
	[referenceId2] [bigint] NOT NULL,
	[value1] [varchar](50) NOT NULL,
	[value2] [varchar](50) NOT NULL,
	[sourceId] [int] NOT NULL,
	[levelId] [int] NOT NULL,
	[eventTypeId] [int] NOT NULL,
	[objectTypeId] [int] NOT NULL,
 CONSTRAINT [PK_eventLogs] PRIMARY KEY CLUSTERED 
(
	[eventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[eventTypes]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eventTypes](
	[eventTypeId] [int] NOT NULL,
	[typeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_eventType] PRIMARY KEY CLUSTERED 
(
	[eventTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoiceCharges]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoiceCharges](
	[invoiceChargeId] [int] IDENTITY(1,1) NOT NULL,
	[amount] [decimal](18, 2) NOT NULL,
	[wasteTypeId] [int] NOT NULL,
	[invoiceId] [int] NOT NULL,
 CONSTRAINT [PK_invoiceCharges] PRIMARY KEY CLUSTERED 
(
	[invoiceChargeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoices]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoices](
	[invoiceId] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[dueDate] [date] NOT NULL,
	[total_amount] [decimal](18, 2) NOT NULL,
	[producerId] [int] NOT NULL,
	[number] [int] NOT NULL,
	[taxes] [decimal](5, 2) NULL,
	[discountXsponsor] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_invoices] PRIMARY KEY CLUSTERED 
(
	[invoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[langaugesPerCountry]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[langaugesPerCountry](
	[languageXCountry] [int] NOT NULL,
	[languageId] [int] NOT NULL,
	[countryId] [int] NOT NULL,
 CONSTRAINT [PK_langaugesPerCountry] PRIMARY KEY CLUSTERED 
(
	[languageXCountry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[languages]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[languages](
	[languageId] [int] NOT NULL,
	[languageCode] [varchar](50) NOT NULL,
	[languageName] [varchar](50) NOT NULL,
	[languageDefault] [varchar](50) NOT NULL,
 CONSTRAINT [PK_languages] PRIMARY KEY CLUSTERED 
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[levels]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[levels](
	[levelId] [int] NOT NULL,
	[description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_levels] PRIMARY KEY CLUSTERED 
(
	[levelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[locals]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locals](
	[localId] [int] IDENTITY(1,1) NOT NULL,
	[addressId] [int] NOT NULL,
	[localName] [varchar](50) NOT NULL,
	[producerId] [int] NOT NULL,
 CONSTRAINT [PK_locals] PRIMARY KEY CLUSTERED 
(
	[localId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materials]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materials](
	[materialId] [int] IDENTITY(1,1) NOT NULL,
	[materialName] [varchar](50) NOT NULL,
	[wasteTypeId] [int] NOT NULL,
 CONSTRAINT [PK_materials] PRIMARY KEY CLUSTERED 
(
	[materialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materialsXproducts]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materialsXproducts](
	[materialXproductId] [int] IDENTITY(1,1) NOT NULL,
	[materialId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[contractId] [int] NOT NULL,
 CONSTRAINT [PK_materialsXproducts] PRIMARY KEY CLUSTERED 
(
	[materialXproductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[measures]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[measures](
	[measureId] [int] IDENTITY(1,1) NOT NULL,
	[measureName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_measures] PRIMARY KEY CLUSTERED 
(
	[measureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[models]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[models](
	[modelId] [int] IDENTITY(1,1) NOT NULL,
	[modelName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_models] PRIMARY KEY CLUSTERED 
(
	[modelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modelsXbrand]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modelsXbrand](
	[modelXbrandId] [int] IDENTITY(1,1) NOT NULL,
	[modelId] [int] NOT NULL,
	[brandId] [int] NOT NULL,
 CONSTRAINT [PK_modelsXbrand] PRIMARY KEY CLUSTERED 
(
	[modelXbrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movementTypes]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movementTypes](
	[movementTypeId] [int] IDENTITY(1,1) NOT NULL,
	[moveName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_movementTypes] PRIMARY KEY CLUSTERED 
(
	[movementTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[objectTypes]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[objectTypes](
	[objectTypeId] [int] NOT NULL,
	[objectName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_objectType] PRIMARY KEY CLUSTERED 
(
	[objectTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[participants]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[participants](
	[participantId] [int] IDENTITY(1,1) NOT NULL,
	[participantTypeId] [int] NOT NULL,
	[participantName] [varchar](50) NOT NULL,
	[countryId] [int] NOT NULL,
	[stateId] [int] NOT NULL,
	[cityId] [int] NOT NULL,
 CONSTRAINT [PK_participants] PRIMARY KEY CLUSTERED 
(
	[participantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[participantTypes]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[participantTypes](
	[participantTypeId] [int] IDENTITY(1,1) NOT NULL,
	[typeNAme] [varchar](50) NOT NULL,
 CONSTRAINT [PK_participantTypes] PRIMARY KEY CLUSTERED 
(
	[participantTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payments]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payments](
	[paymentId] [int] IDENTITY(1,1) NOT NULL,
	[transactionId] [int] NOT NULL,
	[invoiceId] [int] NOT NULL,
 CONSTRAINT [PK_payments] PRIMARY KEY CLUSTERED 
(
	[paymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paymentTypes]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paymentTypes](
	[paymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_paymentTypes] PRIMARY KEY CLUSTERED 
(
	[paymentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[processes]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[processes](
	[processId] [int] NOT NULL,
	[processName] [varchar](50) NOT NULL,
	[processDescription] [varchar](255) NOT NULL,
	[processStatusId] [int] NOT NULL,
 CONSTRAINT [PK_processes] PRIMARY KEY CLUSTERED 
(
	[processId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[processPriceHistory]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[processPriceHistory](
	[priceHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[processId] [int] NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[posttime] [timestamp] NOT NULL,
	[enabled] [binary](1) NOT NULL,
 CONSTRAINT [PK_processPriceHistory] PRIMARY KEY CLUSTERED 
(
	[priceHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[processpriceXCountry]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[processpriceXCountry](
	[processXcountry] [int] NOT NULL,
	[processId] [int] NOT NULL,
	[countryId] [int] NOT NULL,
	[processPriceXkg] [decimal](14, 2) NOT NULL,
	[enabled] [binary](1) NOT NULL,
	[postime] [timestamp] NOT NULL,
	[checksum] [varbinary](50) NOT NULL,
	[exchangeId] [int] NOT NULL,
 CONSTRAINT [PK_processpriceXCountry] PRIMARY KEY CLUSTERED 
(
	[processXcountry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[processStatus]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[processStatus](
	[processStatusId] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_processStatus] PRIMARY KEY CLUSTERED 
(
	[processStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producers]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producers](
	[producerId] [int] IDENTITY(1,1) NOT NULL,
	[producerName] [varchar](50) NOT NULL,
	[grade] [decimal](5, 2) NULL,
	[balance] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[producerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producersXmovements]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producersXmovements](
	[producerXmovement] [int] IDENTITY(1,1) NOT NULL,
	[producerId] [int] NOT NULL,
	[wasteMovementId] [int] NOT NULL,
 CONSTRAINT [PK_producersXmovements] PRIMARY KEY CLUSTERED 
(
	[producerXmovement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productionPlants]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productionPlants](
	[plantId] [int] IDENTITY(1,1) NOT NULL,
	[plantName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_productionPlants] PRIMARY KEY CLUSTERED 
(
	[plantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productionPlantsXmovements]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productionPlantsXmovements](
	[plantXmovement] [int] IDENTITY(1,1) NOT NULL,
	[plantId] [int] NOT NULL,
	[wasteMovementId] [int] NOT NULL,
 CONSTRAINT [PK_productionPlantsXmovements] PRIMARY KEY CLUSTERED 
(
	[plantXmovement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productionPlantXcontact]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productionPlantXcontact](
	[plantXcontactValueId] [int] IDENTITY(1,1) NOT NULL,
	[plantId] [int] NOT NULL,
	[contactValueId] [int] NOT NULL,
 CONSTRAINT [PK_productionPlantXcontact] PRIMARY KEY CLUSTERED 
(
	[plantXcontactValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[productId] [int] NOT NULL,
	[productName] [varchar](50) NOT NULL,
	[productPrice] [decimal](10, 2) NOT NULL,
	[expenses] [decimal](16, 2) NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regions]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regions](
	[regionId] [int] NOT NULL,
	[regionUnionId] [int] NOT NULL,
	[regionName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_regions] PRIMARY KEY CLUSTERED 
(
	[regionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regionUnions]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regionUnions](
	[regionUnionId] [int] NOT NULL,
	[cityId] [int] NULL,
	[stateId] [int] NULL,
	[countryId] [int] NULL,
 CONSTRAINT [PK_regionUnion] PRIMARY KEY CLUSTERED 
(
	[regionUnionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales](
	[saleid] [int] IDENTITY(1,1) NOT NULL,
	[clientId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[sellerId] [int] NOT NULL,
	[totalPrice] [decimal](12, 2) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[checksum] [varbinary](50) NULL,
	[paymentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_sales] PRIMARY KEY CLUSTERED 
(
	[saleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sources]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sources](
	[sourceId] [int] NOT NULL,
	[sourcName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_sources] PRIMARY KEY CLUSTERED 
(
	[sourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sponsors]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sponsors](
	[sponsorId] [int] IDENTITY(1,1) NOT NULL,
	[sponsorName] [varchar](50) NOT NULL,
	[regionId] [int] NULL,
	[cityId] [int] NULL,
	[stateId] [int] NULL,
	[countryId] [int] NULL,
	[wasteTypeId] [int] NOT NULL,
	[percentage] [decimal](5, 2) NOT NULL,
	[contractId] [int] NOT NULL,
 CONSTRAINT [PK_sponsors] PRIMARY KEY CLUSTERED 
(
	[sponsorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sponsorsXcontracts]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sponsorsXcontracts](
	[sponsorsXcontracts] [int] IDENTITY(1,1) NOT NULL,
	[sponsorId] [int] NOT NULL,
	[contractId] [int] NOT NULL,
 CONSTRAINT [PK_sponsorsXcontracts] PRIMARY KEY CLUSTERED 
(
	[sponsorsXcontracts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[states]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[states](
	[stateId] [int] IDENTITY(1,1) NOT NULL,
	[stateName] [varchar](50) NOT NULL,
	[countryId] [int] NOT NULL,
 CONSTRAINT [PK_states] PRIMARY KEY CLUSTERED 
(
	[stateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactions](
	[transactionId] [int] IDENTITY(1,1) NOT NULL,
	[amount] [decimal](14, 2) NOT NULL,
	[transactionDescription] [varchar](50) NOT NULL,
	[transactionTypeId] [int] NOT NULL,
 CONSTRAINT [PK_transactions] PRIMARY KEY CLUSTERED 
(
	[transactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactionType]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactionType](
	[transactionTypeId] [int] IDENTITY(1,1) NOT NULL,
	[transactionName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_transactionType] PRIMARY KEY CLUSTERED 
(
	[transactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[translations]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[translations](
	[translationId] [int] NOT NULL,
	[languageId] [int] NOT NULL,
	[label] [varchar](255) NOT NULL,
	[posttime] [timestamp] NOT NULL,
	[objectTypeId] [int] NOT NULL,
 CONSTRAINT [PK_translations] PRIMARY KEY CLUSTERED 
(
	[translationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usersResponsibles]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usersResponsibles](
	[userId] [int] NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[userApellido] [varchar](50) NOT NULL,
	[userEmail] [varchar](50) NOT NULL,
	[enabled] [binary](1) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[checksum] [varbinary](50) NULL,
 CONSTRAINT [PK_usersResponsibles] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wasteMovements]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wasteMovements](
	[wasteMovementId] [int] IDENTITY(1,1) NOT NULL,
	[posttime] [date] NOT NULL,
	[responsibleName] [varchar](50) NOT NULL,
	[signImage] [varbinary](50) NOT NULL,
	[addressId] [int] NOT NULL,
	[movementTypeId] [int] NOT NULL,
	[contractId] [int] NOT NULL,
	[quantity] [decimal](14, 2) NOT NULL,
	[userId] [int] NOT NULL,
	[checksum] [varbinary](50) NOT NULL,
	[computer] [varchar](50) NOT NULL,
	[containerId] [int] NOT NULL,
	[wasteId] [int] NOT NULL,
	[carId] [int] NULL,
 CONSTRAINT [PK_wasteMovements] PRIMARY KEY CLUSTERED 
(
	[wasteMovementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wastes]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wastes](
	[wasteId] [int] IDENTITY(1,1) NOT NULL,
	[wasteType] [int] NOT NULL,
	[wasteName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_waste] PRIMARY KEY CLUSTERED 
(
	[wasteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wastesXcollections]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wastesXcollections](
	[wastesXcollectionId] [int] IDENTITY(1,1) NOT NULL,
	[wasteId] [int] NOT NULL,
	[collectionId] [int] NOT NULL,
	[volume] [decimal](14, 2) NOT NULL,
	[measureId] [int] NOT NULL,
 CONSTRAINT [PK_wastesXcollections] PRIMARY KEY CLUSTERED 
(
	[wastesXcollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wasteTypes]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wasteTypes](
	[wasteTypeId] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [varchar](50) NOT NULL,
	[recyclable] [binary](50) NOT NULL,
 CONSTRAINT [PK_wasteTypes] PRIMARY KEY CLUSTERED 
(
	[wasteTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wasteTypesXcertification]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wasteTypesXcertification](
	[wasteTypeXcertificationId] [int] IDENTITY(1,1) NOT NULL,
	[wasteTypeId] [int] NOT NULL,
	[certificationId] [int] NOT NULL,
 CONSTRAINT [PK_wasteTypesXcertification] PRIMARY KEY CLUSTERED 
(
	[wasteTypeXcertificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wasteTypesXprocess]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wasteTypesXprocess](
	[wasteTypeXprocessId] [int] IDENTITY(1,1) NOT NULL,
	[wasteTypeId] [int] NOT NULL,
	[processId] [int] NOT NULL,
 CONSTRAINT [PK_wasteTypesXprocess] PRIMARY KEY CLUSTERED 
(
	[wasteTypeXprocessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wasteTypeXcontainerType]    Script Date: 29/4/2023 12:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wasteTypeXcontainerType](
	[wasteXcontainerId] [int] IDENTITY(1,1) NOT NULL,
	[wasteTypeId] [int] NOT NULL,
	[containerTypeId] [int] NOT NULL,
 CONSTRAINT [PK_wasteTypeXcontainerType] PRIMARY KEY CLUSTERED 
(
	[wasteXcontainerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[addresses]  WITH CHECK ADD  CONSTRAINT [FK_addresses_cities] FOREIGN KEY([cityId])
REFERENCES [dbo].[cities] ([cityId])
GO
ALTER TABLE [dbo].[addresses] CHECK CONSTRAINT [FK_addresses_cities]
GO
ALTER TABLE [dbo].[addresses]  WITH CHECK ADD  CONSTRAINT [FK_addresses_countries] FOREIGN KEY([countryId])
REFERENCES [dbo].[countries] ([countryId])
GO
ALTER TABLE [dbo].[addresses] CHECK CONSTRAINT [FK_addresses_countries]
GO
ALTER TABLE [dbo].[addresses]  WITH CHECK ADD  CONSTRAINT [FK_addresses_states] FOREIGN KEY([stateId])
REFERENCES [dbo].[states] ([stateId])
GO
ALTER TABLE [dbo].[addresses] CHECK CONSTRAINT [FK_addresses_states]
GO
ALTER TABLE [dbo].[agreements]  WITH CHECK ADD  CONSTRAINT [FK_agreements_agreementStatus] FOREIGN KEY([agreementStatusId])
REFERENCES [dbo].[agreementStatus] ([agreementSatusId])
GO
ALTER TABLE [dbo].[agreements] CHECK CONSTRAINT [FK_agreements_agreementStatus]
GO
ALTER TABLE [dbo].[cars]  WITH CHECK ADD  CONSTRAINT [FK_cars_carTypes] FOREIGN KEY([carTypeId])
REFERENCES [dbo].[carTypes] ([carTypeId])
GO
ALTER TABLE [dbo].[cars] CHECK CONSTRAINT [FK_cars_carTypes]
GO
ALTER TABLE [dbo].[certificationsXproducer]  WITH CHECK ADD  CONSTRAINT [FK_certificationsXproducer_certifications] FOREIGN KEY([certificationId])
REFERENCES [dbo].[certifications] ([certificationId])
GO
ALTER TABLE [dbo].[certificationsXproducer] CHECK CONSTRAINT [FK_certificationsXproducer_certifications]
GO
ALTER TABLE [dbo].[certificationsXproducer]  WITH CHECK ADD  CONSTRAINT [FK_certificationsXproducer_producers] FOREIGN KEY([producerId])
REFERENCES [dbo].[producers] ([producerId])
GO
ALTER TABLE [dbo].[certificationsXproducer] CHECK CONSTRAINT [FK_certificationsXproducer_producers]
GO
ALTER TABLE [dbo].[cities]  WITH CHECK ADD  CONSTRAINT [FK_cities_states] FOREIGN KEY([stateId])
REFERENCES [dbo].[states] ([stateId])
GO
ALTER TABLE [dbo].[cities] CHECK CONSTRAINT [FK_cities_states]
GO
ALTER TABLE [dbo].[citiesXcontract]  WITH CHECK ADD  CONSTRAINT [FK_citiesXcontract_cities] FOREIGN KEY([cityId])
REFERENCES [dbo].[cities] ([cityId])
GO
ALTER TABLE [dbo].[citiesXcontract] CHECK CONSTRAINT [FK_citiesXcontract_cities]
GO
ALTER TABLE [dbo].[collectionAssignments]  WITH CHECK ADD  CONSTRAINT [FK_collectionAssignments_collectionPoints] FOREIGN KEY([collectionPointId])
REFERENCES [dbo].[collectionPoints] ([collectionPointId])
GO
ALTER TABLE [dbo].[collectionAssignments] CHECK CONSTRAINT [FK_collectionAssignments_collectionPoints]
GO
ALTER TABLE [dbo].[collectionAssignments]  WITH CHECK ADD  CONSTRAINT [FK_collectionAssignments_collectors] FOREIGN KEY([collectorId])
REFERENCES [dbo].[collectors] ([collectorId])
GO
ALTER TABLE [dbo].[collectionAssignments] CHECK CONSTRAINT [FK_collectionAssignments_collectors]
GO
ALTER TABLE [dbo].[collectionAssignments]  WITH CHECK ADD  CONSTRAINT [FK_collectionAssignments_producers] FOREIGN KEY([producerId])
REFERENCES [dbo].[producers] ([producerId])
GO
ALTER TABLE [dbo].[collectionAssignments] CHECK CONSTRAINT [FK_collectionAssignments_producers]
GO
ALTER TABLE [dbo].[collections]  WITH CHECK ADD  CONSTRAINT [FK_collections_collectionAssignments] FOREIGN KEY([collectionAssignmentId])
REFERENCES [dbo].[collectionAssignments] ([collectionAssignmentId])
GO
ALTER TABLE [dbo].[collections] CHECK CONSTRAINT [FK_collections_collectionAssignments]
GO
ALTER TABLE [dbo].[collections]  WITH CHECK ADD  CONSTRAINT [FK_collections_containers] FOREIGN KEY([containerId])
REFERENCES [dbo].[containers] ([containerId])
GO
ALTER TABLE [dbo].[collections] CHECK CONSTRAINT [FK_collections_containers]
GO
ALTER TABLE [dbo].[collections]  WITH CHECK ADD  CONSTRAINT [FK_collections_contracts] FOREIGN KEY([contractId])
REFERENCES [dbo].[contracts] ([contractId])
GO
ALTER TABLE [dbo].[collections] CHECK CONSTRAINT [FK_collections_contracts]
GO
ALTER TABLE [dbo].[collectorsXMovements]  WITH CHECK ADD  CONSTRAINT [FK_collectorsXMovements_collectors] FOREIGN KEY([collectorId])
REFERENCES [dbo].[collectors] ([collectorId])
GO
ALTER TABLE [dbo].[collectorsXMovements] CHECK CONSTRAINT [FK_collectorsXMovements_collectors]
GO
ALTER TABLE [dbo].[collectorsXMovements]  WITH CHECK ADD  CONSTRAINT [FK_collectorsXMovements_wasteMovements] FOREIGN KEY([wasteMovementId])
REFERENCES [dbo].[wasteMovements] ([wasteMovementId])
GO
ALTER TABLE [dbo].[collectorsXMovements] CHECK CONSTRAINT [FK_collectorsXMovements_wasteMovements]
GO
ALTER TABLE [dbo].[contactsXcollectors]  WITH CHECK ADD  CONSTRAINT [FK_contactsXcollectors_collectors] FOREIGN KEY([collectorId])
REFERENCES [dbo].[collectors] ([collectorId])
GO
ALTER TABLE [dbo].[contactsXcollectors] CHECK CONSTRAINT [FK_contactsXcollectors_collectors]
GO
ALTER TABLE [dbo].[contactsXcollectors]  WITH CHECK ADD  CONSTRAINT [FK_contactsXcollectors_contactValues] FOREIGN KEY([contactValueId])
REFERENCES [dbo].[contactValues] ([contactValueId])
GO
ALTER TABLE [dbo].[contactsXcollectors] CHECK CONSTRAINT [FK_contactsXcollectors_contactValues]
GO
ALTER TABLE [dbo].[contactsXparticipant]  WITH CHECK ADD  CONSTRAINT [FK_contactsXparticipant_contactValues] FOREIGN KEY([contactValueId])
REFERENCES [dbo].[contactValues] ([contactValueId])
GO
ALTER TABLE [dbo].[contactsXparticipant] CHECK CONSTRAINT [FK_contactsXparticipant_contactValues]
GO
ALTER TABLE [dbo].[contactsXparticipant]  WITH CHECK ADD  CONSTRAINT [FK_contactsXparticipant_participants] FOREIGN KEY([participantId])
REFERENCES [dbo].[participants] ([participantId])
GO
ALTER TABLE [dbo].[contactsXparticipant] CHECK CONSTRAINT [FK_contactsXparticipant_participants]
GO
ALTER TABLE [dbo].[contactsXproducers]  WITH CHECK ADD  CONSTRAINT [FK_contactsXproducers_contactValues] FOREIGN KEY([contactXproducerId])
REFERENCES [dbo].[contactValues] ([contactValueId])
GO
ALTER TABLE [dbo].[contactsXproducers] CHECK CONSTRAINT [FK_contactsXproducers_contactValues]
GO
ALTER TABLE [dbo].[contactsXproducers]  WITH CHECK ADD  CONSTRAINT [FK_contactsXproducers_producers] FOREIGN KEY([producerId])
REFERENCES [dbo].[producers] ([producerId])
GO
ALTER TABLE [dbo].[contactsXproducers] CHECK CONSTRAINT [FK_contactsXproducers_producers]
GO
ALTER TABLE [dbo].[contactValues]  WITH CHECK ADD  CONSTRAINT [FK_contactValues_contactTypes] FOREIGN KEY([contactValueId])
REFERENCES [dbo].[contactTypes] ([contactTypeId])
GO
ALTER TABLE [dbo].[contactValues] CHECK CONSTRAINT [FK_contactValues_contactTypes]
GO
ALTER TABLE [dbo].[containerMovements]  WITH CHECK ADD  CONSTRAINT [FK_containerMovements_containerActions] FOREIGN KEY([containerActionId])
REFERENCES [dbo].[containerActions] ([containerActionId])
GO
ALTER TABLE [dbo].[containerMovements] CHECK CONSTRAINT [FK_containerMovements_containerActions]
GO
ALTER TABLE [dbo].[containerMovements]  WITH CHECK ADD  CONSTRAINT [FK_containerMovements_containers] FOREIGN KEY([containerId])
REFERENCES [dbo].[containers] ([containerId])
GO
ALTER TABLE [dbo].[containerMovements] CHECK CONSTRAINT [FK_containerMovements_containers]
GO
ALTER TABLE [dbo].[containers]  WITH CHECK ADD  CONSTRAINT [FK_containers_containerTypes] FOREIGN KEY([containerTypeId])
REFERENCES [dbo].[containerTypes] ([containerTypeId])
GO
ALTER TABLE [dbo].[containers] CHECK CONSTRAINT [FK_containers_containerTypes]
GO
ALTER TABLE [dbo].[containerTypes]  WITH CHECK ADD  CONSTRAINT [FK_containerTypes_brands] FOREIGN KEY([brandId])
REFERENCES [dbo].[brands] ([brandId])
GO
ALTER TABLE [dbo].[containerTypes] CHECK CONSTRAINT [FK_containerTypes_brands]
GO
ALTER TABLE [dbo].[containerTypes]  WITH CHECK ADD  CONSTRAINT [FK_containerTypes_measures] FOREIGN KEY([measureId])
REFERENCES [dbo].[measures] ([measureId])
GO
ALTER TABLE [dbo].[containerTypes] CHECK CONSTRAINT [FK_containerTypes_measures]
GO
ALTER TABLE [dbo].[containerTypes]  WITH CHECK ADD  CONSTRAINT [FK_containerTypes_models] FOREIGN KEY([modelId])
REFERENCES [dbo].[models] ([modelId])
GO
ALTER TABLE [dbo].[containerTypes] CHECK CONSTRAINT [FK_containerTypes_models]
GO
ALTER TABLE [dbo].[contractAgreements]  WITH CHECK ADD  CONSTRAINT [FK_contractAgreements_agreements] FOREIGN KEY([agreementId])
REFERENCES [dbo].[agreements] ([agreementId])
GO
ALTER TABLE [dbo].[contractAgreements] CHECK CONSTRAINT [FK_contractAgreements_agreements]
GO
ALTER TABLE [dbo].[contractAgreements]  WITH CHECK ADD  CONSTRAINT [FK_contractAgreements_contracts] FOREIGN KEY([contractId])
REFERENCES [dbo].[contracts] ([contractId])
GO
ALTER TABLE [dbo].[contractAgreements] CHECK CONSTRAINT [FK_contractAgreements_contracts]
GO
ALTER TABLE [dbo].[contractParticipants]  WITH CHECK ADD  CONSTRAINT [FK_contractParticipants_collectors] FOREIGN KEY([collectorId])
REFERENCES [dbo].[collectors] ([collectorId])
GO
ALTER TABLE [dbo].[contractParticipants] CHECK CONSTRAINT [FK_contractParticipants_collectors]
GO
ALTER TABLE [dbo].[contractParticipants]  WITH CHECK ADD  CONSTRAINT [FK_contractParticipants_contracts] FOREIGN KEY([contractId])
REFERENCES [dbo].[contracts] ([contractId])
GO
ALTER TABLE [dbo].[contractParticipants] CHECK CONSTRAINT [FK_contractParticipants_contracts]
GO
ALTER TABLE [dbo].[contractParticipants]  WITH CHECK ADD  CONSTRAINT [FK_contractParticipants_participants] FOREIGN KEY([participantId])
REFERENCES [dbo].[participants] ([participantId])
GO
ALTER TABLE [dbo].[contractParticipants] CHECK CONSTRAINT [FK_contractParticipants_participants]
GO
ALTER TABLE [dbo].[contractParticipants]  WITH CHECK ADD  CONSTRAINT [FK_contractParticipants_producers] FOREIGN KEY([producerId])
REFERENCES [dbo].[producers] ([producerId])
GO
ALTER TABLE [dbo].[contractParticipants] CHECK CONSTRAINT [FK_contractParticipants_producers]
GO
ALTER TABLE [dbo].[contracts]  WITH CHECK ADD  CONSTRAINT [FK_contracts_contractStatus] FOREIGN KEY([contractStatusId])
REFERENCES [dbo].[contractStatus] ([contractStatusId])
GO
ALTER TABLE [dbo].[contracts] CHECK CONSTRAINT [FK_contracts_contractStatus]
GO
ALTER TABLE [dbo].[currencyExchanges]  WITH CHECK ADD  CONSTRAINT [FK_exchangeRate_currency1] FOREIGN KEY([currencyId])
REFERENCES [dbo].[currency] ([currencyId])
GO
ALTER TABLE [dbo].[currencyExchanges] CHECK CONSTRAINT [FK_exchangeRate_currency1]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_eventType] FOREIGN KEY([eventTypeId])
REFERENCES [dbo].[eventTypes] ([eventTypeId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_eventType]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_levels] FOREIGN KEY([levelId])
REFERENCES [dbo].[levels] ([levelId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_levels]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_objectType] FOREIGN KEY([objectTypeId])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_objectType]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_sources] FOREIGN KEY([sourceId])
REFERENCES [dbo].[sources] ([sourceId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_sources]
GO
ALTER TABLE [dbo].[invoiceCharges]  WITH CHECK ADD  CONSTRAINT [FK_invoiceCharges_invoices] FOREIGN KEY([invoiceId])
REFERENCES [dbo].[invoices] ([invoiceId])
GO
ALTER TABLE [dbo].[invoiceCharges] CHECK CONSTRAINT [FK_invoiceCharges_invoices]
GO
ALTER TABLE [dbo].[invoiceCharges]  WITH CHECK ADD  CONSTRAINT [FK_invoiceCharges_wasteTypes] FOREIGN KEY([wasteTypeId])
REFERENCES [dbo].[wasteTypes] ([wasteTypeId])
GO
ALTER TABLE [dbo].[invoiceCharges] CHECK CONSTRAINT [FK_invoiceCharges_wasteTypes]
GO
ALTER TABLE [dbo].[invoices]  WITH CHECK ADD  CONSTRAINT [FK_invoices_producers] FOREIGN KEY([producerId])
REFERENCES [dbo].[producers] ([producerId])
GO
ALTER TABLE [dbo].[invoices] CHECK CONSTRAINT [FK_invoices_producers]
GO
ALTER TABLE [dbo].[langaugesPerCountry]  WITH CHECK ADD  CONSTRAINT [FK_langaugesPerCountry_countries] FOREIGN KEY([countryId])
REFERENCES [dbo].[countries] ([countryId])
GO
ALTER TABLE [dbo].[langaugesPerCountry] CHECK CONSTRAINT [FK_langaugesPerCountry_countries]
GO
ALTER TABLE [dbo].[langaugesPerCountry]  WITH CHECK ADD  CONSTRAINT [FK_langaugesPerCountry_languages] FOREIGN KEY([languageId])
REFERENCES [dbo].[languages] ([languageId])
GO
ALTER TABLE [dbo].[langaugesPerCountry] CHECK CONSTRAINT [FK_langaugesPerCountry_languages]
GO
ALTER TABLE [dbo].[locals]  WITH CHECK ADD  CONSTRAINT [FK_locals_addresses] FOREIGN KEY([addressId])
REFERENCES [dbo].[addresses] ([addressId])
GO
ALTER TABLE [dbo].[locals] CHECK CONSTRAINT [FK_locals_addresses]
GO
ALTER TABLE [dbo].[locals]  WITH CHECK ADD  CONSTRAINT [FK_locals_producers] FOREIGN KEY([producerId])
REFERENCES [dbo].[producers] ([producerId])
GO
ALTER TABLE [dbo].[locals] CHECK CONSTRAINT [FK_locals_producers]
GO
ALTER TABLE [dbo].[materials]  WITH CHECK ADD  CONSTRAINT [FK_materials_wasteTypes] FOREIGN KEY([wasteTypeId])
REFERENCES [dbo].[wasteTypes] ([wasteTypeId])
GO
ALTER TABLE [dbo].[materials] CHECK CONSTRAINT [FK_materials_wasteTypes]
GO
ALTER TABLE [dbo].[materialsXproducts]  WITH CHECK ADD  CONSTRAINT [FK_materialsXproducts_contracts] FOREIGN KEY([contractId])
REFERENCES [dbo].[contracts] ([contractId])
GO
ALTER TABLE [dbo].[materialsXproducts] CHECK CONSTRAINT [FK_materialsXproducts_contracts]
GO
ALTER TABLE [dbo].[materialsXproducts]  WITH CHECK ADD  CONSTRAINT [FK_materialsXproducts_materials] FOREIGN KEY([materialId])
REFERENCES [dbo].[materials] ([materialId])
GO
ALTER TABLE [dbo].[materialsXproducts] CHECK CONSTRAINT [FK_materialsXproducts_materials]
GO
ALTER TABLE [dbo].[materialsXproducts]  WITH CHECK ADD  CONSTRAINT [FK_materialsXproducts_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([productId])
GO
ALTER TABLE [dbo].[materialsXproducts] CHECK CONSTRAINT [FK_materialsXproducts_products]
GO
ALTER TABLE [dbo].[modelsXbrand]  WITH CHECK ADD  CONSTRAINT [FK_modelsXbrand_brands] FOREIGN KEY([brandId])
REFERENCES [dbo].[brands] ([brandId])
GO
ALTER TABLE [dbo].[modelsXbrand] CHECK CONSTRAINT [FK_modelsXbrand_brands]
GO
ALTER TABLE [dbo].[modelsXbrand]  WITH CHECK ADD  CONSTRAINT [FK_modelsXbrand_models] FOREIGN KEY([modelId])
REFERENCES [dbo].[models] ([modelId])
GO
ALTER TABLE [dbo].[modelsXbrand] CHECK CONSTRAINT [FK_modelsXbrand_models]
GO
ALTER TABLE [dbo].[participants]  WITH CHECK ADD  CONSTRAINT [FK_participants_cities] FOREIGN KEY([cityId])
REFERENCES [dbo].[cities] ([cityId])
GO
ALTER TABLE [dbo].[participants] CHECK CONSTRAINT [FK_participants_cities]
GO
ALTER TABLE [dbo].[participants]  WITH CHECK ADD  CONSTRAINT [FK_participants_countries] FOREIGN KEY([countryId])
REFERENCES [dbo].[countries] ([countryId])
GO
ALTER TABLE [dbo].[participants] CHECK CONSTRAINT [FK_participants_countries]
GO
ALTER TABLE [dbo].[participants]  WITH CHECK ADD  CONSTRAINT [FK_participants_participantTypes] FOREIGN KEY([participantTypeId])
REFERENCES [dbo].[participantTypes] ([participantTypeId])
GO
ALTER TABLE [dbo].[participants] CHECK CONSTRAINT [FK_participants_participantTypes]
GO
ALTER TABLE [dbo].[participants]  WITH CHECK ADD  CONSTRAINT [FK_participants_states] FOREIGN KEY([stateId])
REFERENCES [dbo].[states] ([stateId])
GO
ALTER TABLE [dbo].[participants] CHECK CONSTRAINT [FK_participants_states]
GO
ALTER TABLE [dbo].[payments]  WITH CHECK ADD  CONSTRAINT [FK_payments_invoices] FOREIGN KEY([invoiceId])
REFERENCES [dbo].[invoices] ([invoiceId])
GO
ALTER TABLE [dbo].[payments] CHECK CONSTRAINT [FK_payments_invoices]
GO
ALTER TABLE [dbo].[payments]  WITH CHECK ADD  CONSTRAINT [FK_payments_transactions] FOREIGN KEY([transactionId])
REFERENCES [dbo].[transactions] ([transactionId])
GO
ALTER TABLE [dbo].[payments] CHECK CONSTRAINT [FK_payments_transactions]
GO
ALTER TABLE [dbo].[processes]  WITH CHECK ADD  CONSTRAINT [FK_processes_processStatus] FOREIGN KEY([processStatusId])
REFERENCES [dbo].[processStatus] ([processStatusId])
GO
ALTER TABLE [dbo].[processes] CHECK CONSTRAINT [FK_processes_processStatus]
GO
ALTER TABLE [dbo].[processPriceHistory]  WITH CHECK ADD  CONSTRAINT [FK_processPriceHistory_processes] FOREIGN KEY([processId])
REFERENCES [dbo].[processes] ([processId])
GO
ALTER TABLE [dbo].[processPriceHistory] CHECK CONSTRAINT [FK_processPriceHistory_processes]
GO
ALTER TABLE [dbo].[processpriceXCountry]  WITH CHECK ADD  CONSTRAINT [FK_processpriceXCountry_currencyExchanges] FOREIGN KEY([exchangeId])
REFERENCES [dbo].[currencyExchanges] ([exchangeId])
GO
ALTER TABLE [dbo].[processpriceXCountry] CHECK CONSTRAINT [FK_processpriceXCountry_currencyExchanges]
GO
ALTER TABLE [dbo].[processpriceXCountry]  WITH CHECK ADD  CONSTRAINT [FK_processpriceXCountry_processes] FOREIGN KEY([processId])
REFERENCES [dbo].[processes] ([processId])
GO
ALTER TABLE [dbo].[processpriceXCountry] CHECK CONSTRAINT [FK_processpriceXCountry_processes]
GO
ALTER TABLE [dbo].[producersXmovements]  WITH CHECK ADD  CONSTRAINT [FK_producersXmovements_producers] FOREIGN KEY([producerId])
REFERENCES [dbo].[producers] ([producerId])
GO
ALTER TABLE [dbo].[producersXmovements] CHECK CONSTRAINT [FK_producersXmovements_producers]
GO
ALTER TABLE [dbo].[producersXmovements]  WITH CHECK ADD  CONSTRAINT [FK_producersXmovements_wasteMovements] FOREIGN KEY([wasteMovementId])
REFERENCES [dbo].[wasteMovements] ([wasteMovementId])
GO
ALTER TABLE [dbo].[producersXmovements] CHECK CONSTRAINT [FK_producersXmovements_wasteMovements]
GO
ALTER TABLE [dbo].[productionPlantsXmovements]  WITH CHECK ADD  CONSTRAINT [FK_productionPlantsXmovements_productionPlants] FOREIGN KEY([plantId])
REFERENCES [dbo].[productionPlants] ([plantId])
GO
ALTER TABLE [dbo].[productionPlantsXmovements] CHECK CONSTRAINT [FK_productionPlantsXmovements_productionPlants]
GO
ALTER TABLE [dbo].[productionPlantsXmovements]  WITH CHECK ADD  CONSTRAINT [FK_productionPlantsXmovements_wasteMovements] FOREIGN KEY([wasteMovementId])
REFERENCES [dbo].[wasteMovements] ([wasteMovementId])
GO
ALTER TABLE [dbo].[productionPlantsXmovements] CHECK CONSTRAINT [FK_productionPlantsXmovements_wasteMovements]
GO
ALTER TABLE [dbo].[productionPlantXcontact]  WITH CHECK ADD  CONSTRAINT [FK_productionPlantXcontact_contactValues] FOREIGN KEY([contactValueId])
REFERENCES [dbo].[contactValues] ([contactValueId])
GO
ALTER TABLE [dbo].[productionPlantXcontact] CHECK CONSTRAINT [FK_productionPlantXcontact_contactValues]
GO
ALTER TABLE [dbo].[productionPlantXcontact]  WITH CHECK ADD  CONSTRAINT [FK_productionPlantXcontact_productionPlants] FOREIGN KEY([plantId])
REFERENCES [dbo].[productionPlants] ([plantId])
GO
ALTER TABLE [dbo].[productionPlantXcontact] CHECK CONSTRAINT [FK_productionPlantXcontact_productionPlants]
GO
ALTER TABLE [dbo].[regions]  WITH CHECK ADD  CONSTRAINT [FK_regions_regionUnion] FOREIGN KEY([regionUnionId])
REFERENCES [dbo].[regionUnions] ([regionUnionId])
GO
ALTER TABLE [dbo].[regions] CHECK CONSTRAINT [FK_regions_regionUnion]
GO
ALTER TABLE [dbo].[regionUnions]  WITH CHECK ADD  CONSTRAINT [FK_regionUnion_cities] FOREIGN KEY([cityId])
REFERENCES [dbo].[cities] ([cityId])
GO
ALTER TABLE [dbo].[regionUnions] CHECK CONSTRAINT [FK_regionUnion_cities]
GO
ALTER TABLE [dbo].[regionUnions]  WITH CHECK ADD  CONSTRAINT [FK_regionUnion_countries] FOREIGN KEY([countryId])
REFERENCES [dbo].[countries] ([countryId])
GO
ALTER TABLE [dbo].[regionUnions] CHECK CONSTRAINT [FK_regionUnion_countries]
GO
ALTER TABLE [dbo].[regionUnions]  WITH CHECK ADD  CONSTRAINT [FK_regionUnion_states] FOREIGN KEY([stateId])
REFERENCES [dbo].[states] ([stateId])
GO
ALTER TABLE [dbo].[regionUnions] CHECK CONSTRAINT [FK_regionUnion_states]
GO
ALTER TABLE [dbo].[sales]  WITH CHECK ADD  CONSTRAINT [FK_sales_participants] FOREIGN KEY([sellerId])
REFERENCES [dbo].[participants] ([participantId])
GO
ALTER TABLE [dbo].[sales] CHECK CONSTRAINT [FK_sales_participants]
GO
ALTER TABLE [dbo].[sales]  WITH CHECK ADD  CONSTRAINT [FK_sales_participants1] FOREIGN KEY([clientId])
REFERENCES [dbo].[participants] ([participantId])
GO
ALTER TABLE [dbo].[sales] CHECK CONSTRAINT [FK_sales_participants1]
GO
ALTER TABLE [dbo].[sales]  WITH CHECK ADD  CONSTRAINT [FK_sales_paymentTypes] FOREIGN KEY([paymentTypeId])
REFERENCES [dbo].[paymentTypes] ([paymentTypeId])
GO
ALTER TABLE [dbo].[sales] CHECK CONSTRAINT [FK_sales_paymentTypes]
GO
ALTER TABLE [dbo].[sales]  WITH CHECK ADD  CONSTRAINT [FK_sales_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([productId])
GO
ALTER TABLE [dbo].[sales] CHECK CONSTRAINT [FK_sales_products]
GO
ALTER TABLE [dbo].[sponsors]  WITH CHECK ADD  CONSTRAINT [FK_sponsors_cities] FOREIGN KEY([cityId])
REFERENCES [dbo].[cities] ([cityId])
GO
ALTER TABLE [dbo].[sponsors] CHECK CONSTRAINT [FK_sponsors_cities]
GO
ALTER TABLE [dbo].[sponsors]  WITH CHECK ADD  CONSTRAINT [FK_sponsors_contracts] FOREIGN KEY([contractId])
REFERENCES [dbo].[contracts] ([contractId])
GO
ALTER TABLE [dbo].[sponsors] CHECK CONSTRAINT [FK_sponsors_contracts]
GO
ALTER TABLE [dbo].[sponsors]  WITH CHECK ADD  CONSTRAINT [FK_sponsors_countries] FOREIGN KEY([countryId])
REFERENCES [dbo].[countries] ([countryId])
GO
ALTER TABLE [dbo].[sponsors] CHECK CONSTRAINT [FK_sponsors_countries]
GO
ALTER TABLE [dbo].[sponsors]  WITH CHECK ADD  CONSTRAINT [FK_sponsors_regions] FOREIGN KEY([regionId])
REFERENCES [dbo].[regions] ([regionId])
GO
ALTER TABLE [dbo].[sponsors] CHECK CONSTRAINT [FK_sponsors_regions]
GO
ALTER TABLE [dbo].[sponsors]  WITH CHECK ADD  CONSTRAINT [FK_sponsors_states] FOREIGN KEY([stateId])
REFERENCES [dbo].[states] ([stateId])
GO
ALTER TABLE [dbo].[sponsors] CHECK CONSTRAINT [FK_sponsors_states]
GO
ALTER TABLE [dbo].[sponsors]  WITH CHECK ADD  CONSTRAINT [FK_sponsors_wasteTypes] FOREIGN KEY([wasteTypeId])
REFERENCES [dbo].[wasteTypes] ([wasteTypeId])
GO
ALTER TABLE [dbo].[sponsors] CHECK CONSTRAINT [FK_sponsors_wasteTypes]
GO
ALTER TABLE [dbo].[sponsorsXcontracts]  WITH CHECK ADD  CONSTRAINT [FK_sponsorsXcontracts_contracts] FOREIGN KEY([contractId])
REFERENCES [dbo].[contracts] ([contractId])
GO
ALTER TABLE [dbo].[sponsorsXcontracts] CHECK CONSTRAINT [FK_sponsorsXcontracts_contracts]
GO
ALTER TABLE [dbo].[sponsorsXcontracts]  WITH CHECK ADD  CONSTRAINT [FK_sponsorsXcontracts_sponsors] FOREIGN KEY([sponsorId])
REFERENCES [dbo].[sponsors] ([sponsorId])
GO
ALTER TABLE [dbo].[sponsorsXcontracts] CHECK CONSTRAINT [FK_sponsorsXcontracts_sponsors]
GO
ALTER TABLE [dbo].[states]  WITH CHECK ADD  CONSTRAINT [FK_states_countries] FOREIGN KEY([countryId])
REFERENCES [dbo].[countries] ([countryId])
GO
ALTER TABLE [dbo].[states] CHECK CONSTRAINT [FK_states_countries]
GO
ALTER TABLE [dbo].[transactions]  WITH CHECK ADD  CONSTRAINT [FK_transactions_transactionType] FOREIGN KEY([transactionTypeId])
REFERENCES [dbo].[transactionType] ([transactionTypeId])
GO
ALTER TABLE [dbo].[transactions] CHECK CONSTRAINT [FK_transactions_transactionType]
GO
ALTER TABLE [dbo].[translations]  WITH CHECK ADD  CONSTRAINT [FK_translations_languages] FOREIGN KEY([languageId])
REFERENCES [dbo].[languages] ([languageId])
GO
ALTER TABLE [dbo].[translations] CHECK CONSTRAINT [FK_translations_languages]
GO
ALTER TABLE [dbo].[translations]  WITH CHECK ADD  CONSTRAINT [FK_translations_objectType] FOREIGN KEY([objectTypeId])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[translations] CHECK CONSTRAINT [FK_translations_objectType]
GO
ALTER TABLE [dbo].[wasteMovements]  WITH CHECK ADD  CONSTRAINT [FK_wasteMovements_addresses] FOREIGN KEY([addressId])
REFERENCES [dbo].[addresses] ([addressId])
GO
ALTER TABLE [dbo].[wasteMovements] CHECK CONSTRAINT [FK_wasteMovements_addresses]
GO
ALTER TABLE [dbo].[wasteMovements]  WITH CHECK ADD  CONSTRAINT [FK_wasteMovements_cars] FOREIGN KEY([carId])
REFERENCES [dbo].[cars] ([carId])
GO
ALTER TABLE [dbo].[wasteMovements] CHECK CONSTRAINT [FK_wasteMovements_cars]
GO
ALTER TABLE [dbo].[wasteMovements]  WITH CHECK ADD  CONSTRAINT [FK_wasteMovements_containerTypes] FOREIGN KEY([containerId])
REFERENCES [dbo].[containers] ([containerId])
GO
ALTER TABLE [dbo].[wasteMovements] CHECK CONSTRAINT [FK_wasteMovements_containerTypes]
GO
ALTER TABLE [dbo].[wasteMovements]  WITH CHECK ADD  CONSTRAINT [FK_wasteMovements_contracts] FOREIGN KEY([contractId])
REFERENCES [dbo].[contracts] ([contractId])
GO
ALTER TABLE [dbo].[wasteMovements] CHECK CONSTRAINT [FK_wasteMovements_contracts]
GO
ALTER TABLE [dbo].[wasteMovements]  WITH CHECK ADD  CONSTRAINT [FK_wasteMovements_movementTypes] FOREIGN KEY([movementTypeId])
REFERENCES [dbo].[movementTypes] ([movementTypeId])
GO
ALTER TABLE [dbo].[wasteMovements] CHECK CONSTRAINT [FK_wasteMovements_movementTypes]
GO
ALTER TABLE [dbo].[wasteMovements]  WITH CHECK ADD  CONSTRAINT [FK_wasteMovements_usersResponsibles] FOREIGN KEY([userId])
REFERENCES [dbo].[usersResponsibles] ([userId])
GO
ALTER TABLE [dbo].[wasteMovements] CHECK CONSTRAINT [FK_wasteMovements_usersResponsibles]
GO
ALTER TABLE [dbo].[wasteMovements]  WITH CHECK ADD  CONSTRAINT [FK_wasteMovements_wastes] FOREIGN KEY([wasteId])
REFERENCES [dbo].[wastes] ([wasteId])
GO
ALTER TABLE [dbo].[wasteMovements] CHECK CONSTRAINT [FK_wasteMovements_wastes]
GO
ALTER TABLE [dbo].[wastes]  WITH CHECK ADD  CONSTRAINT [FK_waste_wasteTypes] FOREIGN KEY([wasteType])
REFERENCES [dbo].[wasteTypes] ([wasteTypeId])
GO
ALTER TABLE [dbo].[wastes] CHECK CONSTRAINT [FK_waste_wasteTypes]
GO
ALTER TABLE [dbo].[wastesXcollections]  WITH CHECK ADD  CONSTRAINT [FK_wastesXcollections_collections] FOREIGN KEY([collectionId])
REFERENCES [dbo].[collections] ([collectionId])
GO
ALTER TABLE [dbo].[wastesXcollections] CHECK CONSTRAINT [FK_wastesXcollections_collections]
GO
ALTER TABLE [dbo].[wastesXcollections]  WITH CHECK ADD  CONSTRAINT [FK_wastesXcollections_measures] FOREIGN KEY([measureId])
REFERENCES [dbo].[measures] ([measureId])
GO
ALTER TABLE [dbo].[wastesXcollections] CHECK CONSTRAINT [FK_wastesXcollections_measures]
GO
ALTER TABLE [dbo].[wastesXcollections]  WITH CHECK ADD  CONSTRAINT [FK_wastesXcollections_wastes] FOREIGN KEY([wasteId])
REFERENCES [dbo].[wastes] ([wasteId])
GO
ALTER TABLE [dbo].[wastesXcollections] CHECK CONSTRAINT [FK_wastesXcollections_wastes]
GO
ALTER TABLE [dbo].[wasteTypesXcertification]  WITH CHECK ADD  CONSTRAINT [FK_wasteTypesXcertification_certifications] FOREIGN KEY([certificationId])
REFERENCES [dbo].[certifications] ([certificationId])
GO
ALTER TABLE [dbo].[wasteTypesXcertification] CHECK CONSTRAINT [FK_wasteTypesXcertification_certifications]
GO
ALTER TABLE [dbo].[wasteTypesXcertification]  WITH CHECK ADD  CONSTRAINT [FK_wasteTypesXcertification_wasteTypes] FOREIGN KEY([wasteTypeId])
REFERENCES [dbo].[wasteTypes] ([wasteTypeId])
GO
ALTER TABLE [dbo].[wasteTypesXcertification] CHECK CONSTRAINT [FK_wasteTypesXcertification_wasteTypes]
GO
ALTER TABLE [dbo].[wasteTypesXprocess]  WITH CHECK ADD  CONSTRAINT [FK_wasteTypesXprocess_processes] FOREIGN KEY([processId])
REFERENCES [dbo].[processes] ([processId])
GO
ALTER TABLE [dbo].[wasteTypesXprocess] CHECK CONSTRAINT [FK_wasteTypesXprocess_processes]
GO
ALTER TABLE [dbo].[wasteTypesXprocess]  WITH CHECK ADD  CONSTRAINT [FK_wasteTypesXprocess_wasteTypes] FOREIGN KEY([wasteTypeId])
REFERENCES [dbo].[wasteTypes] ([wasteTypeId])
GO
ALTER TABLE [dbo].[wasteTypesXprocess] CHECK CONSTRAINT [FK_wasteTypesXprocess_wasteTypes]
GO
ALTER TABLE [dbo].[wasteTypeXcontainerType]  WITH CHECK ADD  CONSTRAINT [FK_wasteTypeXcontainerType_containerTypes] FOREIGN KEY([containerTypeId])
REFERENCES [dbo].[containerTypes] ([containerTypeId])
GO
ALTER TABLE [dbo].[wasteTypeXcontainerType] CHECK CONSTRAINT [FK_wasteTypeXcontainerType_containerTypes]
GO
ALTER TABLE [dbo].[wasteTypeXcontainerType]  WITH CHECK ADD  CONSTRAINT [FK_wasteTypeXcontainerType_wasteTypes] FOREIGN KEY([wasteTypeId])
REFERENCES [dbo].[wasteTypes] ([wasteTypeId])
GO
ALTER TABLE [dbo].[wasteTypeXcontainerType] CHECK CONSTRAINT [FK_wasteTypeXcontainerType_wasteTypes]
GO
USE [master]
GO
ALTER DATABASE [caso3] SET  READ_WRITE 
GO
