IF OBJECT_ID('IncidentFact', 'U') IS NOT NULL
DROP TABLE IncidentFact;

IF OBJECT_ID('VictimDim', 'U') IS NOT NULL
DROP TABLE VictimDim;

IF OBJECT_ID('LocationDim', 'U') IS NOT NULL
DROP TABLE LocationDim;

IF OBJECT_ID('WeaponDim', 'U') IS NOT NULL
DROP TABLE WeaponDim;

IF OBJECT_ID('CauseDim', 'U') IS NOT NULL
DROP TABLE CauseDim;

IF OBJECT_ID('PoliceDim', 'U') IS NOT NULL
DROP TABLE PoliceDim;


CREATE TABLE [VictimDim] (
    [Victim_ID] float PRIMARY KEY,
    [Victim_name] nvarchar(255),
    [Victim_age] nvarchar(255),
    [Victim_gender] nvarchar(255),
    [Victim_race] nvarchar(255),
    [Criminal_charges] nvarchar(255),
    [Symptoms_of_mental_illness] nvarchar(255)
)

CREATE TABLE [LocationDim] (
    [Location_ID] float PRIMARY KEY,
    [Street_address_of_incident] nvarchar(255),
    [City_of_incident] nvarchar(255),
    [County_of_incident] nvarchar(255),
    [State_of_incident] nvarchar(255),
    [Geography] nvarchar(255)
)

CREATE TABLE [WeaponDim] (
    [Weapon_ID] float PRIMARY KEY,
    [Description_of_weapon] nvarchar(255),
    [Weapon_name] nvarchar(255)
)

CREATE TABLE [CauseDim] (
    [Cause_ID] float PRIMARY KEY,
    [Cause_of_incident] nvarchar(255)
)

CREATE TABLE [PoliceDim] (
    [Police_ID] float PRIMARY KEY,
    [Police_department] nvarchar(255),
	[Official_disposition_of_death] nvarchar(255)
)

CREATE TABLE [IncidentFact] (
    [Incident_ID] int IDENTITY(1,1) PRIMARY KEY,  
    [Victim_ID] float FOREIGN KEY REFERENCES VictimDim(Victim_ID),
    [Location_ID] float FOREIGN KEY REFERENCES LocationDim(Location_ID),
    [Weapon_ID] float FOREIGN KEY REFERENCES WeaponDim(Weapon_ID),
    [Cause_ID] float FOREIGN KEY REFERENCES CauseDim(Cause_ID),
    [Police_ID] float FOREIGN KEY REFERENCES PoliceDim(Police_ID),
    [Date_ID] int FOREIGN KEY REFERENCES DateDim(Date_ID)
)
