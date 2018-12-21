#find the most borrowed books
SELECT book_title FROM Book ORDER BY borrow_num DESC LIMIT 10;

Harry Potter
Fantasy World
Introduction to Data Science
Great Advanture
Practical Tools for Computer Science
Practical Tools for Data Science
Skills for Data Science
Learning Data Mining
Skills for Big Data Management
Living in the New World

#show all books (or Papers or Journals)
SELECT book_id, book_title FROM Book;

B001|Introduction to Marketing
B002|Introduction to Management Information System
B003|Introduction to Computer Science
B004|Introduction to Data Science
B005|Further Learing of Marketing
B006|Further Learing of Management Information System
B007|Further Learing of Computer Science
B008|Further Learing of Data Science
B009|Practical Tools for Marketing
B010|Practical Tools for Management Information System
B011|Practical Tools for Computer Science
B012|Practical Tools for Data Science
B013|Learning Database System
B014|Learning Data Mining
B015|Learning Business Intelligence
B016|Learning Telecommunications Management
B017|Learning Marketing Management
B018|Learning business with Data Mining
B019|Learning Digital Marketing
B020|Skills for Machine Learning
B021|Skills for Big Data Management
B022|Skills for Data Science
B023|Learning Big Data Analysis
B024|Learning Statistical Method
B025|Fantasy World
B026|Great Advanture
B027|Living in the New World
B028|Harry Potter

#show all department
SELECT dep_name FROM Department;

School of Business
School of Engineering

#show major by department
SELECT major_name FROM Major, Department WHERE Major.dep_id = Department.dep_id AND dep_name = 'School of Business';

Marketing
Management Information System

#show required course by major
SELECT course_name FROM Major, Major_has_Course, Course WHERE Major.major_id = Major_has_Course.major_id AND Major_has_Course.course_id = Course.course_id AND course_requirement = 'required' AND Major.major_id = 'M001';

Marketing Management
Data Mining Bus. Applications

#show required course by major
SELECT course_name FROM Major, Major_has_Course, Course WHERE Major.major_id = Major_has_Course.major_id AND Major_has_Course.course_id = Course.course_id AND course_requirement = 'selected' AND Major.major_id = 'M001';

Database Application Management
Business Intelligence
Digital Marketing




#search books by course
SELECT Book.book_id, Book.book_title FROM Book, CourseRecBook, Course WHERE Book.book_id = CourseRecBook.book_id AND CourseRecBook.course_id = Course.course_id AND Course.course_name = 'Database Application Management';

B002|Introduction to Management Information System
B004|Introduction to Data Science
B012|Practical Tools for Data Science
B013|Learning Database System

#search books by course and required
SELECT Book.book_id, Book.book_title FROM Book, CourseRecBook, Course WHERE Book.book_id = CourseRecBook.book_id AND CourseRecBook.course_id = Course.course_id AND Course.course_name = 'Database Application Management' AND book_requirement = 'required';

B013|Learning Database System
B002|Introduction to Management Information System

#search books by course and selected
SELECT Book.book_id, Book.book_title FROM Book, CourseRecBook, Course WHERE Book.book_id = CourseRecBook.book_id AND CourseRecBook.course_id = Course.course_id AND Course.course_name = 'Database Application Management' AND book_requirement = 'selected';

B004|Introduction to Data Science
B012|Practical Tools for Data Science

#show book detail
SELECT book_title, book_desc, book_edition, book_publisher, book_qoh, book_location FROM Book WHERE book_title = 'Introduction to Computer Science';

Introduction to Computer Science|Giving a general image of computer science to readers and some fundamental conception of this area|12th|WPI|4|1st floor area C2

#show book Author
SELECT Author_name FROM Book, Author, BookWritten WHERE Book.book_id = BookWritten.book_id AND BookWritten.author_id = Author.author_id AND book_title = 'Introduction to Computer Science';

FG
JF
WI



#search papers by course
SELECT Paper.paper_id, Paper.paper_title FROM Paper, CourseRecPaper, Course WHERE Paper.paper_id = CourseRecPaper.paper_id AND CourseRecPaper.course_id = Course.course_id AND Course.course_name = 'Database Application Management';

P001|Using special analysis for Database Application
P004|Using special analysis for Telecommunications Management

#search papers by course and required
SELECT Paper.paper_id, Paper.paper_title FROM Paper, CourseRecPaper, Course WHERE Paper.paper_id = CourseRecPaper.paper_id AND CourseRecPaper.course_id = Course.course_id AND Course.course_name = 'Database Application Management' AND paper_requirement = 'required';

P001|Using special analysis for Database Application

#search books by course and selected
SELECT Paper.paper_id, Paper.paper_title FROM Paper, CourseRecPaper, Course WHERE Paper.paper_id = CourseRecPaper.paper_id AND CourseRecPaper.course_id = Course.course_id AND Course.course_name = 'Database Application Management' AND paper_requirement = 'selected';

P004|Using special analysis for Telecommunications Management

#show paper detail
SELECT paper_title, paper_desc, paper_qoh, paper_location FROM Paper WHERE paper_title = 'Using special analysis for Database Application';

Using special analysis for Database Application|Giving an example about how to solve practical problem in database application|5|2nd floor area P1

#show paper Author
SELECT Author_name FROM Paper, Author, PaperWritten WHERE Paper.paper_id = PaperWritten.paper_id AND PaperWritten.author_id = Author.author_id AND paper_title = 'Using special analysis for Database Application';

AJ
HK

#show journal by paper
SELECT Journal.journal_id, journal_title FROM Journal, Paper WHERE Journal.journal_id = Paper.journal_id AND paper_title = 'Using special analysis for Database Application';

J002|Special Topic of Management Information System

#show journal detail 
SELECT journal_title, journal_desc, Journal_publish_date, journal_publisher, journal_qoh, journal_location FROM Journal WHERE journal_title = 'Special Topic of Management Information System';

Special Topic of Management Information System|A collection of papers about topics in Information System area|2014-05|ABC journal publish|5|1st floor area H5
