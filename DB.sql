CREATE TABLE
  `Students` (
    `Student_ID` int(11) NOT NULL AUTO_INCREMENT,
    `First_Name` varchar(50) NOT NULL,
    `Last_Name` varchar(50) NOT NULL,
    `Date_of_Birth` date NOT NULL,
    `Gender` enum('Male', 'Female', 'Other') NOT NULL,
    `Email` varchar(100) NOT NULL,
    `Phone` varchar(20) DEFAULT NULL,
    `Address` varchar(255) DEFAULT NULL,
    `Enrollment_Date` date NOT NULL,
    `Program` varchar(100) NOT NULL,
    `Year_of_Study` int(11) NOT NULL,
    `Status` enum('Active', 'Graduated', 'Suspended', 'Dropped') DEFAULT 'Active',
    PRIMARY KEY (`Student_ID`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci
  
insert into `Students` (`Address`, `Date_of_Birth`, `Email`, `Enrollment_Date`, `First_Name`, `Gender`, `Last_Name`, `Phone`, `Program`, `Status`, `Student_ID`, `Year_of_Study`) values ('123 Maple St, Springfield', '2002-04-15', 'alice.johnson@example.com', '2021-09-01', 'Alice', 'Female', 'Johnson', '555-1234', 'Computer Science', 'Active', 1, 3);
insert into `Students` (`Address`, `Date_of_Birth`, `Email`, `Enrollment_Date`, `First_Name`, `Gender`, `Last_Name`, `Phone`, `Program`, `Status`, `Student_ID`, `Year_of_Study`) values ('456 Oak Ave, Rivertown', '2001-11-30', 'brian.smith@example.com', '2020-09-01', 'Brian', 'Male', 'Smith', '555-5678', 'Mechanical Engineering', 'Active', 2, 4);
insert into `Students` (`Address`, `Date_of_Birth`, `Email`, `Enrollment_Date`, `First_Name`, `Gender`, `Last_Name`, `Phone`, `Program`, `Status`, `Student_ID`, `Year_of_Study`) values ('789 Pine Rd, Lakewood', '2003-07-22', 'catherine.lee@example.com', '2022-09-01', 'Catherine', 'Female', 'Lee', '555-8765', 'Business Administration', 'Active', 3, 2);
insert into `Students` (`Address`, `Date_of_Birth`, `Email`, `Enrollment_Date`, `First_Name`, `Gender`, `Last_Name`, `Phone`, `Program`, `Status`, `Student_ID`, `Year_of_Study`) values ('321 Birch Blvd, Hillcrest', '1999-02-10', 'david.martinez@example.com', '2018-09-01', 'David', 'Male', 'Martinez', '555-4321', 'Electrical Engineering', 'Graduated', 4, 5);
insert into `Students` (`Address`, `Date_of_Birth`, `Email`, `Enrollment_Date`, `First_Name`, `Gender`, `Last_Name`, `Phone`, `Program`, `Status`, `Student_ID`, `Year_of_Study`) values ('654 Cedar St, Brookfield', '2004-01-05', 'elena.kovacs@example.com', '2023-09-01', 'Elena', 'Other', 'Kovacs', '555-2468', 'Psychology', 'Active', 5, 1);