USE ELLE_Fundamentals;
DROP TABLE IF EXISTS Suggestions;
CREATE TABLE Suggestions
(
    ID   TINYINT(4)    unsigned not null auto_increment,                             # PK
    Date       DATE   NOT NULL,     
    Author   VARCHAR(16),                                                                            
    title VARCHAR(60),
    Notes   VARCHAR(120),
    primary key (ID)
) engine myISAM;
truncate table Suggestions;
