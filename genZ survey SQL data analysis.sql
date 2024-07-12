SELECT * FROM genz_survey_table;

# 1. What is the gender distribution of respondents from India?
SELECT 
	COUNT(CASE WHEN gender = "male" THEN 1 END) AS male_count,
    COUNT(CASE WHEN gender = "female" THEN 1 END) AS female_count
FROM genz_survey_table
WHERE country = "india";

# 2. What percentage of respondents from India are interested in education abroad and sponsorship?

SELECT 
    (SUM(CASE WHEN Higher_Education_outside_India = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percentage_yes_abroad,
    (SUM(CASE WHEN Higher_Education_outside_India = 'need sponsor' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percentage_need_sponsorship
FROM  genz_survey_table
WHERE  Country = 'India';
    
# 3. What are the 6 top influences on career aspirations for respondents in India?
SELECT Influencing_Factors , COUNT(*) as count
FROM genz_survey_table
WHERE country = "india"
GROUP BY Influencing_Factors
ORDER BY count DESC
LIMIT 6;

# 4. How do career aspiration influences vary by gender in India?
SELECT Influencing_Factors , gender , COUNT(*) as count
FROM genz_survey_table
WHERE country = "india"
GROUP BY gender , Influencing_Factors,gender
ORDER BY gender , count DESC;

# 5. What percentage of respondents are willing to work for a company for at least 3 years?
SELECT
	(SUM(CASE WHEN work_3_year_plus = "yes" THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percent_work3Year,
    (SUM(CASE WHEN work_3_year_plus = "depends on company culture" THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS depends_onCulture
FROM  genz_survey_table
WHERE  Country = 'India';

# 6. How many respondents prefer to work for socially impactful companies?

SELECT company_no_social_impact , COUNT(*) AS pref_socially_impactful_companies
FROM genz_survey_table
WHERE company_no_social_impact = 1 AND country = "india";

# 7. How does the preference for socially impactful companies vary by gender?
SELECT company_no_social_impact , gender , COUNT(*) AS pref_socially_impactful_companies
FROM genz_survey_table
WHERE company_no_social_impact = 1 AND country = "india"
GROUP BY gender;

# 8. What is the distribution of minimum expected salary in the first three years among respondents?
SELECT expected_salary_first_3_years , COUNT(*) AS distribution
FROM genz_survey_table
WHERE country = "india"
GROUP BY expected_salary_first_3_years
ORDER BY distribution DESC;

# 9. What is the expected minimum monthly salary in hand?
SELECT expected_start_salary_month , COUNT(*) AS distribution
FROM genz_survey_table
GROUP BY expected_start_salary_month;

# 10. What percentage of respondents prefer remote working?
SELECT 
	(SUM(CASE WHEN preferred_work_env = "remote" THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS remote_work_percentage
FROM genz_survey_table
WHERE country = "india";

# 11. What is the preferred number of daily work hours?
 SELECT daily_work_hours_pref , COUNT(*) AS distribution
 FROM genz_survey_table
 WHERE country = "india"
 GROUP BY daily_work_hours_pref
 ORDER BY distribution;

 
 # 12. What are the common work frustrations among respondents?
SELECT work_frustrations , COUNT(*) AS distribution
FROM genz_survey_table
WHERE country = "india"
GROUP BY work_frustrations
ORDER BY distribution;

# 13. How does the need for work-life balance interventions vary by gender?
SELECT week_break_for_balance , gender , COUNT(*) AS distribution
FROM genz_survey_table
WHERE country = "india"
GROUP BY gender , week_break_for_balance
ORDER BY week_break_for_balance DESC;

# 14. How many respondents are willing to work under an abusive manager?
SELECT accept_abuse_manager , COUNT(*) AS response
FROM genz_survey_table
WHERE accept_abuse_manager = "yes" ;

# 15. What is the distribution of minimum expected salary after five years?
SELECT min_expected_salary_5_years , COUNT(*) AS distribution
FROM genz_survey_table
GROUP BY min_expected_salary_5_years ;

# 16. What are the remote working preferences by gender?
SELECT gender , preferred_work_env , COUNT(*) AS distribution
FROM genz_survey_table
WHERE preferred_work_env = "remote"
GROUP BY gender , preferred_work_env ; 

# 17. What are the top work frustrations for each gender?
SELECT work_frustrations , gender , COUNT(*) AS distribution
FROM genz_survey_table
GROUP BY gender , work_frustrations
ORDER BY distribution DESC ;

# 18. What factors boost work happiness and productivity for respondents?
SELECT happiness_productivity_factors , COUNT(*) AS distribution
FROM genz_survey_table
GROUP BY happiness_productivity_factors 
ORDER BY distribution;

# 19. What percentage of respondents need sponsorship for education abroad?
SELECT 
    (SUM(CASE WHEN Higher_Education_outside_India = 'need sponsor' THEN 1 ELSE 0 END) 
    / COUNT(*)) * 100 AS percentage_need_sponsorship
FROM  genz_survey_table
WHERE  Country = 'India';









