CREATE TABLE Parent
(
    PID         int          NOT NULL,
    Name        varchar(255) NOT NULL,
    Email       varchar(255),
    DateofBirth DATE         NOT NULL,
    Phone       int          NOT NULL,
    Profession  varchar(255) NOT NULL,
    Address     varchar(255),
    BloodType   varchar(255),
    HealthId    int,
    PRIMARY KEY (PID)
);

CREATE TABLE Father
(
    PID int REFERENCES Parent (PID) NOT NULL,
    PRIMARY KEY (PID)
);

CREATE TABLE Mother
(
    PID       int REFERENCES Parent (PID) NOT NULL,
    Timeframe DATE,
    PRIMARY KEY (PID)
);

CREATE TABLE Couple
(
    CID       int NOT NULL,
    Interest  BOOLEAN,


    PRIMARY KEY (CID)
);

CREATE TABLE FemaleIn
(
    PID int        NOT NULL,
    CID int UNIQUE NOT NULL,
    PRIMARY KEY (CID),
    FOREIGN KEY (PID) REFERENCES Mother (PID),
    FOREIGN KEY (CID) REFERENCES Couple (CID)

);

CREATE TABLE MaleIn
(
    PID int,
    CID int,

    FOREIGN KEY (PID) REFERENCES Father (PID),
    FOREIGN KEY (CID) REFERENCES Couple (CID)

);


CREATE TABLE InfoSession
(
    SID      int NOT NULL,
    Date     Date,
    Time     Time,
    Language varchar(255),

    PRIMARY KEY (SID)
);

CREATE TABLE InvitedTo
(
    SID      int NOT NULL,
    CID      int NOT NULL,
    Attended boolean,
    PRIMARY KEY (SID, CID),
    FOREIGN KEY (SID) REFERENCES InfoSession (SID),
    FOREIGN KEY (CID) REFERENCES Couple (CID)

);




CREATE TABLE Midwife
(
    PracID      int NOT NULL,
    Name        varchar(255),
    Email       varchar(255),
    DateofBirth DATE,
    Phone       int,

    PRIMARY KEY (PracID)
);


CREATE TABLE HostedBy
(
    SID    int NOT NULL UNIQUE,
    PracID int,

    PRIMARY KEY (SID),
    FOREIGN KEY (SID) REFERENCES InfoSession (SID),
    FOREIGN KEY (PracID) REFERENCES Midwife (PracID)
);
CREATE TABLE Pregnancy
(
    PID              int NOT NULL,

    FinalDueDate     DATE,
    MenstrualDueDate DATE,
    UsoundDueDate    DATE,
    HomeBirth        BOOLEAN,
    PregNum int,
    NumBabies        int,
    PRIMARY KEY (PID)
);

CREATE TABLE AssignedToPrim
(
    PID    int NOT NULL UNIQUE,
    PracID int,


    PRIMARY KEY (PID),
    FOREIGN KEY (PID) REFERENCES PREGNANCY (PID),
    FOREIGN KEY (PracID) REFERENCES Midwife (PracID)
);

CREATE TABLE AssignedToBackup
(
    PID    int NOT NULL UNIQUE,
    PracID int,


    PRIMARY KEY (PID),
    FOREIGN KEY (PID) REFERENCES PREGNANCY (PID),
    FOREIGN KEY (PracID) REFERENCES Midwife (PracID)
);



CREATE TABLE Appointment
(
    AID  int NOT NULL,
    Date Date,
    Time Time,


    PRIMARY KEY (AID)
);




CREATE TABLE Note
(
    NID         int NOT NULL,
    Observation varchar(255),
    Time        Time,


    PRIMARY KEY (NID)
);

CREATE TABLE Has
(
    NID int NOT NULL,
    AID int,
    PRIMARY KEY (NID),
    FOREIGN KEY (AID) REFERENCES Appointment (AID),
    FOREIGN KEY (NID) REFERENCES Note (NID)

);

CREATE TABLE Test
(
    TID        int NOT NULL,
    TechName   varchar(255),
    DateSample DATE,
    DateLab    DATE,
    DatePrescribed DATE,
    TechPhone  int,
    Result     varchar(255),
    Type       varchar(255),
    TechId     int,
    CONSTRAINT lab CHECK ( DateLab >= DatePrescribed ),
    PRIMARY KEY (TID)
);

CREATE TABLE Prescribes
(
    TID            int NOT NULL,
    AID            int,

    Patient        varchar(255),
    PRIMARY KEY (TID),
    FOREIGN KEY (AID) REFERENCES Appointment (AID),
    FOREIGN KEY (TID) REFERENCES Test (TID)

);




CREATE TABLE Participate
(
    PID    int,
    PracID int,
    AID    int NOT NULL UNIQUE,
    PRIMARY KEY (AID),
    FOREIGN KEY (AID) REFERENCES Appointment (AID),
    FOREIGN KEY (PID) REFERENCES PREGNANCY (PID),
    FOREIGN KEY (PracID) REFERENCES Midwife (PracID)

);

CREATE TABLE Baby
(
    BID         int NOT NULL,
    DateofBirth DATE,
    Gender      BOOLEAN,
    Name        VARCHAR(255),
    TimeofBirth time,
    BloodType   VARCHAR(255),

    PRIMARY KEY (BID)
);
CREATE TABLE Expects
(
    PID int NOT NULL UNIQUE,
    CID int,

    PRIMARY KEY (PID),
    FOREIGN KEY (CID) REFERENCES Couple (CID),
    FOREIGN KEY (PID) REFERENCES Pregnancy (PID)

);


CREATE TABLE Delivers
(
    BID int NOT NULL UNIQUE,
    PID int,

    PRIMARY KEY (BID),
    FOREIGN KEY (BID) REFERENCES Baby (BID),
    FOREIGN KEY (PID) REFERENCES Pregnancy (PID)

);

CREATE TABLE HealthInstitution
(
    Name     varchar(255),
    Email    varchar(255) NOT NULL,
    PhoneNum int,
    Address  varchar(255),
    Website  varchar(255),
    PRIMARY KEY (Email)
);

CREATE TABLE CommClinic
(
    Email varchar(255) REFERENCES HealthInstitution (Email) NOT NULL,
    PRIMARY KEY (Email)
);

CREATE TABLE BirthingCenter
(
    Email varchar(255) REFERENCES HealthInstitution (Email) NOT NULL,
    PRIMARY KEY (Email)
);

CREATE TABLE WorksFor
(
    Email  varchar(255) NOT NULL,
    PracID int          NOT NULL UNIQUE,


    PRIMARY KEY (PracID),
    FOREIGN KEY (Email) REFERENCES HealthInstitution (Email),
    FOREIGN KEY (PracID) REFERENCES Midwife (PracID)
);



CREATE TABLE BirthAt
(
    PID   int,
    Email varchar(255),


    FOREIGN KEY (Email) REFERENCES BirthingCenter (Email),
    FOREIGN KEY (PID) REFERENCES Pregnancy (PID)
);
