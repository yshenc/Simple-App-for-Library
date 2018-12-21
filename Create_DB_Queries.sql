PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Paper;
DROP TABLE IF EXISTS Journal;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Major;
DROP TABLE IF EXISTS Major_has_Course;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS CourseRecBook;
DROP TABLE IF EXISTS CourseRecPaper;
DROP TABLE IF EXISTS BookWritten;
DROP TABLE IF EXISTS PaperWritten;


CREATE TABLE Book (book_id VARCHAR[5] CONSTRAINT book_id_pk PRIMARY KEY, book_title VARCHAR[50] NOT NULL, book_desc VARCHAR[70], book_edition VARCHAR[10], book_publisher VARCHAR[25], book_qoh INTEGER, book_location VARCHAR[50], borrow_num INTEGER); 

CREATE TABLE Paper (paper_id VARCHAR[5] CONSTRAINT paper_id_pk PRIMARY KEY, paper_title VARCHAR[50] NOT NULL, paper_desc VARCHAR[70], paper_qoh INTEGER, paper_location VARCHAR[50], Journal_id INTEGER, CONSTRAINT Paper_journal_id_fk FOREIGN KEY(journal_id) REFERENCES Journal(journal_id) );  
 
CREATE TABLE Journal (journal_id VARCHAR[5] CONSTRAINT journal_id_pk PRIMARY KEY, journal_title VARCHAR[50] NOT NULL, journal_desc VARCHAR[70], journal_publish_date DATE, journal_publisher VARCHAR[25], journal_qoh INTEGER, journal_location VARCHAR[50]); 

CREATE TABLE Author ( author_id VARCHAR[5] CONSTRAINT journal_id_pk PRIMARY KEY, author_name VARCHAR[50] NOT NULL);

CREATE  TABLE Department ( dep_id VARCHAR[5] CONSTRAINT dep_id_pk PRIMARY KEY, dep_name VARCHAR[25] NOT NULL);

CREATE  TABLE Major ( major_id VARCHAR[5] CONSTRAINT major_id_pk PRIMARY KEY, major_name VARCHAR[25] NOT NULL, dep_id VARCHAR[5], CONSTRAINT Major_dep_id_fk FOREIGN KEY(dep_id) REFERENCES Department(dep_id) );

CREATE TABLE Course ( course_id VARCHAR[5] CONSTRAINT course_id_pk PRIMARY KEY, course_name VARCHAR[20]);

CREATE TABLE Major_has_Course (major_id VARCHAR[5], course_id VARCHAR[5], course_requirement VARCHAR[10],course_code VARCHAR[10],
 CONSTRAINT Major_has_Course_major_id_fk FOREIGN KEY(major_id) REFERENCES Major(major_id) ,
 CONSTRAINT Major_has_Course_course_id_fk FOREIGN KEY(course_id) REFERENCES Course(course_id), 
CONSTRAINT Major_has_Course_majorid_courseid_pk PRIMARY KEY(major_id, course_id));

CREATE TABLE CourseRecBook (course_id VARCHAR[5], book_id VARCHAR[5], book_requirement VARCHAR[10],
 CONSTRAINT CourseRecBook_course_id_fk FOREIGN KEY(course_id) REFERENCES Course(course_id) ,
 CONSTRAINT CourseRecBook_book_id_fk FOREIGN KEY(book_id) REFERENCES Book(book_id), 
CONSTRAINT CourseRecBook_courseid_bookid_pk PRIMARY KEY(course_id, book_id));


CREATE TABLE CourseRecPaper ( course_id VARCHAR[5], paper_id VARCHAR[5], paper_requirement VARCHAR[10],
 CONSTRAINT CourseRecPaper_course_id_fk FOREIGN KEY(course_id) REFERENCES Course(course_id) ,
 CONSTRAINT CourseRecPaper_paper_id_fk FOREIGN KEY(paper_id) REFERENCES Paper(paper_id), 
CONSTRAINT CourseRecPaper_courseid_paperid_pk PRIMARY KEY(course_id, paper_id));


