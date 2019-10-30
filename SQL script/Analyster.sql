USE ELLE_Fundamentals;
DROP TABLE IF EXISTS Assignment;
CREATE TABLE Assignment
(
    inputLine   smallint unsigned not null auto_increment,                             # PK
    Symbol       VARCHAR(40)    NOT NULL,      
    priority     smallint  ,
    Date_Assigned         DATE  ,   
    Current_Intern   VARCHAR(40),                               
    Last_Analysis     DATE ,                                               
    Notes   VARCHAR(60),
    docFile VARCHAR(60),
    excelFile VARCHAR(60),
    primary key (inputLine,Symbol)
) engine myISAM;
truncate table Assignment;


LOAD DATA LOCAL INFILE
'F:/Dropbox/ELLE Prog 2014/Analyster GUI/Assignment Log 2014 Summer-upload.csv'
INTO TABLE Assignment
FIELDS OPTIONALLY ENCLOSED BY '"' TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    Symbol,@priority,@Date_Assigned,@Current_Intern,@Last_Analysis,Notes
)
SET 

		Date_Assigned = STR_TO_DATE(if(@Date_Assigned='',NULL,@Date_Assigned), '%m/%d/%Y'),
		priority = IF(@priority = '', '', @priority),
		Current_Intern = IF(@Current_Intern = '', NULL, @Current_Intern),
		Last_Analysis = STR_TO_DATE(if(@Last_Analysis='',NULL,@Last_Analysis), '%m/%d/%Y');