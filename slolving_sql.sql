 ######################## MY SQL problems ###################
-------------------------------------    
-- Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").

-- Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.
SELECT 
p.page_id
FROM 
pages AS p
LEFT JOIN
page_likes AS pl
ON p.page_id = pl. page_id
WHERE liked_date IS NULL
ORDER BY page_id ASC
----------------------------------------------------------------------------------------------------------------
-- Tesla is investigating production bottlenecks and they need your help to extract the relevant data. Write a query to determine which parts have begun the assembly process but are not yet finished.

-- Assumptions:

-- parts_assembly table contains all parts currently in production, each at varying stages of the assembly process.
-- An unfinished part is one that lacks a finish_date.
-- This question is straightforward, so let's approach it with simplicity in both thinking and solution.
SELECT 
part ,
assembly_step
FROM parts_assembly
WHERE finish_date IS NULL
----------------------------------------------------------------------------------------------------------------
Laptop vs. Mobile Viewership (https://datalemur.com/questions/laptop-mobile-viewership)

SELECT
COUNT
(
CASE WHEN device_type = 'laptop' THEN TRUE ELSE NULL END
)
AS laptop_views ,
COUNT 
(
CASE WHEN device_type IN ('phone','tablet') THEN 1 ELSE NULL END 
)
AS mobile_views


FROM viewership;







