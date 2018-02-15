DROP DATABASE IF EXISTs Accident;
CREATE SCHEMA Accident;
USE Accident;


CREATE TABLE YearTable
(
RecordedYear year(4) not null unique,
PRIMARY KEY(RecordedYear)
);

CREATE TABLE TotalLicensesTable
(
TotalLicenseID varchar(10) unique not null,
RecordedYear year(4) unique not null,
LorrySum bigint(20) not null,
TaxiSum bigint(20) not null,
BusSum bigint(20) not null,
PRIMARY KEY(TotalLicenseID),
FOREIGN KEY(RecordedYear) REFERENCES YearTable(RecordedYear)
);

CREATE TABLE VehicleCrashesTable
(
RecordedYear year(4) not null unique,
Bicycle bigint(20) not null,
Taxi bigint(20) not null,
FourWD bigint(20) not null,
Lorry bigint(20) not null,
Bus bigint(20) not null,
Van bigint(20) not null,
MotorCar bigint(20) not null,
MotorCycle bigint(20) not null,
FOREIGN KEY (RecordedYear) REFERENCES YearTable(RecordedYear)
);

CREATE TABLE LorryLicenseTable
(
TotalLicenseID varchar(10) unique not null,
ClassA bigint(20),
ClassC bigint(20),
FOREIGN KEY(TotalLicenseID) REFERENCES TotalLicensesTable(TotalLicenseID)
);

CREATE TABLE TaxiLicenseTable
(
TotalLicenseID varchar(10) unique not null,
Hire bigint(20),
HireAndDrive bigint(20),
Taxi bigint(20),
Airport bigint(20),
Limousine bigint(20),
FOREIGN KEY(TotalLicenseID) REFERENCES TotalLicensesTable(TotalLicenseID)
);

CREATE TABLE BusLicenseTable
(
TotalLicenseID varchar(10) unique not null,
Employees bigint(20),
Chartered bigint(20),
Feeder bigint(20),
School bigint(20),
Stage bigint(20),
Express bigint(20),
Mini bigint(20),
FOREIGN KEY(TotalLicenseID) REFERENCES TotalLicensesTable(TotalLicenseID)
);

CREATE TABLE CasualtiesTable
(
RecordedYear year(4) not null unique,
Deaths bigint(20) not null,
Serious bigint(20) not null,
Minor bigint(20) not null,
FOREIGN KEY(RecordedYear) REFERENCES YearTable(RecordedYear)
);

CREATE TABLE RegionTable
(
Region varchar(20) not null unique,
PRIMARY KEY (Region)
);

CREATE TABLE StateTable
(
State varchar(20) not null unique,
Region varchar(20) not null,
PRIMARY KEY(State),
FOREIGN KEY(Region) REFERENCES RegionTable(Region)
);

CREATE TABLE AccidentsTable
(
RecordedYear year(4) not null,
State varchar(20) not null,
AccidentsNum bigint(20) not null,
DeathsRecorded bigint(20) not null,
FOREIGN KEY(RecordedYear) REFERENCES YearTable(RecordedYear),
FOREIGN KEY(State) REFERENCES StateTable(State)
);

CREATE TABLE StationTable
(
StationID varchar(20) unique not null,
State varchar(20) not null,
KM double(14,1) not null,
Location varchar(20) not null,
PRIMARY KEY (StationID),
FOREIGN KEY(State) REFERENCES StateTable(State)
);

CREATE TABLE VehicleDistributionTable
(
StationID varchar(20) not null,
RecordedYear year(4) not null ,
TrafficFor16Hrs bigint(20) not null,
CarOrTaxi double(20,1) not null,
LightLorry double(20,1) not null,
MediumLorry double(20,1) not null,
HeavyLorry double(20,1) not null,
Bus double(20,1) not null, 
Motorcycle double(20,1) not null,
FOREIGN KEY(StationID) REFERENCES StationTable(StationID),
FOREIGN KEY(RecordedYear) REFERENCES YearTable(RecordedYear)
);

CREATE TABLE ADTRecordTable
(
RecordedYear year(4) not null,
StationID varchar(20) not null,
AvDailyTraffic bigint(20) not null,
FOREIGN KEY(RecordedYear) REFERENCES YearTable(RecordedYear),
FOREIGN KEY(StationID) REFERENCES StationTable(StationID)
);

INSERT INTO YearTable(RecordedYear)
VALUES (2006);

INSERT INTO YearTable(RecordedYear)
VALUES (2007);

INSERT INTO YearTable(RecordedYear)
VALUES (2008);

INSERT INTO YearTable(RecordedYear)
VALUES (2009);

INSERT INTO YearTable(RecordedYear)
VALUES (2010);

INSERT INTO YearTable(RecordedYear)
VALUES (2011);

INSERT INTO YearTable(RecordedYear)
VALUES (2012);

INSERT INTO YearTable(RecordedYear)
VALUES (2013);

INSERT INTO YearTable(RecordedYear)
VALUES (2014);

INSERT INTO YearTable(RecordedYear)
VALUES (2015);



INSERT INTO TotalLicensesTable(TotalLicenseID, RecordedYear, LorrySum, TaxiSum, BusSum)
VALUES("0000", 2006, 4429, 2374, 867);

INSERT INTO TotalLicensesTable(TotalLicenseID, RecordedYear, LorrySum, TaxiSum, BusSum)
VALUES("0001", 2007, 14238, 18992, 2133);

