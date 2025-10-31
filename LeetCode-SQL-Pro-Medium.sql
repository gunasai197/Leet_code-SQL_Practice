/*3475. DNA Pattern Recognition
Table: Samples
+----------------+---------+
| Column Name    | Type    | 
+----------------+---------+
| sample_id      | int     |
| dna_sequence   | varchar |
| species        | varchar |
+----------------+---------+
sample_id is the unique key for this table.
Each row contains a DNA sequence represented as a string of characters (A, T, G, C) and the species it was collected from.
Biologists are studying basic patterns in DNA sequences. Write a solution to identify sample_id with the following patterns:

Sequences that start with ATG (a common start codon)
Sequences that end with either TAA, TAG, or TGA (stop codons)
Sequences containing the motif ATAT (a simple repeated pattern)
Sequences that have at least 3 consecutive G (like GGG or GGGG)
Return the result table ordered by sample_id in ascending order.

The result format is in the following example.

Example:

Input:

Samples table:

+-----------+------------------+-----------+
| sample_id | dna_sequence     | species   |
+-----------+------------------+-----------+
| 1         | ATGCTAGCTAGCTAA  | Human     |
| 2         | GGGTCAATCATC     | Human     |
| 3         | ATATATCGTAGCTA   | Human     |
| 4         | ATGGGGTCATCATAA  | Mouse     |
| 5         | TCAGTCAGTCAG     | Mouse     |
| 6         | ATATCGCGCTAG     | Zebrafish |
| 7         | CGTATGCGTCGTA    | Zebrafish |
+-----------+------------------+-----------+
Output:

+-----------+------------------+-------------+-------------+------------+------------+------------+
| sample_id | dna_sequence     | species     | has_start   | has_stop   | has_atat   | has_ggg    |
+-----------+------------------+-------------+-------------+------------+------------+------------+
| 1         | ATGCTAGCTAGCTAA  | Human       | 1           | 1          | 0          | 0          |
| 2         | GGGTCAATCATC     | Human       | 0           | 0          | 0          | 1          |
| 3         | ATATATCGTAGCTA   | Human       | 0           | 0          | 1          | 0          |
| 4         | ATGGGGTCATCATAA  | Mouse       | 1           | 1          | 0          | 1          |
| 5         | TCAGTCAGTCAG     | Mouse       | 0           | 0          | 0          | 0          |
| 6         | ATATCGCGCTAG     | Zebrafish   | 0           | 1          | 1          | 0          |
| 7         | CGTATGCGTCGTA    | Zebrafish   | 0           | 0          | 0          | 0          |
+-----------+------------------+-------------+-------------+------------+------------+------------+
Explanation:

Sample 1 (ATGCTAGCTAGCTAA):
Starts with ATG (has_start = 1)
Ends with TAA (has_stop = 1)
Does not contain ATAT (has_atat = 0)
Does not contain at least 3 consecutive 'G's (has_ggg = 0)
Sample 2 (GGGTCAATCATC):
Does not start with ATG (has_start = 0)
Does not end with TAA, TAG, or TGA (has_stop = 0)
Does not contain ATAT (has_atat = 0)
Contains GGG (has_ggg = 1)
Sample 3 (ATATATCGTAGCTA):
Does not start with ATG (has_start = 0)
Does not end with TAA, TAG, or TGA (has_stop = 0)
Contains ATAT (has_atat = 1)
Does not contain at least 3 consecutive 'G's (has_ggg = 0)
Sample 4 (ATGGGGTCATCATAA):
Starts with ATG (has_start = 1)
Ends with TAA (has_stop = 1)
Does not contain ATAT (has_atat = 0)
Contains GGGG (has_ggg = 1)
Sample 5 (TCAGTCAGTCAG):
Does not match any patterns (all fields = 0)
Sample 6 (ATATCGCGCTAG):
Does not start with ATG (has_start = 0)
Ends with TAG (has_stop = 1)
Starts with ATAT (has_atat = 1)
Does not contain at least 3 consecutive 'G's (has_ggg = 0)
Sample 7 (CGTATGCGTCGTA):
Does not start with ATG (has_start = 0)
Does not end with TAA, "TAG", or "TGA" (has_stop = 0)
Does not contain ATAT (has_atat = 0)
Does not contain at least 3 consecutive 'G's (has_ggg = 0)
Note:
The result is ordered by sample_id in ascending order
For each pattern, 1 indicates the pattern is present and 0 indicates it is not present*/
select sample_id,dna_sequence,species,
(case when dna_sequence like 'ATG%' then 1 else 0 end) as has_start,
(case when dna_sequence like '%TAA' or dna_sequence like '%TAG' or dna_sequence like '%TGA' then 1 else 0  end) as has_stop,
(case when dna_sequence like '%ATAT%' then 1 else 0 end) as has_atat,
(case when dna_sequence like '%GGG%' or dna_sequence like '%GGGG%' then 1 else 0 end) as has_ggg
from samples order by sample_id;

