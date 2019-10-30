
DROP TABLE IF EXISTS Assignments;
CREATE TABLE Assignments (
    ID SMALLINT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
    symbol VARCHAR(16) NOT NULL,
    analyst VARCHAR(16),
    priority TINYINT(4),
    dateAssigned DATE,
    PRIMARY KEY (ID)
)  ENGINE MYISAM;
truncate table Assignments;

DROP TABLE IF EXISTS Reports;
CREATE TABLE Reports (
    ID SMALLINT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
    symbol VARCHAR(16) NOT NULL,
    author VARCHAR(16),
    analysisDate DATE,
    document VARCHAR(30),
    notes VARCHAR(120),
    notesL VARCHAR(240),
    PRIMARY KEY (ID)
)  ENGINE MYISAM;
truncate table Reports;

LOAD DATA LOCAL INFILE
 '~/Dropbox/ELLE/ELLE_PROGRAMMING/ELLE_Prog_2015/analyster/Original\ upload\ files/Assignments\ 20L.csv'
INTO TABLE Assignments
FIELDS OPTIONALLY ENCLOSED BY '"' 
TERMINATED BY ','
LINES TERMINATED BY '\r'
IGNORE 1 LINES
(
    symbol,analyst,@priority,@dateAssigned
)
SET 
	-- @Date_Assigned<'2010-01-01' is a trick to avoid 0000-00-00. Find the reason and fix it.
  dateAssigned = if(@dateAssigned='' or @dateAssigned<'2010-01-01' ,NULL,STR_TO_DATE(@dateAssigned, '%m/%d/%Y')),
  priority = IF(@priority = '', NULL, @priority);

select * from Assignments;
  
LOAD DATA LOCAL INFILE
'~/Dropbox/ELLE/ELLE_PROGRAMMING/ELLE_Prog_2015/analyster/Original\ upload\ files/Reports\ 20L.csv'
INTO TABLE Reports
FIELDS OPTIONALLY ENCLOSED BY '"' 
TERMINATED BY ','
LINES TERMINATED BY '\r'  /* This should change if you are using  unix for \n  dos for \r\n  mac for \r*/
IGNORE 1 LINES
(
    symbol,@author,@analysisDate,document,notes,notesL
)
SET 

  author = IF(@author = '', NULL, @author),
  analysisDate = if(@analysisDate='',NULL,STR_TO_DATE(@analysisDate, '%m/%d/%Y'));

select * from Reports;