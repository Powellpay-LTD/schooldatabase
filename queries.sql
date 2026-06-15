
//SELECT Query
    student_no,
    first_name,
    last_name,
    gender,
    date_of_birth,
    class_name,
    enrollment_date,
    status,
    ClassID
FROM student;


//filtered  WHERE Query
SELECT 
    student_no,
    first_name,
    last_name,
    class_name,
    status
FROM student
WHERE status = 'Active';


//GROUP BY Query 
SELECT payment_method, COUNT(*) as transaction_count, SUM(amount_paid) as total_collected 
FROM payment 
GROUP BY payment_method;


//JOIN Query
SELECT 
    s.student_no,
    s.first_name,
    s.last_name,
    s.class_name,
    c.ClassName,
    c.Stream,
    c.Level
FROM student s
JOIN class c
    ON s.ClassID = c.ClassID;




