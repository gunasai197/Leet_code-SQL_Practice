/* 182. Duplicate emails */ /* https://leetcode.com/problems/duplicate-emails/ */
/* Table: Courses
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+
(student, class) is the primary key (combination of columns with unique values) for this table.
Each row of this table indicates the name of a student and the class in which they are enrolled. */

/* Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL. */
/* Return the result table in any order. */

Select email from person group by email having count(email) > 1;

/* 596. Classes more than 5 Students */ /* https://leetcode.com/problems/classes-more-than-5-students/description/ */
/* Table: Courses

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+
(student, class) is the primary key (combination of columns with unique values) for this table.
Each row of this table indicates the name of a student and the class in which they are enrolled.
 

Write a solution to find all the classes that have at least five students.

Return the result table in any order. */

select class from Courses group by class having count(class) >= 5;

/*584. Find Customer Referee
Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
In SQL, id is the primary key column for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.

Find the names of the customer that are not referred by the customer with id = 2.
Return the result table in any order.*/
select name from customer where referred_id is NULL or referred_id not in 2;

