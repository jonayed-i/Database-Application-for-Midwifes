INSERT INTO PARENT (PID, NAME, PHONE, HEALTHID, DATEOFBIRTH, PROFESSION)
VALUES (101, 'Victoria Gutierez', 2223333, 69875, '1992-06-22', 'Unemployed'),
       (102, 'Ria Ierez', 3334444, 33875, '1992-06-22', 'Unemployed'),
       (103, 'Rori Gut', 4445555, 29875, '1992-06-22', 'Unemployed'),
       (104, 'Vic Rez', 4445556, 19875, '1992-06-22', 'Unemployed'),
       (105, 'Ra Tier', 4445557, 59875, '1992-06-22', 'Unemployed'),

       (205, 'Ro Tier', 3445559, 59175, '1992-06-22', 'Unemployed'),
       (305, 'Ran Aier', 3445551, 52815, '1992-06-22', 'Unemployed'),
       (405, 'Rex Tier', 3445552, 59875, '1992-06-22', 'Unemployed'),
       (505, 'Rope Hier', 3445555, 39875, '1992-06-22', 'Unemployed'),
       (605, 'Chad Tier', 3445557, 49875, '1992-06-22', 'Unemployed');


INSERT INTO FATHER (PID)
VALUES (205),
       (305),
       (405),
       (505),
       (605);

INSERT INTO MOTHER (PID, TIMEFRAME)
VALUES (101, '2022-07-02'),
       (102, '2022-07-02'),
       (103, '2022-07-02'),
       (104, '2024-07-02'),
       (105, '2023-07-02');

INSERT INTO COUPLE (CID, INTEREST)
VALUES (11, TRUE),
       (21, TRUE),
       (31, TRUE),
       (41, TRUE),
       (51, FALSE);

INSERT INTO MALEIN (PID, CID)
VALUES (205, 11),
       (305, 21),
       (405, 31),
       (505, 41),
       (605, 51);

INSERT INTO FEMALEIN (PID, CID)
VALUES (101, 11),
       (102, 21),
       (103, 31),
       (104, 41),
       (105, 51);

INSERT INTO INFOSESSION (SID, DATE, TIME, LANGUAGE)
VALUES (1234, '2022-01-02', '2:22:26', 'Spanish'),
       (2234, '2022-02-02', '3:22:26', 'Spanish'),
       (3234, '2022-03-02', '4:22:26', 'French'),
       (4234, '2022-04-02', '5:22:26', 'English'),
       (5234, '2002-07-02', '6:22:26', 'Not Spanish');

INSERT INTO INVITEDTO (SID, CID, ATTENDED)
VALUES (1234, 11, TRUE),
       (2234, 21, TRUE),
       (3234, 31, TRUE),
       (4234, 41, TRUE),
       (5234, 51, FALSE);

INSERT INTO MIDWIFE (PRACID, NAME, EMAIL, DATEOFBIRTH, PHONE)
VALUES (151, 'Marion Girard', 'midwifey@gmail.com', '2002-07-02', 5422233),
       (152, 'Silvano Chiellini', 'midwifeyy@gmail.com', '2002-07-12', 5422231),
       (153, 'Clara Mele', 'midwifeyyy@gmail.com', '2002-07-01', 5422213),
       (154, 'Paola Alfonsi', 'mwife@gmail.com', '2002-07-30', 5422113),
       (155, 'Meo Esposito', 'midwifer@gmail.com', '2002-08-02', 5112233),
       (251, 'Melisande Leclerc', 'midwifers@gmail.com', '2002-06-02', 5411233),
       (351, 'Flo Pelletier', 'miife@gmail.com', '2002-04-02', 5422233),
       (451, 'Adélie Droit', 'mife@gmail.com', '2002-03-02', 54223333),
       (551, 'Tatienne Rousseau', 'mide@gmail.com', '2001-07-02', 5422266),
       (651, 'Geun Haneul', 'fe12@gmail.com', '2000-07-02', 5422773),
       (851, 'Seonu Yoon', 'fe8882@gmail.com', '2008-07-02', 5428873);