CREATE TABLE BookWritten ( author_id VARCHAR[5], book_id VARCHAR[5],
CONSTRAINT BookWritten_author_id_fk FOREIGN KEY(author_id) REFERENCES Author(author_id),
CONSTRAINT BookWritten_book_id_fk FOREIGN KEY(book_id) REFERENCES book(book_id),
CONSTRAINT BookWritten_authorid_bookid_pk PRIMARY KEY(author_id, book_id));


CREATE TABLE PaperWritten ( author_id VARCHAR[5], paper_id VARCHAR[5],
CONSTRAINT PaperWritten_author_id_fk FOREIGN KEY(author_id) REFERENCES Author(author_id),
CONSTRAINT PaperWritten_paper_id_fk FOREIGN KEY(paper_id) REFERENCES Paper(paper_id),
CONSTRAINT PaperWritten_authorid_paperid_pk PRIMARY KEY(author_id, paper_id));


INSERT INTO Department VALUES ('D001', 'School of Business');
INSERT INTO Department VALUES ('D002', 'School of Engineering');


INSERT INTO Major VALUES ('M001', 'Marketing','D001');
INSERT INTO Major VALUES ('M002', 'Management Information System','D001');
INSERT INTO Major VALUES ('M003', 'Computer Science','D002');
INSERT INTO Major VALUES ('M004', 'Data Science','D002');


INSERT INTO Course VALUES ('C001','Database Application Management');
INSERT INTO Course VALUES ('C002','Knowledge in Database and Data Mining');
INSERT INTO Course VALUES ('C003','Business Intelligence');
INSERT INTO Course VALUES ('C004','Telecommunications Management');
INSERT INTO Course VALUES ('C005','Marketing Management');
INSERT INTO Course VALUES ('C006','Data Mining Bus. Applications');
INSERT INTO Course VALUES ('C007','Digital Marketing');
INSERT INTO Course VALUES ('C008','Machine Learning');
INSERT INTO Course VALUES ('C009','Big Data Manamgement');
INSERT INTO Course VALUES ('C010','Introduction to Data Science');
INSERT INTO Course VALUES ('C011','Big Data Analysis');
INSERT INTO Course VALUES ('C012','Statistical Method for Data Science');


INSERT INTO Major_has_Course VALUES ('M001', 'C005','required','MKT 500');
INSERT INTO Major_has_Course VALUES ('M001', 'C006','required','MKT 568');
INSERT INTO Major_has_Course VALUES ('M001', 'C007','selected','MKT 565');
INSERT INTO Major_has_Course VALUES ('M001', 'C001','selected','MIS 571');
INSERT INTO Major_has_Course VALUES ('M001', 'C003','selected','MIS 584');
INSERT INTO Major_has_Course VALUES ('M002', 'C001','required','MIS 571');
INSERT INTO Major_has_Course VALUES ('M002', 'C003','selected','MIS 584');
INSERT INTO Major_has_Course VALUES ('M002', 'C004','selected','MIS 578');
INSERT INTO Major_has_Course VALUES ('M002', 'C005','required','MIS 500');
INSERT INTO Major_has_Course VALUES ('M002', 'C007','selected','MIS 565');
INSERT INTO Major_has_Course VALUES ('M003', 'C002','required','CS 548');
INSERT INTO Major_has_Course VALUES ('M003', 'C008','required','CS 539');
INSERT INTO Major_has_Course VALUES ('M003', 'C009','selected','CS 585');
INSERT INTO Major_has_Course VALUES ('M003', 'C011','selected','DS 504');
INSERT INTO Major_has_Course VALUES ('M003', 'C001','selected','MIS 571');
INSERT INTO Major_has_Course VALUES ('M004', 'C010','required','DS 501');
INSERT INTO Major_has_Course VALUES ('M004', 'C011','selected','DS 504');
INSERT INTO Major_has_Course VALUES ('M004', 'C012','required','DS 502');
INSERT INTO Major_has_Course VALUES ('M004', 'C002','selected','DS 503');
INSERT INTO Major_has_Course VALUES ('M004', 'C008','selected','CS 539');
INSERT INTO Major_has_Course VALUES ('M004', 'C009','selected','DS 505');