INSERT INTO TotalLicensesTable(TotalLicenseID, RecordedYear, LorrySum, TaxiSum, BusSum)
VALUES("0002", 2008, 16974, 23318, 3448);

INSERT INTO TotalLicensesTable(TotalLicenseID, RecordedYear, LorrySum, TaxiSum, BusSum)
VALUES("0003", 2009, 18616, 28742, 2526);

INSERT INTO TotalLicensesTable(TotalLicenseID, RecordedYear, LorrySum, TaxiSum, BusSum)
VALUES("0004", 2010, 18732, 7944, 2410);

INSERT INTO TotalLicensesTable(TotalLicenseID, RecordedYear, LorrySum, TaxiSum, BusSum)
VALUES("0005", 2011, 16914, 7560, 2531);

INSERT INTO TotalLicensesTable(TotalLicenseID, RecordedYear, LorrySum, TaxiSum, BusSum)
VALUES("0006", 2012, 15349, 5506, 1645);

INSERT INTO TotalLicensesTable(TotalLicenseID, RecordedYear, LorrySum, TaxiSum, BusSum)
VALUES("0007", 2013, 16586, 1970, 2097);

INSERT INTO TotalLicensesTable(TotalLicenseID, RecordedYear, LorrySum, TaxiSum, BusSum)
VALUES("0008", 2014, 16881, 1929, 1642);

INSERT INTO TotalLicensesTable(TotalLicenseID, RecordedYear, LorrySum, TaxiSum, BusSum)
VALUES("0009", 2015, 15496, 2051, 994);



INSERT INTO LorryLicenseTable(TotalLicenseID, ClassA, ClassC)
VALUES ("0000" ,3875, 554);

INSERT INTO LorryLicenseTable(TotalLicenseID, ClassA, ClassC)
VALUES("0001", 12492, 1746);

INSERT INTO LorryLicenseTable(TotalLicenseID, ClassA, ClassC)
VALUES("0002", 14913, 2061);

INSERT INTO LorryLicenseTable(TotalLicenseID, ClassA, ClassC)
VALUES("0003", 16152, 2464);

INSERT INTO LorryLicenseTable(TotalLicenseID, ClassA, ClassC)
VALUES("0004", 16118, 2614);

INSERT INTO LorryLicenseTable(TotalLicenseID, ClassA, ClassC)
VALUES("0005", 14664, 2250);

INSERT INTO LorryLicenseTable(TotalLicenseID, ClassA, ClassC)
VALUES("0006", 12992, 2357);

INSERT INTO LorryLicenseTable(TotalLicenseID, ClassA, ClassC)
VALUES("0007", 13599, 2987);

INSERT INTO LorryLicenseTable(TotalLicenseID, ClassA, ClassC)
VALUES("0008", 13914, 2967);

INSERT INTO LorryLicenseTable(TotalLicenseID, ClassA, ClassC)
VALUES("0009", 12584, 2912);



INSERT INTO TaxiLicenseTable(TotalLicenseID, Hire, HireAndDrive, Taxi, Airport, Limousine)
VALUES("0000", 43, 1709, 237, 360, 25);

INSERT INTO TaxiLicenseTable(TotalLicenseID, Hire, HireAndDrive, Taxi, Airport, Limousine)
VALUES("0001", 257, 1155, 689, 228, 292);

INSERT INTO TaxiLicenseTable(TotalLicenseID, Hire, HireAndDrive, Taxi, Airport, Limousine)
VALUES("0002", 255, 1388, 624, 498, 131);

INSERT INTO TaxiLicenseTable(TotalLicenseID, Hire, HireAndDrive, Taxi, Airport, Limousine)
VALUES("0003", 1221, 3139, 2945, 198, 97);

INSERT INTO TaxiLicenseTable(TotalLicenseID, Hire, HireAndDrive, Taxi, Airport, Limousine)
VALUES("0004", 1075, 1680, 4993, 136, 60);

INSERT INTO TaxiLicenseTable(TotalLicenseID, Hire, HireAndDrive, Taxi, Airport, Limousine)
VALUES("0005", 127, 1545, 945, 68, 4965);

INSERT INTO TaxiLicenseTable(TotalLicenseID, Hire, HireAndDrive, Taxi, Airport, Limousine)
VALUES("0006", 228, 2635, 2486, 9, 148);

INSERT INTO TaxiLicenseTable(TotalLicenseID, Hire, HireAndDrive, Taxi, Airport, Limousine)
VALUES("0007", 76, 603, 1233, 10, 48);

INSERT INTO TaxiLicenseTable(TotalLicenseID, Hire, HireAndDrive, Taxi, Airport, Limousine)
VALUES("0008", 36, 333, 1209, 5, 59);

INSERT INTO TaxiLicenseTable(TotalLicenseID, Hire, HireAndDrive, Taxi, Airport, Limousine)
VALUES("0009", 38, 194, 605, 29, 78);



INSERT INTO BusLicenseTable(TotalLicenseID, Employees, Chartered, Feeder, School, Stage, Express, Mini)
VALUES("0000", 361, 60, null, 128, 14, 5, 299);

INSERT INTO BusLicenseTable(TotalLicenseID, Employees, Chartered, Feeder, School, Stage, Express, Mini)
VALUES("0001", 540, 356, 11, 361, null, 19, 299);

INSERT INTO BusLicenseTable(TotalLicenseID, Employees, Chartered, Feeder, School, Stage, Express, Mini)
VALUES("0002", 513, 389, 12, 675, 58, 378, 1423);

