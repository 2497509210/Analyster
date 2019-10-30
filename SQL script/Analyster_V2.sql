USE ELLE_Fundamentals;
DROP TABLE IF EXISTS Assignment;
CREATE TABLE Assignment
(
    inputLine   TINYINT(4)    unsigned not null auto_increment,                             # PK
    Symbol       VARCHAR(16)    NOT NULL,   
    current_coverage    VARCHAR(16),
    priority     TINYINT(4)  ,
    Date_Assigned         DATE  ,   
    Author   VARCHAR(16),                               
    Analysis_Date     DATE ,                                               
    docFile VARCHAR(30),
    excelFile VARCHAR(30),
    Notes   VARCHAR(120),
    NotesL VARCHAR(240),
    primary key (inputLine,Symbol)
) engine myISAM;
truncate table Assignment;


LOAD DATA LOCAL INFILE
'F:/Dropbox/ELLE Prog 2014/Analyster GUI/Assignment Log 2014 Summer upload.csv'
INTO TABLE Assignment
FIELDS OPTIONALLY ENCLOSED BY '"' TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    Symbol,@priority,@Date_Assigned,@Author,@Analysis_Date,Notes
)
SET 

		Date_Assigned = STR_TO_DATE(if(@Date_Assigned='',NULL,@Date_Assigned), '%m/%d/%Y'),
		priority = IF(@priority = '', '', @priority),
		Author = IF(@Author = '', NULL, @Author),
		Analysis_Date = STR_TO_DATE(if(@Analysis_Date='',NULL,@Analysis_Date), '%m/%d/%Y');