INSERT INTO Book VALUES ('B001','Introduction to Marketing','Giving a general image of marketing to readers and some fundamental conception of this area','14th','WPI','3','1st floor area D5','13');
INSERT INTO Book VALUES ('B002','Introduction to Management Information System','Giving a general image of Management Information System to readers and some fundamental conception of this area','12th','WPI','5','2nd floor area H5','25');
INSERT INTO Book VALUES ('B003','Introduction to Computer Science','Giving a general image of computer science to readers and some fundamental conception of this area','12th','WPI','4','1st floor area C2','15');
INSERT INTO Book VALUES ('B004','Introduction to Data Science','Giving a general image of data science to readers and some fundamental conception of this area','10th','WPI','5','1st floor area E11','43');

INSERT INTO Book VALUES ('B005','Further Learing of Marketing','Focus on professional aspects of marketing area based on fundamental knowledge, such as difficult market patterns','14th','NGA book publish','7','2nd floor area E23','12');
INSERT INTO Book VALUES ('B006','Further Learing of Management Information System','Focus on professional aspects of Information based on fundamental knowledge','12th','NGA book publish','6','1st floor area A2','13');
INSERT INTO Book VALUES ('B007','Further Learing of Computer Science','Focus on professional aspects of computer science based on fundamental knowledge, knowing how to write complex code and computer stucture','10th','NGA book publish','6','2nd floor area A3','10');
INSERT INTO Book VALUES ('B008','Further Learing of Data Science','Focus on professional aspects of data science based on fundamental knowledge, such as data mining(need statistical background)','15th','NGA book publish','6','2nd floor area B5','7');

INSERT INTO Book VALUES ('B009','Practical Tools for Marketing','Introduce and teach readers how to use different tools to solve marketing problem','10th','XYZ book publish','7','2nd floor area F15','20');
INSERT INTO Book VALUES ('B010','Practical Tools for Management Information System','Introduce and teach readers how to use different tools to solve information system problem','14th','XYZ book publish','4','3rd floor area H17','13');
INSERT INTO Book VALUES ('B011','Practical Tools for Computer Science','Introduce and teach readers how to use different tools to solve computer science problem','12th','XYZ book publish','6','2nd floor area E6','40');
INSERT INTO Book VALUES ('B012','Practical Tools for Data Science','Introduce and teach readers how to use different tools to solve data science problem','12th','XYZ book publish','5','1st floor area B4','36');

INSERT INTO Book VALUES ('B013','Learning Database System','Teach readers how to apply database to application','11th','ABC book publish','10','1st floor area D6','15');
INSERT INTO Book VALUES ('B014','Learning Data Mining','Learning data mining skills, like clustering and classification','11th','ABC book publish','7','2nd floor area C13','32');
INSERT INTO Book VALUES ('B015','Learning Business Intelligence','Teaching important concept and skills in business intelligence area','14th','ABC book publish','6','3rd floor area H5','22');
INSERT INTO Book VALUES ('B016','Learning Telecommunications Management','General concepts of telecommunication and how to use it. ','16th','ABC book publish','9','1st floor area B10','17');

INSERT INTO Book VALUES ('B017','Learning Marketing Management','Skill for readers to improve their behavior in market','12th','DEF book publish','5','1st floor area E7','26');
INSERT INTO Book VALUES ('B018','Learning business with Data Mining','Apply data mining skills like clustering to business problem. ','14th','DEF book publish','10','3rd floor area A13','20');
INSERT INTO Book VALUES ('B019','Learning Digital Marketing','Focus on digital aspect of marketing','15th','DEF book publish','14','2nd floor area A17','21');
INSERT INTO Book VALUES ('B020','Skills for Machine Learning','Provide a deeper understanding of data, skills for readers to learn data pattern using computer','10th','DEF book publish','7','1st floor area F4','18');