INSERT INTO BusLicenseTable(TotalLicenseID, Employees, Chartered, Feeder, School, Stage, Express, Mini)
VALUES("0003", 385, 328, 121, 255, 127, 181, 1129);

INSERT INTO BusLicenseTable(TotalLicenseID, Employees, Chartered, Feeder, School, Stage, Express, Mini)
VALUES("0004", 259, 332, 18, 429, 66, 232, 1074);

INSERT INTO BusLicenseTable(TotalLicenseID, Employees, Chartered, Feeder, School, Stage, Express, Mini)
VALUES("0005", 636, 142, 211, 12, 591, 12, 927);

INSERT INTO BusLicenseTable(TotalLicenseID, Employees, Chartered, Feeder, School, Stage, Express, Mini)
VALUES("0006", 93, 161, 39, 431, 2, 66, 853);

INSERT INTO BusLicenseTable(TotalLicenseID, Employees, Chartered, Feeder, School, Stage, Express, Mini)
VALUES("0007", 330, 181, 24, 603, 7, 28, 924);

INSERT INTO BusLicenseTable(TotalLicenseID, Employees, Chartered, Feeder, School, Stage, Express, Mini)
VALUES("0008", 250, 176, 14, 515, 6, 9, 959);

INSERT INTO BusLicenseTable(TotalLicenseID, Employees, Chartered, Feeder, School, Stage, Express, Mini)
VALUES("0009", 487, 140, 19, 506, 6, 12, 881);



INSERT INTO CasualtiesTable(RecordedYear,Deaths, Serious, Minor)
VALUES(2006, 6287, 9253, 19885);

INSERT INTO CasualtiesTable(RecordedYear,Deaths, Serious, Minor)
VALUES(2007, 6282, 9273, 18444);

INSERT INTO CasualtiesTable(RecordedYear,Deaths, Serious, Minor)
VALUES(2008, 6527, 8868, 16879);

INSERT INTO CasualtiesTable(RecordedYear,Deaths, Serious, Minor)
VALUES(2009, 6745, 8849, 15823);

INSERT INTO CasualtiesTable(RecordedYear,Deaths, Serious, Minor)
VALUES(2010, 6872, 7781, 13616);

INSERT INTO CasualtiesTable(RecordedYear,Deaths, Serious, Minor)
VALUES(2011, 6877, 6328, 12365);

INSERT INTO CasualtiesTable(RecordedYear,Deaths, Serious, Minor)
VALUES(2012, 6917, 5868, 11654);

INSERT INTO CasualtiesTable(RecordedYear,Deaths, Serious, Minor)
VALUES(2013, 6915, 4597, 8388);

INSERT INTO CasualtiesTable(RecordedYear,Deaths, Serious, Minor)
VALUES(2014, 6674, 4432, 8598);

INSERT INTO CasualtiesTable(RecordedYear,Deaths, Serious, Minor)
VALUES(2015, 6706, 4120, 7432);



INSERT INTO RegionTable(Region)
VALUES("Peninsular Malaysia");

INSERT INTO RegionTable(Region)
VALUES("Borneo Malaysia");

INSERT INTO StateTable(State, Region)
VALUES("Perlis", "Peninsular Malaysia");

INSERT INTO StateTable(State, Region)
VALUES("Kedah", "Peninsular Malaysia");

INSERT INTO StateTable(State, Region)
VALUES("Pulau Penang", "Peninsular Malaysia");

INSERT INTO StateTable(State, Region)
VALUES("Perak", "Peninsular Malaysia");

INSERT INTO StateTable(State, Region)
VALUES("Selangor", "Peninsular Malaysia");

INSERT INTO StateTable(State, Region)
VALUES("W.P. KUALA LUMPUR", "Peninsular Malaysia");

INSERT INTO StateTable(State, Region)
VALUES("Negeri Sembilan", "Peninsular Malaysia");

INSERT INTO StateTable(State, Region)
VALUES("Melaka", "Peninsular Malaysia");

INSERT INTO StateTable(State, Region)
VALUES("Johor", "Peninsular Malaysia");

INSERT INTO STATETABLE(State, Region)
VALUES("Pahang", "Peninsular Malaysia");

INSERT INTO StateTable(State, Region)
VALUES("Kelantan", "Peninsular Malaysia");

INSERT INTO StateTable(State, Region)
VALUES("Terengganu", "Peninsular Malaysia");

INSERT INTO StateTable(State, Region)
VALUES("Sabah", "Borneo Malaysia");

INSERT INTO StateTable(State, Region)
VALUES("Sarawak", "Borneo Malaysia");



INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2006, "Perlis", 1160, 63);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2007, "Perlis", 1364, 41);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2008, "Perlis", 1417, 69);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2009, "Perlis", 1633, 90);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2010, "Perlis", 1548, 66);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2011, "Perlis", 11791, 79);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2012, "Perlis", 1881, 71);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2013, "Perlis", 1895, 72);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2014, "Perlis", 1888, 61);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2015, "Perlis", 1861, 65);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2006, "Kedah", 15505, 494);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2007, "Kedah", 16172, 492);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2008, "Kedah", 16520, 496);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2009, "Kedah", 17701, 550);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2010, "Kedah", 17966, 532);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2011, "Kedah", 19699, 515);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2012, "Kedah", 19935, 548);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2013, "Kedah", 20228, 517);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2014, "Kedah", 20159, 525);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2015, "Kedah", 22016, 530);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2006, "Pulau Penang", 32573, 381);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2007, "Pulau Penang", 33881, 376);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2008, "Pulau Penang", 34049, 354);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2009, "Pulau Penang", 33719, 395);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2010, "Pulau Penang", 34306, 370);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2011, "Pulau Penang", 37158, 392);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2012, "Pulau Penang", 37851, 400);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2013, "Pulau Penang", 39361, 381);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2014, "Pulau Penang", 38747, 378);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2015, "Pulau Penang", 39885, 360);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2006, "Perak", 27432, 726);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2007, "Perak", 29203, 811);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2008, "Perak", 30539, 829);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2009, "Perak", 32327, 829);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2010, "Perak", 32072, 820);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2011, "Perak", 33506, 811);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2012, "Perak", 34714, 753);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2013, "Perak", 35408, 770);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2014, "Perak", 35131, 750);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2015, "Perak", 36736, 726);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2006, "Selangor", 92632, 1050);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2007, "Selangor", 99157, 1025);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2008, "Selangor", 100380, 1083);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2009, "Selangor", 107429, 976);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2010, "Selangor", 115565, 1061);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2011, "Selangor", 128876, 1070);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2012, "Selangor", 129106, 1102);

INSERT INTO AccidentsTable( RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2013, "Selangor", 135024, 1019);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2014, "Selangor", 137809, 1068);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2015, "Selangor", 140957, 1028);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2006, "W.P. KUALA LUMPUR", 46254, 255);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2007, "W.P. KUALA LUMPUR", 49454, 234);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2008, "W.P. KUALA LUMPUR", 48671, 237);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2009, "W.P. KUALA LUMPUR", 51942, 230);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2010, "W.P. KUALA LUMPUR", 53493, 233);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2011, "W.P. KUALA LUMPUR", 58795, 236);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2012, "W.P. KUALA LUMPUR", 61872, 249);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2013, "W.P. KUALA LUMPUR", 64527, 243);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2014, "W.P. KUALA LUMPUR", 63535, 238);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2015, "W.P. KUALA LUMPUR", 64664, 256);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2006, "Negeri Sembilan", 15197, 337);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2007, "Negeri Sembilan", 16079, 320);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2008, "Negeri Sembilan", 17362, 389);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2009, "Negeri Sembilan", 18369, 377);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2010, "Negeri Sembilan", 19407, 399);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2011, "Negeri Sembilan", 21157, 374);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2012, "Negeri Sembilan", 22146, 352);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2013, "Negeri Sembilan", 23066, 396);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2014, "Negeri Sembilan", 23748, 379);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2015, "Negeri Sembilan", 22939, 355);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2006, "Melaka", 10707, 232);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2007, "Melaka", 11720, 227);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2008, "Melaka", 12105, 243);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2009, "Melaka", 13275, 248);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2010, "Melaka", 14110, 235);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2011, "Melaka", 14720, 240);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2012, "Melaka", 15195, 243);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2013, "Melaka", 16083, 258);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2014, "Melaka", 16375, 236);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2015, "Melaka", 17069, 256);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2006, "Johor", 43745, 1017);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2007, "Johor", 46584, 1023);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2008, "Johor", 48667, 1065);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2009, "Johor", 51747, 1060);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2010, "Johor", 55381, 1076);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2011, "Johor", 59501, 1073);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2012, "Johor", 62316, 1073);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2013, "Johor", 64600, 1128);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2014, "Johor", 64473, 1018);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2015, "Johor", 67112, 1040);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2006, "Pahang", 13242, 256);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2007, "Pahang", 13982, 256);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2008, "Pahang", 15629, 256);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2009, "Pahang", 17068, 256);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2010, "Pahang", 17315, 256);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2011, "Pahang", 19001, 256);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2012, "Pahang", 20554, 256);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2013, "Pahang", 20130, 256);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2014, "Pahang", 19071, 256);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2015, "Pahang", 19635, 256);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2006, "Kelantan", 7337, 331);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2007, "Kelantan", 8116, 374);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2008, "Kelantan", 8842, 380);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2009, "Kelantan", 9549, 453);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2010, "Kelantan", 9707, 380);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2011, "Kelantan", 9603, 392);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2012, "Kelantan", 9968, 392);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2013, "Kelantan", 9748, 378);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2014, "Kelantan", 10326, 354);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2015, "Kelantan", 9960, 426);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2006, "Terengganu", 7098, 307);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2007, "Terengganu", 8155, 290);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2008, "Terengganu", 8814, 293);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2009, "Terengganu", 10118, 348);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2010, "Terengganu", 10106, 314);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2011, "Terengganu", 10684, 292);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2012, "Terengganu", 10861, 301);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2013, "Terengganu", 10996, 320);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2014, "Terengganu", 9383, 276);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2015, "Terengganu", 10381, 307);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2006, "Sabah", 13500, 296);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2007, "Sabah", 14256, 316);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2008, "Sabah", 14588, 325);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2009, "Sabah", 15798, 345);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2010, "Sabah", 16192, 447);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2011, "Sabah", 16585, 398);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2012, "Sabah", 17446, 450);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2013, "Sabah", 17438, 420);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2014, "Sabah", 17858, 420);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2015, "Sabah", 17290, 392);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2006, "Sarawak", 14808, 347);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2007, "Sarawak", 15196, 316);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2008, "Sarawak", 15488, 318);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2009, "Sarawak", 16655, 332);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2010, "Sarawak", 17253, 365);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2011, "Sarawak", 17964, 442);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2012, "Sarawak", 18578, 443);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2013, "Sarawak", 18700, 421);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2014, "Sarawak", 17693, 432);

