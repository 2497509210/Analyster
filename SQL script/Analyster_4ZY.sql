use test;
DROP TABLE IF EXISTS Assignments;
CREATE TABLE Assignments (
    inputLine SMALLINT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
    Symbol VARCHAR(16) NOT NULL,
    Analyst VARCHAR(16),
    Priority TINYINT(4),
    Date_Assigned DATE,
    PRIMARY KEY (inputLine , Symbol)
)  ENGINE MYISAM;
truncate table Assignments;

DROP TABLE IF EXISTS Reports;
CREATE TABLE Reports (
    Symbol VARCHAR(16) NOT NULL,
    Author VARCHAR(16),
    Analysis_Date DATE,
    docFile VARCHAR(30),
    excelFile VARCHAR(30),
    Notes VARCHAR(120),
    NotesL VARCHAR(240),
    PRIMARY KEY (Symbol)
)  ENGINE MYISAM;
truncate table Reports;

LOAD DATA LOCAL INFILE
'D:\\Dropbox\\ELLE Prog 2015\\Analyster GUI\\Original upload files\\Assignment Log 2015 Spring Assignments 17Z.csv'
INTO TABLE Assignments
FIELDS OPTIONALLY ENCLOSED BY '"' 
TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    Symbol,Analyst,@Priority,@Date_Assigned
)
SET 

  Date_Assigned = if(@Date_Assigned='',NULL,STR_TO_DATE(@Date_Assigned, '%Y/%m/%d')),
  Priority = IF(@Priority = '', NULL, @Priority);
  
LOAD DATA LOCAL INFILE
'D:\\Dropbox\\ELLE Prog 2015\\Analyster GUI\\Original upload files\\Assignment Log 2015 Spring Reports 17Z.csv'
INTO TABLE Reports
FIELDS OPTIONALLY ENCLOSED BY '"' 
TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    Symbol,@Author,@Analysis_Date,docFile,excelFile,Notes,NotesL
)
SET 

  Author = IF(@Author = '', NULL, @Author),
  Analysis_Date = if(@Analysis_Date='',NULL,STR_TO_DATE(@Analysis_Date, '%Y/%m/%d'));
