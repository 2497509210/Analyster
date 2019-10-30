use mydb;
DROP TABLE IF EXISTS Assignment;
CREATE TABLE Assignment (
    inputLine SMALLINT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
    Symbol VARCHAR(16) NOT NULL,
    current_coverage VARCHAR(16),
    Priority TINYINT(4),
    Date_Assigned DATE,
    Author VARCHAR(16),
    Analysis_Date DATE,
    docFile VARCHAR(30),
    excelFile VARCHAR(30),
    Notes VARCHAR(120),
    NotesL VARCHAR(240),
    PRIMARY KEY (inputLine , Symbol)
)  ENGINE MYISAM;
truncate table Assignment;

LOAD DATA LOCAL INFILE
'D:\\Dropbox\\ELLE Prog 2015\\Analyster GUI\\Original upload files\\Assignment Log 2015 Spring 14L.csv'
INTO TABLE Assignment
FIELDS OPTIONALLY ENCLOSED BY '"' 
TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    Symbol,current_coverage,@priority,@Date_Assigned,@Author,@Analysis_Date,docFile,excelFile,Notes,NotesL
)
SET 

  Date_Assigned = STR_TO_DATE(if(@Date_Assigned='',NULL,@Date_Assigned), '%m/%d/%Y'),
  priority = IF(@priority = '', '', @priority),
  Author = IF(@Author = '', NULL, @Author),
  Analysis_Date = STR_TO_DATE(if(@Analysis_Date='',NULL,@Analysis_Date), '%m/%d/%Y');