INSERT INTO AccidentsTable (RecordedYear, State, AccidentsNum, DeathsRecorded)
VALUES (2015, "Sarawak", 19130, 433);



INSERT INTO StationTable(StationID, State, KM, Location)
VALUES("AR101", "Perak", "106.6", "Ipoh");

INSERT INTO StationTable(StationID, State, KM, Location)
VALUES("BR101", "Selangor", "48.3", "Klang");

INSERT INTO StationTable(StationID, State, KM, Location)
VALUES("CR101", "Pahang", "58.6", "Kuantan");

INSERT INTO StationTable(StationID, State, KM, Location)
VALUES("DR101", "Kelantan", "61.5", "Kota Bharu");

INSERT INTO StationTable(StationID, State, KM, Location)
VALUES("ER101", "Johor", "199.5", "Johor Bahru");

INSERT INTO StationTable(StationID, State, KM, Location)
VALUES("FR101", "Kedah", "70.8", "Alor Setar");

INSERT INTO StationTable(StationID, State, KM, Location)
VALUES("GR101", "Melaka", "43.5", "Melaka");

INSERT INTO StationTable(StationID, State, KM, Location)
VALUES("HR101", "Negeri Sembilan", "42.7", "Seremban");

INSERT INTO StationTable(StationID, State, KM, Location)
VALUES("IR101", "Pulau Penang", "57.2", "Georgetown");

INSERT INTO StationTable(StationID, State, KM, Location)
VALUES("JR101", "Perlis", "3.2", "Kangar");

INSERT INTO StationTable(StationID, State, KM, Location)
VALUES("KR101", "Terengganu", "78.9", "Kuantan");

INSERT INTO StationTable(StationID, State, KM, Location)
VALUES("LR101", "W.P. KUALA LUMPUR", "12.1", "Kuala Lumput");

INSERT INTO StationTable(StationID, State, KM, Location)
VALUES("MR101", "Sabah", "82.0", "Kota Kinabalu");

INSERT INTO StationTable(StationID, State, KM, Location)
VALUES("NR101", "Sarawak", "27.4", "Kuching");



INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "AR101", 13555);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2007, "AR101", 15028);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2008, "AR101", 13854);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2009, "AR101", 15038);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2010, "AR101", 15322);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2011, "AR101",14039);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2012, "AR101",14431);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2013, "AR101",15328);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2014, "AR101",16501);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2015, "AR101",16736);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "BR101", 31152);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2007, "BR101", 42452);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2008, "BR101", 47817);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2009, "BR101", 46690);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2010, "BR101", 52901);

INSERT INTO ADTRecordTable(RecordedYear,StationID, AvDailyTraffic)
VALUES(2011, "BR101", 53983);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2012, "BR101", 57835);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2013, "BR101", 56513);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2014, "BR101", 52563);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2015, "BR101", 49706);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "CR101", 19707);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2007, "CR101", 21061);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2008, "CR101", 20703);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2009, "CR101", 22224);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2010, "CR101", 28109);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2011, "CR101", 27653);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2012, "CR101", 28470);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2013, "CR101", 26509);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2014, "CR101", 28300);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2015, "CR101", 30536);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "DR101", 22900);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2007, "DR101", 35931);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2008, "DR101", 30698);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2009, "DR101", 43222);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2010, "DR101", 31602);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2011, "DR101", 37939);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2012, "DR101", 42433);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2013, "DR101", 32263);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2014, "DR101", 26043);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2015, "DR101", 39257);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "ER101", 11086);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2007, "ER101", 11727);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2008, "ER101", 10736);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2009, "ER101", 12735);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2010, "ER101", 11162);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2011, "ER101", 11711);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2012, "ER101", 14847);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2013, "ER101", 18659);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2014, "ER101", 15491);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2015, "ER101", 13321);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "FR101", 37853);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2007, "FR101", 37093);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2008, "FR101", 51314);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2009, "FR101", 34715);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2010, "FR101", 30402);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2011, "FR101", 39257);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2012, "FR101", 32311);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2013, "FR101", 42822);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2014, "FR101", 47474);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2015, "FR101", 34003);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "GR101", 36660);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "GR101", 19090);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2007, "GR101", 14057);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2008, "GR101", 15501);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2009, "GR101", 15679);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2010, "GR101", 16426);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2011, "GR101", 17044);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2012, "GR101", 16779);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2013, "GR101", 17112);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2014, "GR101", 17182);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2015,"GR101", 36660);


INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "HR101", 47909);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2007, "HR101", 58328);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2008, "HR101", 68327);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2009, "HR101", 67092);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2010, "HR101", 65580);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2011, "HR101", 46201);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2012, "HR101",  54394);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2013, "HR101", 59864);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2014, "HR101", 62112);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2015, "HR101", 57613);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "IR101", 50151);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2007, "IR101", 47787);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2008, "IR101", 53451);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2009, "IR101", 56601);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2010, "IR101", 56349);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2011, "IR101", 60230);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2012, "IR101", 56932);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2013, "IR101", 64993);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2014, "IR101", 48588);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2015, "IR101", 65716);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "JR101", 19859);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "JR101", 21018);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "JR101", 20769);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "JR101", 21321);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "JR101", 21758);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "JR101", 23234);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "JR101", 25577);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "JR101", 26155);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "JR101", 25092);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "JR101", 27257);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "KR101", 19007);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2007, "KR101", 18384);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2008, "KR101", 23357);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2009, "KR101", 21313);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2010, "KR101", 24196);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2011, "KR101", 25551);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2012, "KR101", 27325);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2013, "KR101", 27066);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2014, "KR101", 19490);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2015, "KR101", 23584);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "LR101", 150874);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2007, "LR101", 157784);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2008, "LR101", 161161);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2009, "LR101", 214746);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2010, "LR101", 277797);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2011, "LR101", 276092);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2012, "LR101", 252341);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2013, "LR101", 253179);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2014, "LR101", 214760);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2015, "LR101", 211188);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "MR101", 7024);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2007, "MR101", 10773);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2008, "MR101", 7454);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2009, "MR101", 4811);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2010, "MR101", 4924);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2011, "MR101", 5965);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2012, "MR101", 5422);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2013, "MR101", 5694);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2014, "MR101", 6508);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2015, "MR101", 6710);

INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2006, "NR101", 2457);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2007, "NR101", 2779);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2008, "NR101", 3188);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2009, "NR101", 3143);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2010, "NR101", 3091);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2011, "NR101", 3504);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2012, "NR101", 5780);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2013, "NR101", 3512);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2014, "NR101", 3582);
INSERT INTO ADTRecordTable(RecordedYear, StationID, AvDailyTraffic)
VALUES(2015, "NR101", 4090);



INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("CR101", 2015, 108858, 72.9, 7.2, 4.0, 3.2, 2.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2015, 14672, 53.9, 7.2, 4.0, 3.2, 2.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2015, 108858, 59.8, 8.9, 7.4, 4.7, 0.5, 18.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2015, 108858, 65.1, 4.3, 8.1, 4.5, 1.1, 27.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("ER101", 2015, 108858, 57.0, 6.5, 6.4, 8.2, 0.5, 13.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2015, 108858, 59.5, 8.4, 8.1, 4.4, 0.7, 25.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("NR101", 2015, 108858, 54.9, 11.8, 6.5, 7.5, 1.1, 12.8);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2015, 108858, 68.1, 19.2, 8.8, 0.7, 0.5, 10.9);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2015, 108858, 54.7, 19.2, 7.5, 2.8, 0.7, 20.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("CR101", 2014, 16728, 2.9, 4.5, 2.0, 82.2, 2.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2014, 1272, 3.9, 17.2, 41.0, 7.2, 8.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2014, 12858, 54.8, 2.1, 4.4, 3.7, 9.5, 18.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2014, 108858, 67.1, 14.3, 2.1, 4.5, 1.1, 27.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("ER101", 2014, 108858, 57.0, 6.5, 6.4, 8.2, 0.5, 13.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2014, 108858, 59.5, 8.4, 8.1, 4.4, 0.7, 25.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("NR101", 2014, 108858, 54.9, 11.8, 6.5, 7.5, 1.1, 12.8);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2014, 108858, 68.1, 19.2, 8.8, 0.7, 0.5, 10.9);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2014, 108858, 54.7, 19.2, 7.5, 2.8, 0.7, 20.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("CR101", 2013, 16728, 2.9, 4.5, 2.0, 82.2, 2.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2013, 1272, 3.9, 17.2, 41.0, 7.2, 8.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2013, 12858, 54.8, 2.1, 4.4, 3.7, 9.5, 18.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2013, 108858, 67.1, 14.3, 2.1, 4.5, 1.1, 27.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("ER101", 2013, 108858, 57.0, 6.5, 6.4, 8.2, 0.5, 13.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2013, 108858, 59.5, 8.4, 8.1, 4.4, 0.7, 25.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("NR101", 2013, 108858, 54.9, 11.8, 6.5, 7.5, 1.1, 12.8);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2013, 108858, 68.1, 19.2, 8.8, 0.7, 0.5, 10.9);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2013, 108858, 54.7, 19.2, 7.5, 2.8, 0.7, 20.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("CR101", 2012, 18799, 9.9, 5.5, 2.0, 82.2, 2.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2012, 1265, 6.9, 8.2, 41.0, 7.2, 8.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2012, 12858, 54.8, 2.1, 4.4, 3.7, 9.5, 18.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2012, 108858, 67.1, 14.3, 2.1, 4.5, 1.1, 27.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("ER101", 2012, 108858, 57.0, 6.5, 6.4, 8.2, 0.5, 13.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2012, 112858, 19.5, 28.4, 18.1, 7.4, 3.7, 25.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("NR101", 2012, 137158, 54.9, 11.8, 6.5, 7.5, 1.1, 12.8);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2012, 1058228, 68.1, 19.2, 8.8, 0.7, 0.5, 10.9);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2012, 101118, 6.7, 88.2, 2.1, 7.8, 5.7, 2.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2011, 1272, 3.9, 17.2, 41.0, 7.2, 8.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2011, 12858, 54.8, 2.1, 4.4, 3.7, 9.5, 18.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2011, 108858, 67.1, 14.3, 2.1, 4.5, 1.1, 27.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("ER101", 2011, 108858, 57.0, 6.5, 6.4, 8.2, 0.5, 13.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2011, 108858, 59.5, 8.4, 8.1, 4.4, 0.7, 25.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("NR101", 2011, 108858, 54.9, 11.8, 6.5, 7.5, 1.1, 12.8);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2011, 108858, 68.1, 19.2, 8.8, 0.7, 0.5, 10.9);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2011, 108858, 54.7, 19.2, 7.5, 2.8, 0.7, 20.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("CR101", 2011, 16728, 2.9, 4.5, 2.0, 82.2, 2.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2011, 1272, 3.9, 17.2, 41.0, 7.2, 8.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("ER101", 2010, 108858, 57.0, 6.5, 6.4, 8.2, 0.5, 13.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2010, 108858, 59.5, 8.4, 8.1, 4.4, 0.7, 25.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("NR101", 2010, 108858, 54.9, 11.8, 6.5, 7.5, 1.1, 12.8);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2010, 108858, 68.1, 19.2, 8.8, 0.7, 0.5, 10.9);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2010, 108858, 54.7, 19.2, 7.5, 2.8, 0.7, 20.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("CR101", 2010, 16728, 2.9, 4.5, 2.0, 82.2, 2.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2010, 1272, 3.9, 17.2, 41.0, 7.2, 8.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2010, 12858, 54.8, 2.1, 4.4, 3.7, 9.5, 18.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2010, 108858, 67.1, 14.3, 2.1, 4.5, 1.1, 27.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("ER101", 2010, 108858, 57.0, 6.5, 6.4, 8.2, 0.5, 13.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2010, 108858, 59.5, 8.4, 8.1, 4.4, 0.7, 25.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("NR101", 2010, 108858, 54.9, 11.8, 6.5, 7.5, 1.1, 12.8);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2009, 1272, 3.9, 17.2, 41.0, 7.2, 8.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2009, 12858, 54.8, 2.1, 4.4, 3.7, 9.5, 18.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2009, 108858, 67.1, 14.3, 2.1, 4.5, 1.1, 27.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("ER101", 2009, 108858, 57.0, 6.5, 6.4, 8.2, 0.5, 13.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2009, 108858, 59.5, 8.4, 8.1, 4.4, 0.7, 25.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("NR101", 2009, 108858, 54.9, 11.8, 6.5, 7.5, 1.1, 12.8);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2009, 108858, 68.1, 19.2, 8.8, 0.7, 0.5, 10.9);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2009, 108858, 54.7, 19.2, 7.5, 2.8, 0.7, 20.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("CR101", 2009, 18799, 9.9, 5.5, 2.0, 82.2, 2.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2009, 1265, 6.9, 8.2, 41.0, 7.2, 8.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2008, 108858, 68.1, 19.2, 8.8, 0.7, 0.5, 10.9);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2008, 108858, 54.7, 19.2, 7.5, 2.8, 0.7, 20.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("CR101", 2008, 18799, 9.9, 5.5, 2.0, 82.2, 2.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2008, 1265, 6.9, 8.2, 41.0, 7.2, 8.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2008, 12858, 54.8, 2.1, 4.4, 3.7, 9.5, 18.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2008, 108858, 67.1, 14.3, 2.1, 4.5, 1.1, 27.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("ER101", 2008, 108858, 57.0, 6.5, 6.4, 8.2, 0.5, 13.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2008, 112858, 19.5, 28.4, 18.1, 7.4, 3.7, 25.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("NR101", 2008, 137158, 54.9, 11.8, 6.5, 7.5, 1.1, 12.8);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2007, 108858, 68.1, 19.2, 8.8, 0.7, 0.5, 10.9);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2007, 108858, 54.7, 19.2, 7.5, 2.8, 0.7, 20.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("CR101", 2007, 16728, 2.9, 4.5, 2.0, 82.2, 2.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2007, 1272, 3.9, 17.2, 41.0, 7.2, 8.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2007, 12858, 54.8, 2.1, 4.4, 3.7, 9.5, 18.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2007, 108858, 67.1, 14.3, 2.1, 4.5, 1.1, 27.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("ER101", 2007, 108858, 57.0, 6.5, 6.4, 8.2, 0.5, 13.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2007, 108858, 59.5, 8.4, 8.1, 4.4, 0.7, 25.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("NR101", 2007, 108858, 54.9, 11.8, 6.5, 7.5, 1.1, 12.8);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2007, 108858, 68.1, 19.2, 8.8, 0.7, 0.5, 10.9);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("CR101", 2006, 18799, 9.9, 5.5, 2.0, 82.2, 2.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2006, 1265, 6.9, 8.2, 41.0, 7.2, 8.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2006, 12858, 54.8, 2.1, 4.4, 3.7, 9.5, 18.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2006, 108858, 67.1, 14.3, 2.1, 4.5, 1.1, 27.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("ER101", 2006, 108858, 57.0, 6.5, 6.4, 8.2, 0.5, 13.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("MR101", 2006, 108858, 54.7, 19.2, 7.5, 2.8, 0.7, 20.7);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("CR101", 2006, 18799, 9.9, 5.5, 2.0, 82.2, 2.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("AR101", 2006, 1265, 6.9, 8.2, 41.0, 7.2, 8.3, 10.4);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2006, 12858, 54.8, 2.1, 4.4, 3.7, 9.5, 18.6);

INSERT INTO VehicleDistributionTable(StationID, RecordedYear, TrafficFor16Hrs, CarOrTaxi, LightLorry, MediumLorry, HeavyLorry, Bus, Motorcycle)
VALUES("DR101", 2006, 108858, 67.1, 14.3, 2.1, 4.5, 1.1, 27.6);

INSERT INTO VehicleCrashesTable(RecordedYear, Bicycle, Taxi, FourWD, Lorry, Bus, Van, Motorcar, MotorCycle)
Values(2006, 104107, 411444, 20428, 9700, 44767, 20885, 7751, 2834);

INSERT INTO VehicleCrashesTable(RecordedYear, Bicycle, Taxi, FourWD, Lorry, Bus, Van, Motorcar, MotorCycle)
Values(2007, 111765, 426941, 21109, 10285, 47696, 21823, 8809, 2690);

INSERT INTO VehicleCrashesTable(RecordedYear, Bicycle, Taxi, FourWD, Lorry, Bus, Van, Motorcar, MotorCycle)
Values(2008, 111819, 435665, 20392, 9356, 48250, 22793, 8769, 2463);

INSERT INTO VehicleCrashesTable(RecordedYear, Bicycle, Taxi, FourWD, Lorry, Bus, Van, Motorcar, MotorCycle)
Values(2009, 113962, 472307, 19220, 9380, 46724, 23581, 8669, 2486);

INSERT INTO VehicleCrashesTable(RecordedYear, Bicycle, Taxi, FourWD, Lorry, Bus, Van, Motorcar, MotorCycle)
Values(2010, 120156, 511861, 18788, 9580, 50438, 25777, 9899, 2178);

INSERT INTO VehicleCrashesTable(RecordedYear, Bicycle, Taxi, FourWD, Lorry, Bus, Van, Motorcar, MotorCycle)
Values(2011, 129017, 546702, 17916, 9986, 53078, 30828, 11197, 2033);

INSERT INTO VehicleCrashesTable(RecordedYear, Bicycle, Taxi, FourWD, Lorry, Bus, Van, Motorcar, MotorCycle)
Values(2012, 130080, 655813, 15143, 10617, 42158, 32891, 11680, 1310);

INSERT INTO VehicleCrashesTable(RecordedYear, Bicycle, Taxi, FourWD, Lorry, Bus, Van, Motorcar, MotorCycle)
Values(2013, 121700, 632602, 17148, 10123, 39276, 52512, 11651, 1370);

INSERT INTO VehicleCrashesTable(RecordedYear, Bicycle, Taxi, FourWD, Lorry, Bus, Van, Motorcar, MotorCycle)
Values(2014, 125712, 617578, 15041, 9193, 37481, 41464, 10856, 1275);

INSERT INTO VehicleCrashesTable(RecordedYear, Bicycle, Taxi, FourWD, Lorry, Bus, Van, Motorcar, MotorCycle)
Values(2015, 123408, 625758, 14565, 8804, 34942, 46163, 9591, 1119);


/*Total Road Accidents by States, 2006 – 2015*/
SELECT statetable.State, SUM(accidentstable.AccidentsNum) AS TotalRoadAccident
FROM yeartable
JOIN accidentstable
ON yeartable.RecordedYear = accidentstable.RecordedYear
JOIN statetable
ON statetable.state = accidentstable.state
WHERE yeartable.RecordedYear BETWEEN 2006 AND 2015
GROUP BY accidentstable.state;


/*Total Motor Vehicles Involved in Road Accidents by Type of Vehicles, 2006 – 2015*/
SELECT 
    SUM(v.Bicycle) AS Bicycle,
    SUM(v.Taxi) AS Taxi,
    SUM(v.FourWD) AS FourWD,
    SUM(v.Lorry) AS Lorry,
    SUM(v.Bus) AS Bus,
    SUM(v.Van) AS Van,
    SUM(v.MotorCar) AS MotorCar,
    SUM(v.MotorCycle) AS MotorCycle
FROM vehiclecrashestable v
JOIN yeartable y
ON v.RecordedYear = y.RecordedYear
WHERE v.RecordedYear BETWEEN 2006 AND 2015;


/*Number of Licenses Issued by Class of Licenses, 2006 – 2015*/
SELECT *
FROM
    (SELECT 
        y.recordedYear,
            blt.Employees,
            blt.Chartered,
            blt.Feeder,
            blt.School,
            blt.Stage,
            blt.Express,
            blt.Mini,
            tlst.BusSum,
            llt.ClassA,
            llt.ClassC,
            tlst.LorrySum,
            tlt.Hire,
            tlt.HireAndDrive,
            tlt.Taxi,
            tlt.Airport,
            tlt.Limousine,
            tlst.TaxiSum
    FROM
        yeartable y
    JOIN totallicensestable tlst ON tlst.RecordedYear = y.RecordedYear
    JOIN buslicensetable blt ON blt.TotalLicenseID = tlst.TotalLicenseID
    JOIN lorrylicensetable llt ON llt.TotalLicenseID = tlst.TotalLicenseID
JOIN taxilicensetable tlt ON tlt.TotalLicenseID = tlst.TotalLicenseID) AS unpivotedTable;


/*Total Number of Accidents by Year*/
SELECT y.RecordedYear, SUM(a.AccidentsNum) AS TotalAccidents
FROM accidentstable a
JOIN yeartable y
ON a.RecordedYear = y.RecordedYear
GROUP BY a.RecordedYear;


/*Number of Stations by States*/
SELECT statetable.State, count(stationtable.StationID) AS TotalStation
FROM stationtable
JOIN statetable
ON statetable.State = stationtable.State
GROUP BY statetable.State;

