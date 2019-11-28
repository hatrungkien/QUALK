SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS `User_Role`;
DROP TABLE IF EXISTS `Role`;
DROP TABLE IF EXISTS `Role_Function`;
DROP TABLE IF EXISTS `Funtion`;
DROP TABLE IF EXISTS `Teacher_CV`;
DROP TABLE IF EXISTS `Center_Info`;
DROP TABLE IF EXISTS `Form`;
DROP TABLE IF EXISTS `Apply&Hire`;
DROP TABLE IF EXISTS `Location`;
DROP TABLE IF EXISTS `Hire`;
DROP TABLE IF EXISTS `Notify`;
DROP TABLE IF EXISTS `Center_Form`;
DROP TABLE IF EXISTS `Report`;
DROP TABLE IF EXISTS `User_Notify`;
SET FOREIGN_KEY_CHECKS = 1;

create database `QUALK`
USE QUALK

CREATE TABLE `User` (
    `ID` BIGINT NOT NULL,
    `UserName` VARCHAR(255) NOT NULL,
    `PassWord` VARCHAR(255) NOT NULL,
    `Email` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `User_Role` (
    `ID` BIGINT NOT NULL,
    `User_ID` BIGINT NOT NULL,
    `Role_ID` BIGINT NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Role` (
    `ID` BIGINT NOT NULL,
    `RoleName` VARCHAR(20) NOT NULL,
    `View` BOOLEAN NOT NULL,
    `Insert` BOOLEAN NOT NULL,
    `Modify` BOOLEAN NOT NULL,
    `Delete` BOOLEAN NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Role_Function` (
    `ID` BIGINT NOT NULL,
    `Role_ID` BIGINT NOT NULL,
    `Funtion_ID` BIGINT NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Funtion` (
    `ID` BIGINT NOT NULL,
    `FunctionName` VARCHAR(20) NOT NULL,
    `Code` TEXT NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Teacher_CV` (
    `ID` BIGINT NOT NULL,
    `Location_ID` BIGINT NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `BirthDate` DATE NOT NULL,
    `Address` TEXT NOT NULL,
    `Degree` TEXT NOT NULL,
    `Experiences` TEXT NOT NULL,
    `Contact` TEXT NOT NULL,
    `Skills` TEXT NOT NULL,
    `Available` BOOLEAN NOT NULL,
    `Salary_Want` BIGINT NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Center_Info` (
    `ID` BIGINT NOT NULL,
    `User_ID` BIGINT NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `Specialize` TEXT NOT NULL,
    `Address` TEXT NOT NULL,
    `Contact` TEXT NOT NULL,
    `Available` BOOLEAN NOT NULL,
    `Location_ID` BIGINT NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Form` (
    `ID` BIGINT NOT NULL,
    `Location_ID` BIGINT NOT NULL,
    `Title` TEXT NOT NULL,
    `Salary` BIGINT NOT NULL,
    `Date` DATE NOT NULL,
    `Content` TEXT NOT NULL,
    `Position` TEXT NOT NULL,
    `Requirement` TEXT NOT NULL,
    `Contact` TEXT NOT NULL,
    `End` DATETIME NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Apply&Hire` (
    `ID` BIGINT NOT NULL,
    `Teacher_ID` BIGINT NOT NULL,
    `Center_ID` BIGINT NOT NULL,
    `Datetime` DATETIME NOT NULL,
    `Status` VARCHAR(255) NOT NULL,
    `TeacherOrCenter` BOOLEAN NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Location` (
    `ID` BIGINT NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `ProvinceID` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Hire` (
    `ID` INTEGER NOT NULL,
    `Teacher_ID` INTEGER NOT NULL,
    `Center_ID` INTEGER NOT NULL,
    `Datetime` INTEGER NOT NULL,
    `Accept` BOOLEAN NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Notify` (
    `ID` BIGINT NOT NULL,
    `Datetime` DATETIME NOT NULL,
    `Title` VARCHAR(10) NOT NULL,
    `Text` TEXT NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Center_Form` (
    `Id` BIGINT NOT NULL,
    `Center_ID` BIGINT NOT NULL,
    `Form_ID` BIGINT NOT NULL,
    PRIMARY KEY (`Id`)
);

CREATE TABLE `Report` (
    `ID` BIGINT NOT NULL,
    `Center_ID` BIGINT NOT NULL,
    `Teacher_ID` BIGINT NOT NULL,
    `Title` TEXT NOT NULL,
    `Content` TEXT NOT NULL,
    `Datetime` DATETIME NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `User_Notify` (
    `ID` BIGINT NOT NULL,
    `User_Receive` BIGINT NOT NULL,
    `User_Send` BIGINT NOT NULL,
    PRIMARY KEY (`ID`)
);

ALTER TABLE `User_Role` ADD FOREIGN KEY (`User_ID`) REFERENCES `User`(`ID`);
ALTER TABLE `User_Role` ADD FOREIGN KEY (`Role_ID`) REFERENCES `Role`(`ID`);
ALTER TABLE `Role_Function` ADD FOREIGN KEY (`Role_ID`) REFERENCES `Role`(`ID`);
ALTER TABLE `Role_Function` ADD FOREIGN KEY (`Funtion_ID`) REFERENCES `Funtion`(`ID`);
ALTER TABLE `Teacher_CV` ADD FOREIGN KEY (`Location_ID`) REFERENCES `Location`(`ID`);
ALTER TABLE `Center_Info` ADD FOREIGN KEY (`User_ID`) REFERENCES `User`(`ID`);
ALTER TABLE `Center_Info` ADD FOREIGN KEY (`Location_ID`) REFERENCES `Location`(`ID`);
ALTER TABLE `Form` ADD FOREIGN KEY (`Location_ID`) REFERENCES `Location`(`ID`);
ALTER TABLE `Apply&Hire` ADD FOREIGN KEY (`Teacher_ID`) REFERENCES `Teacher_CV`(`ID`);
ALTER TABLE `Apply&Hire` ADD FOREIGN KEY (`Center_ID`) REFERENCES `Center_Info`(`ID`);
ALTER TABLE `Hire` ADD FOREIGN KEY (`Teacher_ID`) REFERENCES `Teacher_CV`(`ID`);
ALTER TABLE `Hire` ADD FOREIGN KEY (`Center_ID`) REFERENCES `Center_Info`(`ID`);
ALTER TABLE `Center_Form` ADD FOREIGN KEY (`Center_ID`) REFERENCES `Center_Info`(`ID`);
ALTER TABLE `Center_Form` ADD FOREIGN KEY (`Form_ID`) REFERENCES `Form`(`ID`);
ALTER TABLE `Report` ADD FOREIGN KEY (`Teacher_ID`) REFERENCES `Teacher_CV`(`ID`);
ALTER TABLE `Report` ADD FOREIGN KEY (`Center_ID`) REFERENCES `Center_Info`(`ID`);
ALTER TABLE `User_Notify` ADD FOREIGN KEY (`User_Receive`) REFERENCES `User`(`ID`);
ALTER TABLE `User_Notify` ADD FOREIGN KEY (`User_Send`) REFERENCES `User`(`ID`);