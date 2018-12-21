package group4.wpilibrary.constant;

/**
 * Created by User on 12/2/2017.
 */

public abstract class SQLCommand
        {
        //query all students
        public static String QUERY_BOOK = "SELECT book_id as _id, book_title FROM Book;";
            public static String QUERY_DEPT = "SELECT dep_name FROM Department;";
            public static String QUERY_PAPER = "SELECT paper_id as _id, paper_title FROM Paper";
            public static String QUERY_JOURNAL = "SELECT journal_id as _id, journal_title FROM Journal";
            public static String QUEARY_MostBorrowed = "SELECT book_title, borrow_num FROM Book ORDER BY borrow_num DESC LIMIT 5";
            public static String QUERY_BookDetails = "Select * from book where book_id = ?";
            public static String QUERY_PaperDetails = "Select * from paper where paper_id = ?";
            public static String Query_PapersByJournals = "Select paper_id as _id, paper_title from paper where Journal_id = ";

            public static String Query_CourseITreq = "SELECT Course.course_id as _id, course_name FROM Major, Major_has_Course, Course WHERE Major.major_id = Major_has_Course.major_id AND Major_has_Course.course_id = Course.course_id AND course_requirement = 'required' AND Major.major_id = 'M002'";
            public static String Query_CourseITelec = "SELECT Course.course_id as _id, course_name FROM Major, Major_has_Course, Course WHERE Major.major_id = Major_has_Course.major_id AND Major_has_Course.course_id = Course.course_id AND course_requirement = 'selected' AND Major.major_id = 'M002'";
            public static String Query_CourseMAIreq = "SELECT Course.course_id as _id, course_name FROM Major, Major_has_Course, Course WHERE Major.major_id = Major_has_Course.major_id AND Major_has_Course.course_id = Course.course_id AND course_requirement = 'required' AND Major.major_id = 'M001'";
            public static String Query_CourseMAIelec = "SELECT Course.course_id as _id, course_name FROM Major, Major_has_Course, Course WHERE Major.major_id = Major_has_Course.major_id AND Major_has_Course.course_id = Course.course_id AND course_requirement = 'selected' AND Major.major_id = 'M001'";
            public static String Query_CourseCSreq = "SELECT Course.course_id as _id, course_name FROM Major, Major_has_Course, Course WHERE Major.major_id = Major_has_Course.major_id AND Major_has_Course.course_id = Course.course_id AND course_requirement = 'required' AND Major.major_id = 'M003'";
            public static String Query_CourseCSelec = "SELECT Course.course_id as _id, course_name FROM Major, Major_has_Course, Course WHERE Major.major_id = Major_has_Course.major_id AND Major_has_Course.course_id = Course.course_id AND course_requirement = 'selected' AND Major.major_id = 'M003'";
            public static String Query_CourseROBreq = "SELECT Course.course_id as _id, course_name FROM Major, Major_has_Course, Course WHERE Major.major_id = Major_has_Course.major_id AND Major_has_Course.course_id = Course.course_id AND course_requirement = 'required' AND Major.major_id = 'M004'";
            public static String Query_CourseROBelec = "SELECT Course.course_id as _id, course_name FROM Major, Major_has_Course, Course WHERE Major.major_id = Major_has_Course.major_id AND Major_has_Course.course_id = Course.course_id AND course_requirement = 'selected' AND Major.major_id = 'M004'";

            public static String Query_BookReq ="SELECT Book.book_id as _id, Book.book_title FROM Book, CourseRecBook, Course WHERE Book.book_id = CourseRecBook.book_id AND CourseRecBook.course_id = Course.course_id AND book_requirement = 'required' AND Course.course_id = ";
            public static String Query_BookElec ="SELECT Book.book_id as _id, Book.book_title FROM Book, CourseRecBook, Course WHERE Book.book_id = CourseRecBook.book_id AND CourseRecBook.course_id = Course.course_id AND book_requirement = 'selected' AND Course.course_id = ";

            public static String Query_PaperReq ="SELECT Paper.paper_id as _id, Paper.paper_title FROM Paper, CourseRecPaper, Course WHERE Paper.paper_id = CourseRecPaper.paper_id AND CourseRecPaper.course_id = Course.course_id  AND paper_requirement = 'required' AND Course.course_id = ";
            public static String Query_PaperElec ="SELECT Paper.paper_id as _id, Paper.paper_title FROM Paper, CourseRecPaper, Course WHERE Paper.paper_id = CourseRecPaper.paper_id AND CourseRecPaper.course_id = Course.course_id  AND paper_requirement = 'selected' AND Course.course_id = ";




        }
