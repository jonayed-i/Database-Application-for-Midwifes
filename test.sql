SELECT DATE, TIME, HEALTHID, mom.NAME, mom.Phone
FROM APPOINTMENT
         JOIN
     (SELECT *
      FROM MIDWIFE
               JOIN (SELECT * FROM PARTICIPATE) P ON MIDWIFE.PRACID = P.PRACID) a ON a.AID = APPOINTMENT.AID

         JOIN (SELECT HEALTHID, NAME, Phone, AID
               FROM PARENT
                        JOIN(
                   SELECT PID, AID
                   FROM FEMALEIN
                            JOIN (
                       SELECT CID, AID
                       FROM EXPECTS
                                JOIN
                            (SELECT PID, a.AID
                             FROM APPOINTMENT
                                      JOIN
                                  (SELECT *
                                   FROM MIDWIFE
                                            JOIN (SELECT * FROM PARTICIPATE) P ON MIDWIFE.PRACID = P.PRACID) a
                                  ON a.AID = APPOINTMENT.AID
                             WHERE APPOINTMENT.DATE BETWEEN '2022-03-21' AND '2022-03-25'
                               AND NAME = 'Marion Girard') p ON p.PID = EXPECTS.PID) c ON c.CID = FEMALEIN.CID) x
                            ON PARENT.PID = x.PID) mom
              ON mom.AID = APPOINTMENT.AID

WHERE APPOINTMENT.DATE BETWEEN '2022-03-21' AND '2022-03-25'
  AND a.NAME = 'Marion Girard'
;

SELECT datelab, result
FROM PARENT
         JOIN (
    SELECT PID, datelab, result
    FROM FEMALEIN
             JOIN (
        SELECT p.CID, datelab, result
        FROM COUPLE
                 JOIN (
            SELECT *
            FROM EXPECTS
                     JOIN (
                SELECT part.PID, datelab, result
                FROM PREGNANCY
                         JOIN (
                    SELECT *
                    FROM PARTICIPATE
                             JOIN (
                        SELECT datelab, result, AID
                        FROM PRESCRIBES
                                 JOIN
                             (SELECT *
                              FROM TEST
                              WHERE TYPE = 'blood iron') test ON PRESCRIBES.TID = test.tid) test
                                  ON test.aid = PARTICIPATE.aid) part ON part.PID = PREGNANCY.PID
                WHERE PREGNUM = 2) t
                          ON t.pid = EXPECTS.pid
        ) p ON p.cid = COUPLE.CID
    ) ci ON ci.cid = FEMALEIN.CID) r ON r.pid = PARENT.PID
WHERE PARENT.NAME = 'Victoria Gutierez';



SELECT NAME, SUM(NUMBABIES)
FROM HEALTHINSTITUTION
         JOIN (
    SELECT EMAIL, NUMBABIES
    FROM WORKSFOR
             JOIN (
        SELECT *
        FROM ASSIGNEDTOPRIM
                 JOIN (
            SELECT CID, pregnum, numbabies
            FROM EXPECTS
                     JOIN (
                SELECT *
                FROM PREGNANCY
                WHERE FINALDUEDATE IS NOT NULL
                  AND FINALDUEDATE BETWEEN '2022-07-01' AND '2022-07-31') p ON p.PID = EXPECTS.PID) pr
                      ON pr.CID = ASSIGNEDTOPRIM.CID
    ) pr ON pr.PRACID = WORKSFOR.PRACID
    UNION
    (SELECT email, NUMBABIES
     FROM WORKSFOR
              JOIN (
         SELECT PRACID, NUMBABIES
         FROM ASSIGNEDTOPRIM
                  JOIN
              (SELECT *
               FROM MOTHER
                        JOIN (
                   SELECT FEMALEIN.PID, NUMBABIES, e.CID
                   FROM FEMALEIN
                            JOIN (
                       SELECT *
                       FROM EXPECTS
                                JOIN (
                           SELECT PID, NUMBABIES
                           FROM PREGNANCY
                           WHERE FINALDUEDATE IS NULL) p ON EXPECTS.PID = p.PID) e ON FEMALEIN.CID = e.CID
               ) fi ON fi.PID = MOTHER.pid
               WHERE TIMEFRAME BETWEEN '2022-07-01' AND '2022-07-31') num ON num.CID = ASSIGNEDTOPRIM.CID) pr
                   ON pr.PRACID = WORKSFOR.PRACID
    )
) em ON em.EMAIL = HEALTHINSTITUTION.EMAIL
GROUP BY NAME;


