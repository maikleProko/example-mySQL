
drop table if exists Doctor_Appointment;
drop table if exists Hospital_Sheet;
drop table if exists Visiting;
drop table if exists Information_about_doctor;
drop table if exists Patient_File;
drop table if exists Section;



CREATE TABLE Section(
    Number_section INT UNSIGNED PRIMARY KEY NOT NULL
);
CREATE TABLE Patient_File(
    Number_File INT UNSIGNED PRIMARY KEY NOT NULL,
    Name_Patient VARCHAR(20) NOT NULL,
    Surname_Patient VARCHAR(20) NOT NULL,
    Middle_Name_Patient VARCHAR(20),
    Sex VARCHAR(10) NOT NULL,
    Insurance_Policy VARCHAR(100) NOT NULL,
    Age INT UNSIGNED NOT NULL,
    Address_Patient VARCHAR(100) NOT NULL,
    Date_Registration_File DATE NOT NULL,
    Destinations VARCHAR(200)
);

CREATE TABLE Information_about_doctor(
    Phone VARCHAR(20) PRIMARY KEY NOT NULL,
    Name_Doctor VARCHAR(20) NOT NULL,
    Surname_Doctor VARCHAR(20) NOT NULL,
    Middle_Name_Doctor VARCHAR(20),
    Category VARCHAR(30) NOT NULL,
    Experience_in_years INT UNSIGNED NOT NULL,
    Date_Of_Birth DATE NOT NULL
);

CREATE TABLE Visiting(
    Number_File INT UNSIGNED NOT NULL,
    FOREIGN KEY (Number_File) REFERENCES Patient_File(Number_File),
    Date_Visiting DATE NOT NULL,

    Health_Complaints VARCHAR(500),
    Preliminiary_Diagnosis VARCHAR(30) ,
    KEY (Number_File),
    KEY (Date_Visiting),
    PRIMARY KEY (Number_File, Date_Visiting)
);



CREATE TABLE Hospital_Sheet(
    Number_File INT UNSIGNED PRIMARY KEY NOT NULL,
    Date_Visiting DATE NOT NULL,
    FOREIGN KEY (Number_File) REFERENCES Visiting(Number_File),
    FOREIGN KEY (Date_Visiting) REFERENCES Visiting(Date_Visiting),

    Phone VARCHAR(20) NOT NULL,
    FOREIGN KEY (Phone) REFERENCES Information_about_doctor(Phone),

    Surname_Doctor VARCHAR(20) NOT NULL,
    Term DATE NOT NULL
);

CREATE TABLE Doctor_Appointment(
    Phone VARCHAR(20) NOT NULL,
    FOREIGN KEY (Phone) REFERENCES Information_about_doctor(Phone),

    Number_section INT UNSIGNED NOT NULL,
    FOREIGN KEY (Number_section) REFERENCES Section(Number_section),

    Time_var TIME NOT NULL,
    Number_Cabinet INT UNSIGNED NOT NULL,
    Day_var DATE NOT NULL,
    PRIMARY KEY (Time_var, Number_Cabinet, Day_var)

);


#table 0

INSERT INTO Section(Number_section)
VALUES (0);
INSERT INTO Section(Number_section)
VALUES (1);
INSERT INTO Section(Number_section)
VALUES (2);
INSERT INTO Section(Number_section)
VALUES (3);
INSERT INTO Section(Number_section)
VALUES (4);

#table 1
INSERT INTO Patient_File(Number_File, Name_Patient, Surname_Patient, Middle_Name_Patient, Sex, Insurance_Policy, Age, Address_Patient, Date_Registration_File, Destinations)
VALUES (0, 'Aziz', 'Azizov', 'Azizovich', 'Man', '0000-0000-0000-0000', 50, 'City 1, House 1', '2000-03-04', 'Dest1');
INSERT INTO Patient_File(Number_File, Name_Patient, Surname_Patient, Middle_Name_Patient, Sex, Insurance_Policy, Age, Address_Patient, Date_Registration_File, Destinations)
VALUES (1, 'Oleg', 'Olegov', 'Olegovich', 'Man', '0000-0000-0000-0001', 51, 'City 2, House 2', '2000-03-05', 'Dest2');
INSERT INTO Patient_File(Number_File, Name_Patient, Surname_Patient, Middle_Name_Patient, Sex, Insurance_Policy, Age, Address_Patient, Date_Registration_File, Destinations)
VALUES (2, 'Ivan', 'Ivanov', 'Ivanovich', 'Man', '0000-0000-0000-0002', 52, 'City 3, House 3', '2000-03-06', 'Dest3');
INSERT INTO Patient_File(Number_File, Name_Patient, Surname_Patient, Middle_Name_Patient, Sex, Insurance_Policy, Age, Address_Patient, Date_Registration_File, Destinations)
VALUES (3, 'Danil', 'Daniilov', 'Danilovich', 'Man', '0000-0000-0000-0003', 53, 'City 4, House 4', '2000-03-07', 'Dest4');
INSERT INTO Patient_File(Number_File, Name_Patient, Surname_Patient, Middle_Name_Patient, Sex, Insurance_Policy, Age, Address_Patient, Date_Registration_File, Destinations)
VALUES (4, 'Gregory', 'Gregoriev', 'Gregorievich', 'Man', '0000-0000-0000-0004', 54, 'City 5, House 5', '2000-03-08', 'Dest5');

