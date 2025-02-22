SELECT DISTINCT brand
FROM transaction
WHERE standard_cost IS NOT NULL
  AND standard_cost <> ''
  AND (REPLACE(standard_cost, ',', '.'))::numeric > 1500;



SELECT *
FROM transaction
WHERE order_status = 'Approved'
  AND to_date(transaction_date, 'DD.MM.YYYY')
      BETWEEN to_date('01.04.2017','DD.MM.YYYY')
        AND to_date('09.04.2017','DD.MM.YYYY');


SELECT DISTINCT job_title
FROM customer
WHERE job_industry_category IN ('IT', 'Financial Services')
  AND job_title LIKE 'Senior%';


SELECT DISTINCT t.brand
FROM transaction t
JOIN customer c ON c.customer_id = t.customer_id
WHERE c.job_industry_category = 'Financial Services';


SELECT DISTINCT c.customer_id,
       c.first_name,
       c.last_name,
       c.job_title,
       c.job_industry_category
FROM customer AS c
JOIN transaction AS t ON c.customer_id = t.customer_id
WHERE t.online_order = TRUE
  AND t.brand IN ('Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles')
LIMIT 10;


SELECT c.*
FROM customer AS c
LEFT JOIN transaction AS t ON c.customer_id = t.customer_id
WHERE t.customer_id IS NULL;


SELECT DISTINCT c.customer_id,
       c.first_name,
       c.last_name,
       c.job_industry_category,
       t.standard_cost
FROM customer AS c
JOIN transaction AS t ON c.customer_id = t.customer_id
WHERE c.job_industry_category = 'IT'
  AND t.standard_cost IS NOT NULL
  AND t.standard_cost <> ''
  AND REPLACE(t.standard_cost, ',', '.')::numeric = (
    SELECT MAX(REPLACE(t2.standard_cost, ',', '.')::numeric)
    FROM transaction AS t2
    JOIN customer AS c2 ON c2.customer_id = t2.customer_id
    WHERE c2.job_industry_category = 'IT'
      AND t2.standard_cost IS NOT NULL
      AND t2.standard_cost <> ''
  );


SELECT DISTINCT c.customer_id,
       c.first_name,
       c.last_name,
       c.job_industry_category
FROM customer AS c
JOIN transaction AS t 
      ON c.customer_id = t.customer_id
WHERE c.job_industry_category IN ('IT', 'Health')
  AND t.order_status = 'Approved'
  AND to_date(t.transaction_date, 'DD.MM.YYYY') 
      BETWEEN to_date('07.07.2017', 'DD.MM.YYYY')
        AND to_date('17.07.2017', 'DD.MM.YYYY');