INSERT INTO Book VALUES ('B021','Skills for Big Data Management','Apply different management skills for big data','17th','ZXC book publish','4','1st floor area F10','31');
INSERT INTO Book VALUES ('B022','Skills for Data Science','Introduction of several useful tools for data science problem','12th','ZXC book publish','8','3rd floor area C5','33');
INSERT INTO Book VALUES ('B023','Learning Big Data Analysis','Learning how to analysis data with hugh amount','11th','ZXC book publish','3','1st floor area H1','25');
INSERT INTO Book VALUES ('B024','Learning Statistical Method','learning statistical skills, used in data analysis and data mining','10th','ZXC book publish','2','2nd floor area B6','19');

INSERT INTO Book VALUES ('B025','Fantasy World','Describing a fantasy world in where lives many special creatures','2010','Novel publish','4','3rd floor area N5','78');
INSERT INTO Book VALUES ('B026','Great Advanture','Introduction of several useful tools for data science problem','2012','Novel publish','8','3rd floor area N4','69');
INSERT INTO Book VALUES ('B027','Living in the New World','Learning how to analysis data with hugh amount','2010','Novel publish','5','3rd floor area N1','27');
INSERT INTO Book VALUES ('B028','Harry Potter','learning statistical skills, used in data analysis and data mining','2001','Novel publish','7','3rd floor area N1','101');

INSERT INTO book VALUES ('B029','C++','Introduction to C++','2012','Computer publish','9','2nd floor area C19','105');
INSERT INTO book VALUES ('B030','Java','Introduction to Java','2013','Computer publish','7','2nd floor area C12','93');



INSERT INTO Journal VALUES ('J001','Special Topic of Marketing','A collection of papers about topics in marketing area','2016-09','ABC journal publish','10','1st floor area H4');
INSERT INTO Journal VALUES ('J002','Special Topic of Management Information System','A collection of papers about topics in Information System area','2014-05','ABC journal publish','5','1st floor area H5');
INSERT INTO Journal VALUES ('J003','Special Topic of Computer Science','A collection of papers about topics in computer science area','2016-02','ABC journal publish','7','1st floor area H4');
INSERT INTO Journal VALUES ('J004','Special Topic of Data Science','A collection of papers about topics in data science area','2017-06','ABC journal publish','7','1st floor area H3');

INSERT INTO Paper VALUES ('P001','Using special analysis for Database Application','Giving an example about how to solve practical problem in database application','5','2nd floor area P1','J002');
INSERT INTO Paper VALUES ('P002','Using special analysis for Data Mining','Giving an example about how to solve practical problem in data mining','4','2nd floor area P2','J003');
INSERT INTO Paper VALUES ('P003','Using special analysis for Business Intelligence','Giving an example about how to solve practical problem in business intelligence','2','2nd floor area P1','J002');
INSERT INTO Paper VALUES ('P004','Using special analysis for Telecommunications Management','Giving an example about how to solve practical problem in telecommunications management','5','2nd floor area P3','J002');
INSERT INTO Paper VALUES ('P005','Using special analysis for Marketing Management','Giving an example about how to solve practical problem in marketing management','3','2nd floor area P1','J001');
INSERT INTO Paper VALUES ('P006','Using special analysis for Data Mining Bus. Applications','Giving an example about how to solve practical problem in business applications','4','2nd floor area P2','J001');
INSERT INTO Paper VALUES ('P007','Using special analysis for Digital Marketing','Giving an example about how to solve practical problem in digital marketing','3','2nd floor area P4','J001');
INSERT INTO Paper VALUES ('P008','Using special analysis for Machine Learning','Giving an example about how to solve practical problem in machine learning','4','2nd floor area P2','J003');
INSERT INTO Paper VALUES ('P009','Using special analysis for Big Data Manamgement','Giving an example about how to solve practical problem in big data manamgement','5','2nd floor area P3','J003');
INSERT INTO Paper VALUES ('P010','Using special analysis for Data Science','Giving an example about how to solve practical problem in data science','6','2nd floor area P4','J004');
INSERT INTO Paper VALUES ('P011','Using special analysis for Big Data Analysis','Giving an example about how to solve practical problem in big data analysis','2','2nd floor area P2','J004');
INSERT INTO Paper VALUES ('P012','Using special analysis for Statistics','Giving an example about how to solve practical problem in statistics','4','2nd floor area P2','J004');