/*1393. capital Gain/Loss
Table: Stocks

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| stock_name    | varchar |
| operation     | enum    |
| operation_day | int     |
| price         | int     |
+---------------+---------+
(stock_name, operation_day) is the primary key (combination of columns with unique values) for this table.
The operation column is an ENUM (category) of type ('Sell', 'Buy')
Each row of this table indicates that the stock which has stock_name had an operation on the day operation_day with the price.
It is guaranteed that each 'Sell' operation for a stock has a corresponding 'Buy' operation in a previous day. It is also guaranteed that each 'Buy' operation for a stock has a corresponding 'Sell' operation in an upcoming day.
Write a solution to report the Capital gain/loss for each stock.

The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock one or many times.

Return the result table in any order.

The result format is in the following example.

Example 1:

Input: 
Stocks table:
+---------------+-----------+---------------+--------+
| stock_name    | operation | operation_day | price  |
+---------------+-----------+---------------+--------+
| Leetcode      | Buy       | 1             | 1000   |
| Corona Masks  | Buy       | 2             | 10     |
| Leetcode      | Sell      | 5             | 9000   |
| Handbags      | Buy       | 17            | 30000  |
| Corona Masks  | Sell      | 3             | 1010   |
| Corona Masks  | Buy       | 4             | 1000   |
| Corona Masks  | Sell      | 5             | 500    |
| Corona Masks  | Buy       | 6             | 1000   |
| Handbags      | Sell      | 29            | 7000   |
| Corona Masks  | Sell      | 10            | 10000  |
+---------------+-----------+---------------+--------+
Output: 
+---------------+-------------------+
| stock_name    | capital_gain_loss |
+---------------+-------------------+
| Corona Masks  | 9500              |
| Leetcode      | 8000              |
| Handbags      | -23000            |
+---------------+-------------------+
Explanation: 
Leetcode stock was bought at day 1 for 1000$ and was sold at day 5 for 9000$. Capital gain = 9000 - 1000 = 8000$.
Handbags stock was bought at day 17 for 30000$ and was sold at day 29 for 7000$. Capital loss = 7000 - 30000 = -23000$.
Corona Masks stock was bought at day 1 for 10$ and was sold at day 3 for 1010$. It was bought again at day 4 for 1000$ and was sold at day 5 for 500$. At last, it was bought at day 6 for 1000$ and was sold at day 10 for 10000$. Capital gain/loss is the sum of capital gains/losses for each ('Buy' --> 'Sell') operation = (1010 - 10) + (500 - 1000) + (10000 - 1000) = 1000 - 500 + 9000 = 9500$.*/

select stock_name,
sum(
    case 
    when operation = 'Sell' then price
    when operation = 'Buy' then -price
    end
) as capital_gain_loss
from Stocks
group by stock_name;