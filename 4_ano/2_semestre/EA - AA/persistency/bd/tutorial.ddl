CREATE TABLE `User` (ID int(10) NOT NULL AUTO_INCREMENT, Name varchar(255), Emai varchar(255), Password varchar(255), PRIMARY KEY (ID));
CREATE TABLE Game (ID int(10) NOT NULL AUTO_INCREMENT, Name varchar(255), Year int(10) NOT NULL, Price double NOT NULL, Description varchar(255), PRIMARY KEY (ID));
CREATE TABLE Platform (ID int(10) NOT NULL AUTO_INCREMENT, Name varchar(255), Year int(10) NOT NULL, Description varchar(255), Manufacturer varchar(255), PRIMARY KEY (ID));