INSERT INTO PREGNANCY (PID, FINALDUEDATE, MENSTRUALDUEDATE, USOUNDDUEDATE, HOMEBIRTH, PREGNUM, NUMBABIES)
VALUES (91, '2022-07-22', '2022-07-22', '2022-07-23', FALSE, 2, 3),
       (92, '2022-07-12', '2022-07-12', '2022-07-23', FALSE, 1, 2),
       (93, NULL, '2022-04-22', '2022-04-23', TRUE, 2, 3),
       (94, '2020-07-12', '2022-04-22', '2022-07-23', FALSE, 2, 1),
       (95, '2020-07-22', '2020-07-20', '2020-07-23', FALSE, 3, 1),
       (96, '2022-07-22', NULL, NULL, FALSE, 1, 1),
       (97, '2022-08-02', '2022-07-22', '2022-08-22', FALSE, 4, 1),
       (197, '2022-08-02', '2022-07-22', '2022-08-22', FALSE, 4, 1),
       (297, '2022-08-02', '2022-07-22', '2022-08-22', FALSE, 4, 1),
       (397, '2022-08-02', '2022-07-22', '2022-08-22', FALSE, 4, 1),
       (497, '2022-08-02', '2022-07-22', '2022-08-22', FALSE, 4, 1),
       (597, '2022-08-02', '2022-07-22', '2022-08-22', FALSE, 4, 1),
       (697, '2022-08-02', '2022-07-22', '2022-08-22', FALSE, 4, 1),
       (607, '2022-09-02', '2022-07-22', '2022-08-22', FALSE, 4, 1),
       (617, '2022-09-02', '2022-07-22', '2022-08-22', FALSE, 4, 1),
       (627, '2022-09-02', '2022-07-22', '2022-08-22', FALSE, 4, 1),
       (637, '2022-09-02', '2022-07-22', '2022-08-22', FALSE, 4, 1),
       (647, '2022-09-02', '2022-07-22', '2022-08-22', FALSE, 4, 1),
       (657, '2022-09-02', '2022-07-22', '2022-08-22', FALSE, 4, 1),
       (667, '2022-09-02', '2022-07-22', '2022-08-22', FALSE, 4, 1),
       (677, '2022-09-02', '2022-07-22', '2022-08-22', FALSE, 4, 1),
       (687, '2022-09-02', '2022-07-22', '2022-08-22', FALSE, 4, 1),
       (98, NULL, NULL, NULL, FALSE, 6, 2);

INSERT INTO ASSIGNEDTOPRIM (PID, PRACID)
VALUES (91, 151),
       (92, 152),
       (93, 153),
       (94, 154),
       (95, 155);

INSERT INTO ASSIGNEDTOBACKUP (PID, PRACID)
VALUES (96, 151),
       (97, 351),
       (98, 451),
       (95, 151),
       (92, 151);

INSERT INTO APPOINTMENT (AID, DATE, TIME)
VALUES (19, '2022-03-22', '4:22:26'),
       (29, '2022-03-22', '6:22:26'),
       (39, '2025-01-01', '11:22:26'),
       (49, '2025-01-01', '4:22:26'),
       (59, '2025-01-01', '7:12:21');



INSERT INTO PARTICIPATE (PID, PRACID, AID)
VALUES (91, 151, 19),
       (92, 151, 29),
       (93, 151, 39),
       (96, 151, 49),
       (95, 151, 59);

INSERT INTO EXPECTS (PID, CID)
VALUES (91, 11),
       (92, 21),
       (93, 31),
       (94, 41),
       (95, 31),
       (96, 41),
       (97, 11),
       (98, 41);

INSERT INTO BABY (BID, DATEOFBIRTH, GENDER, NAME, TIMEOFBIRTH, BLOODTYPE)
VALUES (41, '2022-07-12', TRUE, 'Archibald Bartholomew', '4:22:26', 'A-'),
       (42, '2021-07-12', TRUE, 'Arch Barthol', '4:21:26', 'A+'),
       (43, '2022-05-12', FALSE, 'Ald Bartho', '4:21:26', NULL),
       (44, '2024-07-12', FALSE, 'Chibald Mew', '4:32:26', NULL),
       (46, '2020-07-12', TRUE, 'Abal Bartholomew', '11:22:26', 'B-'),
       (47, '2020-04-22', TRUE, 'Abal Bartholomew', '11:22:26', 'B-'),
       (45, '2020-06-12', TRUE, 'Abal Bartholomew', '11:22:26', 'B-');


INSERT INTO DELIVERS (BID, PID)
VALUES (41, 91),
       (42, 91),
       (43, 92),
       (44, 93),
       (46, 95),
       (47, 96),
       (45, 94);