SELECT HEALTHID, PARENT.NAME, PHONE
FROM PARENT
         JOIN (
    SELECT PID, NAME
    FROM FEMALEIN
             JOIN (
        SELECT NAME, CID
        FROM HEALTHINSTITUTION
                 JOIN (
            SELECT x.PRACID, CID, EMAIL
            FROM WORKSFOR
                     JOIN
                 (
                     SELECT c.CID, pracid
                     FROM ASSIGNEDTOPRIM
                              JOIN (
                         SELECT CID
                         FROM EXPECTS
                                  JOIN (
                             SELECT PREGNANCY.PID
                             FROM PREGNANCY
                                      FULL JOIN DELIVERS D ON PREGNANCY.PID = D.PID
                             WHERE BID IS NULL
                                      UNION (SELECT PID FROM DELIVERS
                                                                 JOIN BABY B ON DELIVERS.BID = B.BID
                                             WHERE DATEOFBIRTH > (SELECT CURRENT_DATE FROM sysibm.sysdummy1) or DATEOFBIRTH is null)

                                      ) p ON p.PID = EXPECTS.PID) c ON c.CID = ASSIGNEDTOPRIM.CID) x
                 ON x.PRACID = WORKSFOR.PRACID) e ON e.EMAIL = HEALTHINSTITUTION.EMAIL) x ON x.cid = FEMALEIN.cid) y
              ON y.PID = PARENT.PID
WHERE y.NAME = 'Lac-Saint-Louis';



SELECT NAME, HEALTHID
FROM PARENT
WHERE PID IN
      (
          SELECT FEMALEIN.PID
          FROM FEMALEIN
          WHERE CID IN
                (
                    SELECT CID
                    FROM EXPECTS
                    WHERE PID IN (
                        SELECT PID
                        FROM PREGNANCY
                        WHERE NUMBABIES > 1)));



CREATE VIEW MidWifeInfo AS
(SELECT PRACID,
       x.NAME                 AS MidwifeName,
       PHONE                  AS MIDWIFEPHONE,
       x.EMAIL                AS MIDWIFEEMAIL,
       HEALTHINSTITUTION.NAME AS HEALTHINSTITUTIONNAME,
       ADDRESS                AS facilityaddress
FROM HEALTHINSTITUTION
         JOIN (
    SELECT M.EMAIL, WORKSFOR.EMAIL AS HospitalEmail, M.PRACID, NAME, PHONE
    FROM WORKSFOR
             JOIN MIDWIFE M ON WORKSFOR.PRACID = M.PRACID) x ON HospitalEmail = HEALTHINSTITUTION.EMAIL);


CREATE VIEW MIDWIFEINFO1 AS
SELECT * FROM MidWifeInfo LIMIT 5;

SELECT * FROM MidWifeInfo WHERE HEALTHINSTITUTIONNAME = 'Lac-Saint-Louis' LIMIT 5;

INSERT INTO MidWifeInfo VALUES (152,'jane',4567899,'jane@gmail.com','Lac-Saint-Louis','69 west ave');



DROP VIEW MidWifeInfo;

INSERT INTO TEST (TID, TECHNAME, DATESAMPLE, DATELAB, DATEPRESCRIBED, TECHPHONE, RESULT, TYPE, TECHID) VALUES
(99,'John Boy','2021-02-02','2021-03-02','2021-04-02',2215469,'Great Vitamins','Vitamin scan',62);

SELECT NAME,Time, HEALTHID, 'B' as isprim FROM PARENT JOIN (
Select FEMALEIN.PID, TIME FROM FEMALEIN JOIN (
Select CID, Time from EXPECTS Join (
Select ASSIGNEDTOBACKUP.PID, TIME from ASSIGNEDTOBACKUP
    Join (
Select * from APPOINTMENT
    JOIN (
select * from PARTICIPATE where PRACID = 151) p on p.aid = APPOINTMENT.AID
WHERE DATE = '2022-03-22') ap on ap.PRACID = ASSIGNEDTOBACKUP.PRACID AND ap.PID = ASSIGNEDTOBACKUP.PID) b
on EXPECTS.PID = b.PID) c on c.cid = FEMALEIN.CID) f on f.PID = PARENT.pid
UNION
(
SELECT NAME,Time, HEALTHID, 'P' as isprim  FROM PARENT JOIN (
    Select FEMALEIN.PID, TIME FROM FEMALEIN JOIN (
        Select CID, Time from EXPECTS Join (
            Select ASSIGNEDTOprim.PID, TIME from ASSIGNEDTOPRIM
                                                       Join (
                Select * from APPOINTMENT
                                  JOIN (
                    select * from PARTICIPATE where PRACID = 151) p on p.aid = APPOINTMENT.AID
                WHERE DATE = '2022-03-22') ap on ap.PRACID = ASSIGNEDTOPRIM.PRACID AND ap.PID = ASSIGNEDTOPRIM.PID) b
                                           on EXPECTS.PID = b.PID) c on c.cid = FEMALEIN.CID) f on f.PID = PARENT.pid)
;

Select * from APPOINTMENT
JOIN PARTICIPATE P ON APPOINTMENT.AID = P.AID WHERE PRACID = 251 and DATE = '2023-03-22'


Select NAME,HEALTHID FROM PARENT
    Join (
Select FEMALEIN.PID, AID FROM FEMALEIN
    join(
Select *  from Participate
JOIN EXPECTS E ON PARTICIPATE.PID = E.PID) c on c.CID = FEMALEIN.CID) p on p.PID = PARENT.PID
WHERE AID = 19;