INSERT INTO CourseRecBook VALUES ('C001','B013','required');
INSERT INTO CourseRecBook VALUES ('C001','B002','required');
INSERT INTO CourseRecBook VALUES ('C001','B004','selected');
INSERT INTO CourseRecBook VALUES ('C001','B012','selected');
INSERT INTO CourseRecBook VALUES ('C002','B014','required');
INSERT INTO CourseRecBook VALUES ('C002','B003','required');
INSERT INTO CourseRecBook VALUES ('C002','B010','selected');
INSERT INTO CourseRecBook VALUES ('C002','B002','selected');
INSERT INTO CourseRecBook VALUES ('C003','B015','required');
INSERT INTO CourseRecBook VALUES ('C003','B006','required');
INSERT INTO CourseRecBook VALUES ('C003','B005','selected');
INSERT INTO CourseRecBook VALUES ('C003','B003','selected');
INSERT INTO CourseRecBook VALUES ('C004','B016','required');
INSERT INTO CourseRecBook VALUES ('C004','B010','required');
INSERT INTO CourseRecBook VALUES ('C004','B017','selected');
INSERT INTO CourseRecBook VALUES ('C004','B013','selected');
INSERT INTO CourseRecBook VALUES ('C005','B017','required');
INSERT INTO CourseRecBook VALUES ('C005','B005','required');
INSERT INTO CourseRecBook VALUES ('C005','B020','selected');
INSERT INTO CourseRecBook VALUES ('C005','B002','selected');
INSERT INTO CourseRecBook VALUES ('C006','B018','required');
INSERT INTO CourseRecBook VALUES ('C006','B001','required');
INSERT INTO CourseRecBook VALUES ('C006','B005','selected');
INSERT INTO CourseRecBook VALUES ('C006','B007','selected');
INSERT INTO CourseRecBook VALUES ('C007','B019','required');
INSERT INTO CourseRecBook VALUES ('C007','B009','required');
INSERT INTO CourseRecBook VALUES ('C007','B024','selected');
INSERT INTO CourseRecBook VALUES ('C007','B022','selected');
INSERT INTO CourseRecBook VALUES ('C008','B020','required');
INSERT INTO CourseRecBook VALUES ('C008','B007','required');
INSERT INTO CourseRecBook VALUES ('C008','B013','selected');
INSERT INTO CourseRecBook VALUES ('C008','B009','selected');
INSERT INTO CourseRecBook VALUES ('C009','B021','required');
INSERT INTO CourseRecBook VALUES ('C009','B011','required');
INSERT INTO CourseRecBook VALUES ('C009','B008','selected');
INSERT INTO CourseRecBook VALUES ('C009','B022','selected');
INSERT INTO CourseRecBook VALUES ('C010','B022','required');
INSERT INTO CourseRecBook VALUES ('C010','B004','required');
INSERT INTO CourseRecBook VALUES ('C010','B006','selected');
INSERT INTO CourseRecBook VALUES ('C010','B014','selected');
INSERT INTO CourseRecBook VALUES ('C011','B023','required');
INSERT INTO CourseRecBook VALUES ('C011','B008','required');
INSERT INTO CourseRecBook VALUES ('C011','B010','selected');
INSERT INTO CourseRecBook VALUES ('C011','B004','selected');
INSERT INTO CourseRecBook VALUES ('C012','B024','required');
INSERT INTO CourseRecBook VALUES ('C012','B012','required');
INSERT INTO CourseRecBook VALUES ('C012','B005','selected');
INSERT INTO CourseRecBook VALUES ('C012','B018','selected');