#table 2
INSERT INTO Information_about_doctor(Phone, Name_Doctor,Surname_Doctor,Middle_Name_Doctor, Category,Experience_in_years, Date_Of_Birth)
VALUES ('777-56-67', 'Oziz', 'Ozizov', 'Ozizovich', 'Category1', 5, '1990-03-04');
INSERT INTO Information_about_doctor(Phone, Name_Doctor,Surname_Doctor,Middle_Name_Doctor, Category,Experience_in_years, Date_Of_Birth)
VALUES ('777-65-78', 'Aleks', 'Aleksov', 'Aleksovich', 'Category2', 6, '1990-03-05');
INSERT INTO Information_about_doctor(Phone, Name_Doctor,Surname_Doctor,Middle_Name_Doctor, Category,Experience_in_years, Date_Of_Birth)
VALUES ('777-65-79', 'Gleb', 'Glebov', 'Glebovich', 'Category3', 7, '1990-03-06');
INSERT INTO Information_about_doctor(Phone, Name_Doctor,Surname_Doctor,Middle_Name_Doctor, Category,Experience_in_years, Date_Of_Birth)
VALUES ('777-85-74', 'Vladislav', 'Vladislavov', 'Vladislavovich', 'Category4', 8, '1990-03-07');
INSERT INTO Information_about_doctor(Phone, Name_Doctor,Surname_Doctor,Middle_Name_Doctor, Category,Experience_in_years, Date_Of_Birth)
VALUES ('777-95-24', 'Svyatoslav', 'Svyatoslavov', 'Svyatoslavovich', 'Category4', 9, '1991-03-09');

#table 3
INSERT INTO Visiting(Number_File,Date_Visiting,Health_Complaints,Preliminiary_Diagnosis)
VALUES (0, '2005-03-04', 'hc001', 'pd001');
INSERT INTO Visiting(Number_File,Date_Visiting,Health_Complaints,Preliminiary_Diagnosis)
VALUES (1, '2005-03-05', 'hc002', 'pd002');
INSERT INTO Visiting(Number_File,Date_Visiting,Health_Complaints,Preliminiary_Diagnosis)
VALUES (2, '2005-03-06', 'hc003', 'pd003');
INSERT INTO Visiting(Number_File,Date_Visiting,Health_Complaints,Preliminiary_Diagnosis)
VALUES (3, '2005-03-07', 'hc004', 'pd004');
INSERT INTO Visiting(Number_File,Date_Visiting,Health_Complaints,Preliminiary_Diagnosis)
VALUES (4, '2005-03-08', 'hc005', 'pd005');

#table 4
INSERT INTO  Hospital_Sheet(Number_File,Date_Visiting,Phone,Surname_Doctor, Term)
VALUES (0, '2005-03-04', '777-56-67', 'Ozizov', '2006-03-04');
INSERT INTO  Hospital_Sheet(Number_File,Date_Visiting,Phone,Surname_Doctor, Term)
VALUES (1, '2005-03-05', '777-65-78', 'Aleksov', '2007-03-04');
INSERT INTO  Hospital_Sheet(Number_File,Date_Visiting,Phone,Surname_Doctor, Term)
VALUES (2, '2005-03-06', '777-65-78', 'Glebov', '2008-03-04');
INSERT INTO  Hospital_Sheet(Number_File,Date_Visiting,Phone,Surname_Doctor, Term)
VALUES (3, '2005-03-07', '777-85-74', 'Vladislavov', '2009-03-04');
INSERT INTO  Hospital_Sheet(Number_File,Date_Visiting,Phone,Surname_Doctor, Term)
VALUES (4, '2005-03-08', '777-95-24', 'Svyatoslavov', '2010-03-04');



