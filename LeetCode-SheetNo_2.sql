/* Calculate special Bonus
Write a solution to calculate the bonus of each employee. The bonus of an employee is 100% of their salary
if the ID of the employee is an odd number and the employee's name does not start with the character 'M'. The bonus of an employee is 0 otherwise.

Return the result table ordered by employee_id.

The result format is in the following example.

Example 1:
Input: 
Employees table:
+-------------+---------+--------+
| employee_id | name    | salary |
+-------------+---------+--------+
| 2           | Meir    | 3000   |
| 3           | Michael | 3800   |
| 7           | Addilyn | 7400   |
| 8           | Juan    | 6100   |
| 9           | Kannon  | 7700   |
+-------------+---------+--------+
Output: 
+-------------+-------+
| employee_id | bonus |
+-------------+-------+
| 2           | 0     |
| 3           | 0     |
| 7           | 7400  |
| 8           | 0     |
| 9           | 7700  |
+-------------+-------+
Explanation: 
The employees with IDs 2 and 8 get 0 bonus because they have an even employee_id.
The employee with ID 3 gets 0 bonus because their name starts with 'M'.
The rest of the employees get a 100% bonus. */

select employee_id,
CASE
    WHEN mod(employee_id,2) != 0 and name not like 'M%'
    THEN Salary
    ELSE 0
    END
    as bonus
from Employees ORDER by employee_id asc;

/*3220. Odd and even transactions (Medium)
Write a solution to find the sum of amounts for odd and even transactions for each day. If there are no odd or even transactions for a specific date, display as 0.

Return the result table ordered by transaction_date in ascending order.

The result format is in the following example.

Example:

Input:

transactions table:

+----------------+--------+------------------+
| transaction_id | amount | transaction_date |
+----------------+--------+------------------+
| 1              | 150    | 2024-07-01       |
| 2              | 200    | 2024-07-01       |
| 3              | 75     | 2024-07-01       |
| 4              | 300    | 2024-07-02       |
| 5              | 50     | 2024-07-02       |
| 6              | 120    | 2024-07-03       |
+----------------+--------+------------------+
  
Output:

+------------------+---------+----------+
| transaction_date | odd_sum | even_sum |
+------------------+---------+----------+
| 2024-07-01       | 75      | 350      |
| 2024-07-02       | 0       | 350      |
| 2024-07-03       | 0       | 120      |
+------------------+---------+----------+
  
Explanation:

For transaction dates:
2024-07-01:
Sum of amounts for odd transactions: 75
Sum of amounts for even transactions: 150 + 200 = 350
2024-07-02:
Sum of amounts for odd transactions: 0
Sum of amounts for even transactions: 300 + 50 = 350
2024-07-03:
Sum of amounts for odd transactions: 0
Sum of amounts for even transactions: 120
Note: The output table is ordered by transaction_date in ascending order.*/

select TO_CHAR(transaction_date) as transaction_date,
sum(case WHEN mod(amount,2) = 1 then amount else 0 end) as odd_sum,
sum(case WHEN mod(amount,2) = 0 then amount else o end) as even_sum
from transactions
group by transaction_date
order by transaction_date;