INSERT INTO CourseRecPaper VALUES ('C001','P001','required');
INSERT INTO CourseRecPaper VALUES ('C002','P002','required');
INSERT INTO CourseRecPaper VALUES ('C003','P003','required');
INSERT INTO CourseRecPaper VALUES ('C004','P004','required');
INSERT INTO CourseRecPaper VALUES ('C005','P005','required');
INSERT INTO CourseRecPaper VALUES ('C006','P006','required');
INSERT INTO CourseRecPaper VALUES ('C007','P007','required');
INSERT INTO CourseRecPaper VALUES ('C008','P008','required');
INSERT INTO CourseRecPaper VALUES ('C009','P009','required');
INSERT INTO CourseRecPaper VALUES ('C010','P010','required');
INSERT INTO CourseRecPaper VALUES ('C011','P011','required');
INSERT INTO CourseRecPaper VALUES ('C012','P012','required');
INSERT INTO CourseRecPaper VALUES ('C001','P004','selected');
INSERT INTO CourseRecPaper VALUES ('C002','P003','selected');
INSERT INTO CourseRecPaper VALUES ('C003','P002','selected');
INSERT INTO CourseRecPaper VALUES ('C004','P001','selected');
INSERT INTO CourseRecPaper VALUES ('C005','P009','selected');
INSERT INTO CourseRecPaper VALUES ('C006','P010','selected');
INSERT INTO CourseRecPaper VALUES ('C007','P011','selected');
INSERT INTO CourseRecPaper VALUES ('C008','P012','selected');
INSERT INTO CourseRecPaper VALUES ('C009','P005','selected');
INSERT INTO CourseRecPaper VALUES ('C010','P006','selected');
INSERT INTO CourseRecPaper VALUES ('C011','P007','selected');
INSERT INTO CourseRecPaper VALUES ('C012','P008','selected');


INSERT INTO Author VALUES ('A001','AJ');
INSERT INTO Author VALUES ('A002','HK');
INSERT INTO Author VALUES ('A003','VB');
INSERT INTO Author VALUES ('A004','FG');
INSERT INTO Author VALUES ('A005','JF');
INSERT INTO Author VALUES ('A006','WI');
INSERT INTO Author VALUES ('A007','QF');
INSERT INTO Author VALUES ('A008','EF');
INSERT INTO Author VALUES ('A009','BHT');
INSERT INTO Author VALUES ('A010','VDFB');
INSERT INTO Author VALUES ('A011','GE');
INSERT INTO Author VALUES ('A012','VBRE');
INSERT INTO Author VALUES ('A013','QR');
INSERT INTO Author VALUES ('A014','HTHY');
INSERT INTO Author VALUES ('A015','WVBT');
INSERT INTO Author VALUES ('A016','FTRB');
INSERT INTO Author VALUES ('A017','RF');
INSERT INTO Author VALUES ('A018','FRB');
INSERT INTO Author VALUES ('A019','EF');
INSERT INTO Author VALUES ('A020','FERV');
INSERT INTO Author VALUES ('A021','KMLG');
INSERT INTO Author VALUES ('A022','DFN');
INSERT INTO Author VALUES ('A023','ORK');
INSERT INTO Author VALUES ('A024','WOIQ');
INSERT INTO Author VALUES ('A025','FREN');
INSERT INTO Author VALUES ('A026','VTJH');
INSERT INTO Author VALUES ('A027','VHUEHJ');
INSERT INTO Author VALUES ('A028','IHREU');
INSERT INTO Author VALUES ('A029','FREB');
INSERT INTO Author VALUES ('A030','VEB');
INSERT INTO Author VALUES ('A031','SDF');
INSERT INTO Author VALUES ('A032','VBFR');
INSERT INTO Author VALUES ('A033','VDU');
INSERT INTO Author VALUES ('A034','MDEI');


