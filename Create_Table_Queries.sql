PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Paper;
DROP TABLE IF EXISTS Journal;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Major;
DROP TABLE IF EXISTS Major_has_Course;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS CourseRecBooks;
DROP TABLE IF EXISTS CourseRecPapers;
DROP TABLE IF EXISTS BookWritten;
DROP TABLE IF EXISTS PaperWritten;



CREATE TABLE Book (book_id integer CONSTRAINT book_id_pk PRIMARY KEY, book_title VARCHAR[50] NOT NULL, book_desc VARCHAR[70], book_edition VARCHAR[10], book_publisher VARCHAR[25], book_qoh INTEGER, book_location VARCHAR[50], book_requirement VARCHAR[10], borrow_num INTEGER); 

CREATE TABLE Paper (paper_id integer CONSTRAINT paper_id_pk PRIMARY KEY, paper_title VARCHAR[50] NOT NULL, paper_author VARCHAR[70] NOT NULL, paper_desc VARCHAR[70],  paper_publisher VARCHAR[25], paper_qoh INTEGER, paper_location VARCHAR[50], Journal_id INTEGER, CONSTRAINT Paper_journal_id_fk FOREIGN KEY(journal_id) REFERENCES Journal(journal_id) );  
 
CREATE TABLE Journal (journal_id integer CONSTRAINT journal_id_pk PRIMARY KEY, journal_title VARCHAR[50] NOT NULL, journal_desc VARCHAR[70], journal_publish_date DATE, journal_publisher VARCHAR[25], journal_qoh INTEGER, journal_location VARCHAR[50]); 

CREATE TABLE Author ( author_id integer CONSTRAINT journal_id_pk PRIMARY KEY, author_name VARCHAR[50] NOT NULL);

CREATE  TABLE Department ( dep_id integer CONSTRAINT dep_id_pk PRIMARY KEY, dep_name VARCHAR[25] NOT NULL);

CREATE  TABLE Major ( major_id integer CONSTRAINT major_id_pk PRIMARY KEY, major_name VARCHAR[25] NOT NULL);

CREATE TABLE Course ( dep_id integer, course_id integer CONSTRAINT course_id_pk PRIMARY KEY, course_name VARCHAR[20], CONSTRAINT Degree_dep_id_fk FOREIGN KEY(dep_id) REFERENCES Department(dep_id));

CREATE TABLE Major_has_course (major_id integer, course_id integer, course_requirement VARCHAR[10],
 CONSTRAINT Major_has_Course_major_id_fk FOREIGN KEY(major_id) REFERENCES Major(major_id) ,
 CONSTRAINT Major_has_Course_course_id_fk FOREIGN KEY(course_id) REFERENCES Course(Course_id), 
CONSTRAINT Major_has_Course_majorid_courseid_pk PRIMARY KEY(major_id, course_id));

CREATE TABLE CourseRecBooks (course_id integer, book_id integer, 
 CONSTRAINT CourseRecBooks_course_id_fk FOREIGN KEY(course_id) REFERENCES Course(course_id) ,
 CONSTRAINT CourseRecBooks_book_id_fk FOREIGN KEY(book_id) REFERENCES Book(book_id), 
CONSTRAINT CourseRecBooks_courseid_bookid_pk PRIMARY KEY(course_id, book_id));


CREATE TABLE CourseRecPapers ( course_id integer, paper_id integer, 
 CONSTRAINT CourseRecPapers_course_id_fk FOREIGN KEY(course_id) REFERENCES Course(course_id) ,
 CONSTRAINT CourseRecPapers_paper_id_fk FOREIGN KEY(paper_id) REFERENCES Paper(paper_id), 
CONSTRAINT CourseRecPapers_courseid_paperid_pk PRIMARY KEY(course_id, paper_id));


CREATE TABLE BookWritten ( author_id integer, book_id integer,
CONSTRAINT BookWritten_author_id_fk FOREIGN KEY(author_id) REFERENCES Author(author_id),
CONSTRAINT BookWritten_book_id_fk FOREIGN KEY(book_id) REFERENCES book(book_id),
CONSTRAINT BookWritten_authorid_bookid_pk PRIMARY KEY(author_id, book_id));


CREATE TABLE PaperWritten ( author_id integer, paper_id integer,
CONSTRAINT PaperWritten_author_id_fk FOREIGN KEY(author_id) REFERENCES Author(author_id),
CONSTRAINT PaperWritten_paper_id_fk FOREIGN KEY(paper_id) REFERENCES Paper(paper_id),
CONSTRAINT PaperWritten_authorid_paperid_pk PRIMARY KEY(author_id, paper_id));
