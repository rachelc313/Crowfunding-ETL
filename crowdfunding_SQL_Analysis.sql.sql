-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT * FROM "campaign";

DROP TABlE "backer_counts";

SELECT COUNT(b.backer_id), b.cf_id
INTO backer_counts
FROM backers as b
INNER JOIN campaign as c
ON b.cf_id = c.cf_id
WHERE c.outcome = ('live')
GROUP BY b.cf_id
ORDER BY b.cf_id DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT (b.backer_id), b.cf_id
FROM backers as b
GROUP BY b. cf_id
ORDER BY b.cf_id DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

DROP TABLE "email_contacts_remaining_goal_amount";

SELECT ct.first_name, 
	ct. last_name, 
	ct.email,
	c.goal - c.pledged
INTO email_contacts_remaining_goal_amount
FROM contacts as ct
INNER JOIN campaign as c
ON c.contact_id = ct.contact_id
WHERE c.outcome = ('live')
ORDER BY "?column?" DESC;

SELECT * FROM "email_contacts_remaining_goal_amount";

ALTER TABLE email_contacts_remaining_goal_amount
	RENAME COLUMN "?column?" TO "Remaining Goal Amount";
	
-- Write a SQL query that creates a new table named email_backers_remaining_goal_amount that contains 
-- the email addresses of the backers, the first and the last name of each backer,
-- the cf_id, the company name, the description, the end date of the campaign, and the remaining amount 
-- of the campaign goal as "Left of Goal".

SELECT b.email,
	b.first_name,
	b.last_name,
	b.cf_id,
	c.company_name,
	c.description,
	c.end_date,
	c.goal - c.pledged
INTO email_backers_remaining_goal_amount
FROM backers as b
INNER JOIN campaign as c
ON b.cf_id = c.cf_id
ORDER BY b.last_name;

ALTER TABLE email_backers_remaining_goal_amount
	RENAME COLUMN "?column?" TO "Left of Goal";
	
SELECT * FROM "email_backers_remaining_goal_amount";


-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 



-- Check the table


