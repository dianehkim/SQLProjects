

CREATE TABLE Person (  

    ID NUMBER NOT NULL,  

    Email NVARCHAR2(50) NOT NULL,  

    FirstName NVARCHAR2(50) NOT NULL,   

    MiddleName NVARCHAR2(50),   

    LastName NVARCHAR2(50) NOT NULL,   

    Role NVARCHAR2(50) NOT NULL,  

    LastActivity DATE,  

    TotalActivity NUMBER NOT NULL,  

    PRIMARY KEY (ID)   

);  

  

INSERT INTO Person  

(ID, Email, FirstName, MiddleName, LastName, Role, LastActivity, TotalActivity)   

VALUES   

(123456789, 'jdoe@psu.edu', 'John', 'Ryan', 'Doe', 'Student', TO_DATE('2003/05/03', 'yyyy/mm/dd'), 1001) ;  

 
 

CREATE TABLE Quiz (  

    ID NUMBER NOT NULL,  

    Title NVARCHAR2(50) NOT NULL,  

    Instructions NVARCHAR2(500) NOT NULL,  

    Points NUMBER NOT NULL,  

    DueDateTime DATE NOT NULL,  

    ShuffleAnswers NVARCHAR2(1) NOT NULL,  

    TimeLimitMinutes NUMBER NOT NULL,  

    OneQuestionPerScreen NVARCHAR2(1) NOT NULL,  

    PRIMARY KEY (ID)  

);   

  

INSERT INTO Quiz  

(ID, Title, Instructions, Points, DueDateTime, ShuffleAnswers, TimeLimitMinutes, OneQuestionPerScreen)   

VALUES  

(9876, 'IA02 - Strings, Numbers, Dates', 'Up to 48-hour penalized lateness. After that you will receive 0%.', 100, TO_DATE('2021/04/21 11:11:11', 'yyyy/mm/dd hh24:mi:ss'), 'Y', 100, 'Y');  

 

CREATE TABLE QUIZQUESTION(   

    ID NUMBER NOT NULL,    

    QUIZID NUMBER NOT NULL,   

    TEXT NVARCHAR2(60) NOT NULL,   

    PRIMARY KEY (ID),   

    FOREIGN KEY (QUIZID) REFERENCES Quiz(ID)  

);   

  

INSERT INTO QUIZQUESTION  

(ID, QUIZID, TEXT)    

VALUES(4561, 9876, 'What is the issue mentioned regarding Ease up updating?');   

  

INSERT INTO QUIZQUESTION  

(ID, QUIZID, TEXT)   

VALUES(4562, 9876, 'What is a DBMS?');  

  

CREATE TABLE "QuizAnswer"   

("ID" NUMBER NOT NULL ENABLE,   

"QUIZQUESTIONID" NUMBER NOT NULL ENABLE,   

"ORDER" NUMBER NOT NULL,    

"TEXT" NVARCHAR2(60) NOT NULL ENABLE,   

"CORRECT" NVARCHAR2(1),   

PRIMARY KEY ("ID") USING INDEX ENABLE ,   

FOREIGN KEY (QUIZQUESTIONID) REFERENCES QUIZQUESTION(ID)   

);  

  

INSERT INTO "QuizAnswer" VALUES(1234,4561,1,'more than one person','Y');  

INSERT INTO "QuizAnswer" VALUES(1235,4561,1,'Not enough disk space','N'); 

INSERT INTO "QuizAnswer" VALUES(1236,4562,2,'Database management system','Y');  

INSERT INTO "QuizAnswer" VALUES(1237,4562,2,'Database management system','Y');  

 

CREATE TABLE QuizSubmission(   

    ID NUMBER NOT NULL,   

    QuizID NUMBER NOT NULL,   

    PersonID NUMBER NOT NULL,   

    SubmissionDateAndTime DATE NOT NULL,   

    Grade NUMBER NOT NULL,   

    PRIMARY KEY (ID),   

    FOREIGN KEY (QuizID) REFERENCES Quiz(ID),   

    FOREIGN KEY (PersonID) REFERENCES Person(ID)   

);   

  

INSERT INTO QuizSubmission(ID, QuizID, PersonID, SubmissionDateAndTime, Grade)   

VALUES(101, 9876, 123456789, TO_DATE('2021/01/02 09:00:00', 'yyyy/mm/dd hh24:mi:ss'), 100 );  

 

CREATE TABLE QUIZANSWERSUBMISSION(   

ID NUMBER NOT NULL,   

QuizSubmissionID NUMBER NOT NULL,   

QuizAnswerID NUMBER NOT NULL,   

PRIMARY KEY (ID),   

FOREIGN KEY (QuizSubmissionID) REFERENCES QuizSubmission(ID),   

FOREIGN KEY (QuizAnswerID) REFERENCES "QuizAnswer"(ID)   

);  

INSERT INTO QUIZANSWERSUBMISSION(ID, QuizSubmissionID, QuizAnswerID)  

VALUES( 4561, 101, 1234); 

  

INSERT INTO QUIZANSWERSUBMISSION(ID, QuizSubmissionID, QuizAnswerID)   

VALUES(4562, 101, 1235);  

  

CREATE TABLE Assignment( 
 
    ID NUMBER NOT NULL,  
    Title NVARCHAR2(50) NOT NULL,   
    Instructions NVARCHAR2(100) NOT NULL,   
    Points NUMBER NOT NULL, 
    FileType NVARCHAR2(16) NOT NULL, 
    DueDateTime DATE NOT NULL,  
    PRIMARY KEY (ID) 

);  


INSERT INTO Assignment 
VALUES( 101, 'IA 05 - CRUD, APEX', 'Individual assignment#5 Warning ...', 100, 'txt', TO_DATE('2021/03/04 11:59:59', 'yyyy/mm/dd hh24:mi:ss'));  


CREATE TABLE AssignmentSubmission(  

    ID NUMBER NOT NULL,   
    AssignmentID NUMBER NOT NULL, 
    PersonID NUMBER NOT NULL,   
    SubmissionData NVARCHAR2(100) NOT NULL,   
    SubmissionDateTime DATE NOT NULL,   
    Grade NUMBER NOT NULL,  
    PRIMARY KEY (ID),   
    FOREIGN KEY (AssignmentID) REFERENCES Assignment(ID),   
    FOREIGN KEY (PersonID) REFERENCES Person(ID)  

);  

INSERT INTO AssignmentSubmission 
VALUES(012, 101, 123456789, 'Individual Assignment #5', TO_DATE('2021/03/02 11:30:15', 'yyyy/mm/dd hh24:mi:ss'),  98); 

