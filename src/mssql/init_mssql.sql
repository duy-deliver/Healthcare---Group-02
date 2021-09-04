Use master ;
GO
-- Set up Database
CREATE DATABASE [StagingDB]
GO

USE [StagingDB]
GO

-- Create Tables
CREATE TABLE [dbo].[Location](
	[State_ID]  varchar(10) NOT NULL,
	[State_Name] varchar(50) NOT NULL,
	[Climate] varchar(100) NULL,
	[Aging_Population] int DEFAULT 0,
	[Total_Population] int NOT NULL,

PRIMARY KEY CLUSTERED 
(
	[State_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Patient](
	[Patient_ID] varchar(10) NOT NULL,
	[Patient_State_ID] varchar(10) NOT NULL
		CONSTRAINT [FK_Patient_Location]
		REFERENCES [dbo].[Location]([State_ID]),
	[Patient_name] varchar(50) NULL,
	[Patient_gender] varchar(6) NULL,
	[Patient_age] int NULL,
	[Patient_bloodtype] varchar(2) NULL,
	[Patient_weight_kg] int NULL,
	[History_covid] int NULL,
	[Blood_pressure_mmHG] int NULL,
	[Blood_sugar_mgdL] int NULL,
	[Patient_Race] varchar(50) DEFAULT 'UNKNOWN',
	[Patient_Income] int DEFAULT 20,
	[Patient_Education] varchar(50),
	[Patient_Zip] int NULL,

PRIMARY KEY CLUSTERED 
(
	[Patient_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Disease](
	[Disease_ID] varchar(10) NOT NULL,
	[Disease_name] varchar(50) NULL,
	[Blood_pressure_mmHg] varchar(10) NULL,
	[Blood_sugar_mgdL] varchar(10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Disease_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Symptom](
	[Symptom_iD] varchar(10) NOT NULL,
	[Disease_ID] varchar(10) NULL
		CONSTRAINT [FK_Symptom_Disease]
		REFERENCES [dbo].[Disease] ([Disease_ID]),
	[Symptom_name] varchar(50) NULL,
	[Symptom_stage] int DEFAULT 0,
	[Symptom_Stage_Desc] varchar(100) DEFAULT 'NONE',
PRIMARY KEY CLUSTERED 
(
	[Symptom_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[Medical](
	[Medical_ID] varchar(10) NOT NULL,
	[Patient_ID] varchar(10) NOT NULL 
		CONSTRAINT [FK_Medical_Patient]
		REFERENCES [dbo].[Patient] ([Patient_iD]),
	[Symptom_ID] varchar(10) NOT NULL
		CONSTRAINT [FK_Medical_Symptom]
		REFERENCES [dbo].[Symptom] ([Symptom_ID]),
	[Doctor_Name] varchar(50),
	[Allergy_flag]	int,
	[Work_Phone] varchar(50),
	[Appointment_Date] date NULL,
	[Spouse_Name] varchar(50) NULL,
	[Spouse_Phone] varchar(50) NULL,
	[Spouse_Occupation] int NULL,
	[Social_Security_Last_4] char(4),
	[Surgery_Status_Flag] int,
PRIMARY KEY CLUSTERED 
(
	[Medical_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

-- Create Agent Job / Schedule

-- Create Stored Procedure
