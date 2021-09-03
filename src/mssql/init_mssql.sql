Use master ;
GO
-- Set up Database
CREATE DATABASE [StagingDB]
GO

USE [StagingDB]
GO

-- Create Tables
CREATE TABLE [dbo].[Insurance](
	[Insurance_ID]  varchar(10) NOT NULL,
	[Insurance_Cover_Ammount] int NULL,
	[Insurance_type] varchar(3) NULL,
	[Insurance_expired] datetime NULL,
PRIMARY KEY CLUSTERED 
(
	[Insurance_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Patient](
	[Patient_ID] varchar(10) NOT NULL,
	[Insurance_ID] varchar(10) NULL
		CONSTRAINT [FK_Patient_Insurance]
		REFERENCES [dbo].Insurance (Insurance_ID),
	[Patient_name] varchar(50) NULL,
	[Patient_gender] varchar(6) NULL,
	[Patient_age] int NULL,
	[Patient_bloodtype] varchar(2) NULL,
	[Patient_weight_kg] int NULL,
	[History_covid] int NULL,
	[Blood_pressure_mmHG] int NULL,
	[Blood_sugar_mgdL] int NULL,
	[Patient_state] varchar(30) NULL,
	[Patient_zipZ] int NULL,
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
		CONSTRAINT [FK_Di]
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
	[Work_Phone] varchar(20),
	[Appointment_Date] date NULL,
	[Spouse_Name] varchar(50) NULL,
	[Spouse_Phone] varchar(20) NULL,
	[Spouse_Occupation] int NULL,
	[Social_Security_Last_4] int,
PRIMARY KEY CLUSTERED 
(
	[Medical_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
