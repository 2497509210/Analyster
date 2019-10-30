
CREATE TABLE Analyst (
ID_analyst INT(20),
Name_analyst VARCHAR(50) NOT NULL,
PRIMARY KEY (Name_analyst));

INSERT INTO Analyst Values (2,"ERICA");
DROP TABLE Reports_test;

CREATE table Reports_test
 ( id INT (20),
 Name_analyst Varchar(50) NOT NULL,
 notes VARCHAR(50),
PRIMARY KEY(id),
 FOREIGN KEY (Name_analyst) REFERENCES Analyst (Name_analyst)
 );
 

SELECT * FROM Analyst;

INSERT INTO Reports_test VALUES (5,"PU Sun", "Hi");

