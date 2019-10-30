use test;
DROP TABLE IF EXISTS Assignments;
CREATE TABLE Assignments (
    autoID SMALLINT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
    symbol VARCHAR(16) NOT NULL,
    analyst VARCHAR(16),
    priority TINYINT(4),
    dateAssigned DATE,
    PRIMARY KEY (autoID)
)  ENGINE MYISAM;
truncate table Assignments;

DROP TABLE IF EXISTS Reports;
CREATE TABLE Reports (
    autoID SMALLINT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
    symbol VARCHAR(16) NOT NULL,
    author VARCHAR(16),
    analysisDate DATE,
    docFile VARCHAR(30),
    excelFile VARCHAR(30),
    notes VARCHAR(120),
    notesL VARCHAR(240),
    PRIMARY KEY (autoID)
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
    symbol,analyst,@priority,@dateAssigned
)
SET 
	-- @Date_Assigned<'2010-01-01' is a trick to avoid 0000-00-00. Find the reason and fix it.
  dateAssigned = if(@dateAssigned='' or @dateAssigned<'2010-01-01' ,NULL,STR_TO_DATE(@dateAssigned, '%Y/%m/%d')),
  priority = IF(@priority = '', NULL, @priority);
  
LOAD DATA LOCAL INFILE
'D:\\Dropbox\\ELLE Prog 2015\\Analyster GUI\\Original upload files\\Assignment Log 2015 Spring Reports 17Z.csv'
INTO TABLE Reports
FIELDS OPTIONALLY ENCLOSED BY '"' 
TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    symbol,@author,@analysisDate,docFile,excelFile,notes,notesL
)
SET 

  author = IF(@author = '', NULL, @author),
  analysisDate = if(@analysisDate='',NULL,STR_TO_DATE(@analysisDate, '%Y/%m/%d'));