SELECT date, bro.TIME, bro.OBSERVATION FROM APPOINTMENT
    Join (
Select * from NOTE
JOIN HAS H ON NOTE.NID = H.NID) bro on bro.AID = APPOINTMENT.AID
WHERE bro.AID = 19;


SELECT COALESCE(Result, 'PENDING'), type, dateprescribed from PRESCRIBES
JOIN TEST T ON T.TID = PRESCRIBES.TID
WHERE AID in (Select aid FROM PARTICIPATE where pid in (
    SELECT pid FROM PARTICIPATE where aid = 19)) ORDER BY dateprescribed DESC;

Select * FROM TEST;

Select * FROM PARTICIPATE where pid in (
SELECT pid FROM PARTICIPATE where aid = 19)

INSERT INTO Note VALUES (3750,healthy and happy,'15:09:57');

SELECT * from has
    (30, 'Jackie Belmont', '2022-07-22', '2022-07-22', 5466456, NULL, 'liver biopsy', 777, '2021-06-11'),
;
INSERT INTO TEST VALUES (38555, 'John Kruger', '2022-03-22', '2022-03-22',5469875, NULL,'Diabetes check', 888, '2021-06-11');

Select * from PRESCRIBES

;


SELECT NAME, CID, PREGNUM, OBSERVATION FROM NOTE JOIN(
SELECT * FROM HAS JOIN (
SELECT * FROM PARTICIPATE JOIN (
SELECT NAME, FINALDUEDATE, PREGNUM, PREGNANCY.PID, CID FROM PREGNANCY JOIN (
SELECT EXPECTS.pid, Name, c.CID FROM EXPECTS JOIN
    (
SELECT * FROM FEMALEIN join
PARENT P ON FEMALEIN.PID = P.PID
WHERE FEMALEIN.PID = 101) c on c.cid = EXPECTS.CID ) p on p.PID = PREGNANCY.PID) preg on preg.PID = PARTICIPATE.PID) a on has.AID = a.AID) n on n.NID = note.NID   ;

DROP TABLE TEST;

DROP TABLE PRESCRIBES;

SELECT * FROM NOTE
;
INSERT INTO NOTE VALUES (456, 'mother looks depressed.', '11:12:31');


SELECT * FROM HAS;

INSERT INTO HAS VALUES(456,29);


SELECT t.TID, type, result, name, cid, PREGNUM  FROM TEST JOIN (
SELECT * FROM PRESCRIBES JOIN (
SELECT * FROM PARTICIPATE JOIN (
SELECT NAME, FINALDUEDATE, PREGNUM, PREGNANCY.PID, CID FROM PREGNANCY JOIN (
SELECT EXPECTS.pid, Name, c.CID FROM EXPECTS JOIN (
SELECT * FROM FEMALEIN join
PARENT P ON FEMALEIN.PID = P.PID
WHERE FEMALEIN.PID = 101) c on c.cid = EXPECTS.CID ) p on p.PID = PREGNANCY.PID) preg on preg.PID = PARTICIPATE.PID)
a ON a.aid = PRESCRIBES.AID) t on t.TID = test.TID

SELECT * FROM TEST;

SELECT * FROM PRESCRIBES;


SELECT t.TID, type, result, name, cid, PREGNUM  FROM TEST JOIN (
    SELECT * FROM PRESCRIBES JOIN (
        SELECT * FROM PARTICIPATE JOIN (
            SELECT NAME, FINALDUEDATE, PREGNUM, PREGNANCY.PID, CID FROM PREGNANCY JOIN (
                SELECT EXPECTS.pid, Name, c.CID FROM EXPECTS JOIN (
                    SELECT * FROM FEMALEIN join
                                  PARENT P ON FEMALEIN.PID = P.PID
                    WHERE FEMALEIN.PID = 102) c on c.cid = EXPECTS.CID ) p on p.PID = PREGNANCY.PID) preg on preg.PID = PARTICIPATE.PID)
        a ON a.aid = PRESCRIBES.AID) t on t.TID = test.TID;


CREATE INDEX idxphone
    ON PARENT (PHONE,ADDRESS);

CREATE UNIQUE INDEX phoneidx
    ON PARENT(PHONE) INCLUDE (ADDRESS);

SELECT NAME, UNIQUERULE
FROM SYSIBM.SYSINDEXES WHERE TBNAME='PARENT'


SELECT MONTH(FINALDUEDATE) AS MONTH,  COUNT(FINALDUEDATE) AS BIRTHS FROM PREGNANCY
WHERE  FINALDUEDATE BETWEEN '2022-07-01' AND '2022-09-30'
GROUP BY  MONTH(FINALDUEDATE);



INSERT INTO PREGNANCY (PID, FINALDUEDATE, MENSTRUALDUEDATE, USOUNDDUEDATE, HOMEBIRTH, PREGNUM, NUMBABIES)
VALUES (1191, '2022-07-22', '2022-07-22', '2022-07-23', FALSE, 2, 3),
       (1198, '2022-07-22', NULL, NULL, FALSE, 6, 2);