INSERT INTO HEALTHINSTITUTION (NAME, EMAIL, PHONENUM, ADDRESS, WEBSITE)
VALUES ('Centre Hospitalier de Universite de Montreal', 'chum@gmail.com', 1335468, '69 west ave', 'chum.com'),
       ('Centre Hospitalier Avalon', 'chuav@gmail.com', 2355468, '139 westmount ave', 'chum.org'),
       ('Centre Hospitalier Alistair', 'chual@gmail.com', 3355468, '19 weston ave', 'chum.ca'),
       ('Augustine', 'chuaug@gmail.com', 4355468, '1 mount ave', NULL),
       ('Centre Hospitalier de Universite de Avalon', 'chua@gmail.com', 5355468, '124 westmount ave', 'chua.com'),
       ('Augustinemont', 'chuaugm@gmail.com', 635568, '117 mount ave', NULL),
       ('August', 'augm@gmail.com', 635568, '831 moore ave', NULL),
       ('Gustine', 'gm@gmail.com', NULL, '221 mount ave', NULL),
       ('Mont', 'm@gmail.com', 735568, '848 rose ave', NULL),
       ('Gustinemont', 'gmg@gmail.com', 835568, '415 mount ave', NULL),
       ('Lac-Saint-Louis', 'lsl@gmail.com', 5335468, '669 west ave', 'lsl.com');


INSERT INTO WORKSFOR (EMAIL, PRACID)
VALUES ('lsl@gmail.com', 151),
       ('chua@gmail.com', 152),
       ('chuav@gmail.com', 153),
       ('lsl@gmail.com', 154),
       ('lsl@gmail.com', 155),
       ('augm@gmail.com', 251),
       ('augm@gmail.com', 351),
       ('gm@gmail.com', 451),
       ('m@gmail.com', 551),
       ('gmg@gmail.com', 651),
       ('lsl@gmail.com', 851);



INSERT INTO BIRTHINGCENTER (EMAIL)
VALUES ('chum@gmail.com'),
       ('chuav@gmail.com'),
       ('chual@gmail.com'),
       ('chua@gmail.com'),
       ('lsl@gmail.com');

INSERT INTO COMMCLINIC (EMAIL)
VALUES ('chuaugm@gmail.com'),
       ('augm@gmail.com'),
       ('gm@gmail.com'),
       ('m@gmail.com'),
       ('gmg@gmail.com');

INSERT INTO BIRTHAT (PID, EMAIL)
VALUES (94, 'lsl@gmail.com'),
       (95, 'chum@gmail.com'),
       (96, 'chuav@gmail.com'),
       (97, 'chua@gmail.com'),
       (98, 'chua@gmail.com'),
       (91, 'lsl@gmail.com'),
       (92, 'lsl@gmail.com');

INSERT INTO NOTE
VALUES (81, 'Great growth. Good weight', '4:21:36'),
       (82, 'Complains about vomiting and nausea', '4:20:16'),
       (83, 'probably cancer', '1:11:26'),
       (84, 'almost dead', '1:21:26'),
       (85, 'dead', '4:22:26');



INSERT INTO HAS (NID, AID)
VALUES (81, 19),
       (82, 19),
       (83, 39),
       (84, 39),
       (85, 39);

INSERT INTO TEST (TID, TECHNAME, DATESAMPLE, DATELAB, TECHPHONE, RESULT, TYPE, TECHID, DATEPRESCRIBED)
VALUES (30, 'Jackie Belmont', '2022-07-22', '2022-07-22', 5466456, NULL, 'liver biopsy', 777, '2021-06-11'),
       (31, 'Jackie Belmont', '2022-04-22', '2022-07-22', 5466456, 'cancer', 'vitamin d', 777, '2022-02-11'),
       (32, 'Jack Lamont', '2011-07-22', '2012-07-22', 5466457, 'cancer', 'radiation', 778, '2011-06-11'),
       (33, 'Jack Lamont', '2012-07-22', '2012-08-22', 5466457, 'cancer', 'liver biopsy', 778, '2010-01-11'),
       (34, 'Jack Bel', '2021-07-22', '2022-09-22', 5466458, 'too low iron baby might die', 'blood iron', 779,
        '2021-02-11');

INSERT INTO PRESCRIBES (TID, AID, PATIENT)
VALUES (34, 19, 'mom'),
       (30, 19, 'mom'),
       (31, 29, 'mom'),
       (32, 39, 'baby'),
       (33, 59, 'baby');