INSERT INTO PaperWritten VALUES ('A001','P001');
INSERT INTO PaperWritten VALUES ('A002','P001');
INSERT INTO PaperWritten VALUES ('A003','P002');
INSERT INTO PaperWritten VALUES ('A004','P003');
INSERT INTO PaperWritten VALUES ('A005','P003');
INSERT INTO PaperWritten VALUES ('A006','P003');
INSERT INTO PaperWritten VALUES ('A007','P004');
INSERT INTO PaperWritten VALUES ('A008','P005');
INSERT INTO PaperWritten VALUES ('A009','P005');
INSERT INTO PaperWritten VALUES ('A010','P006');
INSERT INTO PaperWritten VALUES ('A011','P007');
INSERT INTO PaperWritten VALUES ('A012','P007');
INSERT INTO PaperWritten VALUES ('A013','P007');
INSERT INTO PaperWritten VALUES ('A014','P008');
INSERT INTO PaperWritten VALUES ('A015','P009');
INSERT INTO PaperWritten VALUES ('A016','P009');
INSERT INTO PaperWritten VALUES ('A017','P010');
INSERT INTO PaperWritten VALUES ('A018','P011');
INSERT INTO PaperWritten VALUES ('A019','P012');
INSERT INTO PaperWritten VALUES ('A020','P012');


INSERT INTO BookWritten VALUES ('A001','B001');
INSERT INTO BookWritten VALUES ('A002','B001');
INSERT INTO BookWritten VALUES ('A003','B002');
INSERT INTO BookWritten VALUES ('A004','B003');
INSERT INTO BookWritten VALUES ('A005','B003');
INSERT INTO BookWritten VALUES ('A006','B003');
INSERT INTO BookWritten VALUES ('A007','B004');
INSERT INTO BookWritten VALUES ('A008','B005');
INSERT INTO BookWritten VALUES ('A009','B005');
INSERT INTO BookWritten VALUES ('A010','B006');
INSERT INTO BookWritten VALUES ('A011','B007');
INSERT INTO BookWritten VALUES ('A012','B007');
INSERT INTO BookWritten VALUES ('A013','B007');
INSERT INTO BookWritten VALUES ('A014','B008');
INSERT INTO BookWritten VALUES ('A015','B009');
INSERT INTO BookWritten VALUES ('A016','B009');
INSERT INTO BookWritten VALUES ('A017','B010');
INSERT INTO BookWritten VALUES ('A018','B011');
INSERT INTO BookWritten VALUES ('A019','B012');
INSERT INTO BookWritten VALUES ('A020','B012');
INSERT INTO BookWritten VALUES ('A021','B013');
INSERT INTO BookWritten VALUES ('A022','B014');
INSERT INTO BookWritten VALUES ('A023','B014');
INSERT INTO BookWritten VALUES ('A024','B015');
INSERT INTO BookWritten VALUES ('A025','B016');
INSERT INTO BookWritten VALUES ('A026','B017');
INSERT INTO BookWritten VALUES ('A027','B017');
INSERT INTO BookWritten VALUES ('A028','B018');
INSERT INTO BookWritten VALUES ('A029','B018');
INSERT INTO BookWritten VALUES ('A030','B019');
INSERT INTO BookWritten VALUES ('A015','B020');
INSERT INTO BookWritten VALUES ('A004','B020');
INSERT INTO BookWritten VALUES ('A002','B020');
INSERT INTO BookWritten VALUES ('A026','B021');
INSERT INTO BookWritten VALUES ('A022','B022');
INSERT INTO BookWritten VALUES ('A002','B023');
INSERT INTO BookWritten VALUES ('A005','B024');
INSERT INTO BookWritten VALUES ('A014','B024');
INSERT INTO BookWritten VALUES ('A017','B024');
INSERT INTO BookWritten VALUES ('A031','B025');
INSERT INTO BookWritten VALUES ('A032','B026');
INSERT INTO BookWritten VALUES ('A033','B027');
INSERT INTO BookWritten VALUES ('A034','B028');
