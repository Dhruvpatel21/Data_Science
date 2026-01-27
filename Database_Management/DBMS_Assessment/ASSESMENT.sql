CREATE DATABASE assessment;
USE assessment;


CREATE TABLE campaigns (
    campaign_id INT PRIMARY KEY,
    campaign_name VARCHAR(100),
    launch_date DATE
);


CREATE TABLE email_opens (
    user_id INT,
    campaign_id INT,
    open_time DATETIME,
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id)
);


CREATE TABLE conversions (
    user_id INT,
    campaign_id INT,
    conversion_time DATETIME,
    revenue DECIMAL(10,2),
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id)
);



INSERT INTO campaigns VALUES
(1, 'New Year Offer', '2025-01-01'),
(2, 'Summer Sale', '2025-04-10'),
(3, 'Diwali Special', '2025-10-20'),
(4, 'Black Friday', '2025-11-25');


INSERT INTO email_opens VALUES
(101, 1, '2025-01-01 09:10:00'),
(102, 1, '2025-01-01 11:45:00'),
(103, 1, '2025-01-02 14:20:00'),
(101, 2, '2025-04-10 10:05:00'),
(104, 2, '2025-04-10 16:30:00'),
(105, 2, '2025-04-11 18:40:00'),
(106, 3, '2025-10-20 08:50:00'),
(107, 3, '2025-10-20 20:15:00'),
(108, 4, '2025-11-25 07:30:00'),
(109, 4, '2025-11-25 13:10:00');


INSERT INTO conversions VALUES
(101, 1, '2025-01-01 12:00:00', 499.00),
(103, 1, '2025-01-02 15:00:00', 299.00),
(104, 2, '2025-04-10 18:00:00', 799.00),
(105, 2, '2025-04-12 09:30:00', 599.00),
(107, 3, '2025-10-21 10:00:00', 999.00),
(110, 4, '2025-11-25 14:00:00', 399.00);

/* Q1: What is the open rate for each campaign?
   Concept: Campaign attribution
   Use: Marketing ROI analysis */
SELECT 
    c.campaign_name,
    COUNT(DISTINCT eo.user_id) AS opened_users
FROM campaigns c
LEFT JOIN email_opens eo
ON c.campaign_id = eo.campaign_id
GROUP BY c.campaign_id;


/* Q2: What is the conversion rate? 
Concept: Multiple LEFT JOINs, funnel tracking 
Use: Evaluate marketing efficiency  */
SELECT 
    c.campaign_name,
    COUNT(DISTINCT conv.user_id) AS converted_users
FROM campaigns c
LEFT JOIN conversions conv
ON c.campaign_id = conv.campaign_id
GROUP BY c.campaign_id;

/*  3. What is the revenue per campaign?  */

SELECT 
    c.campaign_name,
    SUM(conv.revenue) AS total_revenue
FROM campaigns c
LEFT JOIN conversions conv
ON c.campaign_id = conv.campaign_id
GROUP BY c.campaign_id;


/*  4. Which campaign had the highest ROI (conversion revenue vs. estimated cost)?   */

SELECT 
    c.campaign_name,
    SUM(conv.revenue) - 1000 AS ROI
FROM campaigns c
LEFT JOIN conversions conv
ON c.campaign_id = conv.campaign_id
GROUP BY c.campaign_id
ORDER BY ROI DESC
LIMIT 1;


/*  5. How many users opened but didn’t convert (drop- off rate)?   */

SELECT 
    eo.user_id,
    eo.campaign_id
FROM email_opens eo
LEFT JOIN conversions conv
ON eo.user_id = conv.user_id
AND eo.campaign_id = conv.campaign_id
WHERE conv.user_id IS NULL;


/*  6. Which time of day has the highest email open rate?   */

SELECT 
    HOUR(open_time) AS open_hour,
    COUNT(*) AS total_opens
FROM email_opens
GROUP BY open_hour
ORDER BY total_opens DESC
LIMIT 1;

/*    7. What is the average time between email open and conversion?    */

SELECT 
    AVG(TIMESTAMPDIFF(MINUTE, eo.open_time, conv.conversion_time)) AS avg_minutes
FROM email_opens eo
JOIN conversions conv
ON eo.user_id = conv.user_id
AND eo.campaign_id = conv.campaign_id;


/*  8. List users who converted without opening the email (if possible).   */

SELECT 
    conv.user_id,
    conv.campaign_id
FROM conversions conv
LEFT JOIN email_opens eo
ON conv.user_id = eo.user_id
AND conv.campaign_id = eo.campaign_id
WHERE eo.user_id IS NULL;


/* 9. Which campaign had the fastest | conversions after opening? */

SELECT 
    c.campaign_name,
    MIN(TIMESTAMPDIFF(MINUTE, eo.open_time, conv.conversion_time)) AS fastest_conversion_minutes
FROM campaigns c
JOIN email_opens eo
ON c.campaign_id = eo.campaign_id
JOIN conversions conv
ON eo.user_id = conv.user_id
AND eo.campaign_id = conv.campaign_id
GROUP BY c.campaign_id
ORDER BY fastest_conversion_minutes
LIMIT 1;


/*  10. What is the average revenue per conversion per campaign?   */

SELECT 
    c.campaign_name,
    AVG(conv.revenue) AS avg_revenue
FROM campaigns c
JOIN conversions conv
ON c.campaign_id = conv.campaign_id
GROUP BY c.campaign_id;