#table 5
INSERT INTO Doctor_Appointment(Phone, Number_section, Time_var, Number_Cabinet, Day_var)
VALUES ('777-56-67', 0, '15:00:00', 0, '2005-03-04');
INSERT INTO Doctor_Appointment(Phone, Number_section, Time_var, Number_Cabinet, Day_var)
VALUES ('777-65-78', 1, '16:00:00', 1, '2005-03-05');
INSERT INTO Doctor_Appointment(Phone, Number_section, Time_var, Number_Cabinet, Day_var)
VALUES ('777-65-78', 2, '17:00:00', 2, '2005-03-06');
INSERT INTO Doctor_Appointment(Phone, Number_section, Time_var, Number_Cabinet, Day_var)
VALUES ('777-85-74', 3, '18:00:00', 3, '2005-03-07');
INSERT INTO Doctor_Appointment(Phone, Number_section, Time_var, Number_Cabinet, Day_var)
VALUES ('777-95-24', 4, '18:00:00', 4, '2005-03-08');


#querries


#• Адрес данного больного, дата последнего посещения поликлиники и диагноз?
SET @Number_File = 0;
SELECT Address_Patient, Date_Visiting, Preliminiary_Diagnosis
FROM Patient_File JOIN Visiting ON Patient_File.Number_File=Visiting.Number_File
WHERE Patient_File.Number_File = @Number_File;

#• Фамилия и инициалы лечащего врача данного больного?
SET @Number_File = 0;
SELECT Information_about_doctor.Name_Doctor, Information_about_doctor.Surname_Doctor, Number_File
FROM Hospital_Sheet JOIN Information_about_doctor ON Information_about_doctor.Phone=Hospital_Sheet.Phone
WHERE Hospital_Sheet.Number_File = @Number_File;

#• Номер кабинета, дни и часы приема данного врача?

SET @Phone = '777-56-67';
SELECT Day_var, Time_var, Number_Cabinet
FROM Doctor_Appointment
WHERE Doctor_Appointment.Phone = @Phone;

#• Больные, находящиеся в данный момент на лечении у данного врача (не истек срок больничного листа);

SET @Phone = '777-56-67';
SELECT Hospital_Sheet.Number_File, Patient_File.Name_Patient, Patient_File.Surname_Patient, Patient_File.Middle_Name_Patient
FROM Hospital_Sheet JOIN Information_about_doctor ON Information_about_doctor.Phone=Hospital_Sheet.Phone
    JOIN Patient_File on Hospital_Sheet.Number_File = Patient_File.Number_File
WHERE Information_about_doctor.Phone = @Phone AND DATEDIFF(Term, Date_Visiting)>0;

#• Назначения врачей при указанном заболевании?


SET @Diagnosis = 'pd001';
SELECT Destinations, Name_Doctor, Information_about_doctor.Surname_Doctor, Middle_Name_Doctor
FROM Patient_File JOIN Visiting ON Patient_File.Number_File=Visiting.Number_File
    JOIN Hospital_Sheet ON Hospital_Sheet.Number_File = Patient_File.Number_File
    JOIN Information_about_doctor ON Hospital_Sheet.Phone = Information_about_doctor.Phone
WHERE Visiting.Preliminiary_Diagnosis = @Diagnosis;

#• Кто работает в данный момент в указанном кабинете?

SET @Number_Cabinet = 0;
SET @To_Day = '2005-03-04';
SELECT Phone
FROM Doctor_Appointment
WHERE Doctor_Appointment.Number_Cabinet = @Number_Cabinet  AND Doctor_Appointment.Day_var = @To_Day;

#• Сколько раз за прошедший месяц обращался в поликлинику указанный больной?


SET @Date = '2005-04-04';
SELECT count(Number_File)
FROM Visiting
WHERE DATEDIFF(Date_Visiting, @Date)<=30;

#• Какое количество больных обслужил за прошедший месяц каждый из врачей поликлиники?

SET @Date = '2005-04-04';
SELECT count(Number_File)
FROM Information_about_doctor JOIN Hospital_Sheet ON Information_about_doctor.Phone = Hospital_Sheet.Phone
WHERE DATEDIFF(Date_Visiting, @Date)<=30;


