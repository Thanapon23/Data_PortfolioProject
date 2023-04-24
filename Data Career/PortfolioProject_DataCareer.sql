-- Cleaning Job_Title
-- Grouping Similar Role 

-- Data Analyst 
Select Distinct(job_title), count(job_title) 
From   data.datacareer
group by job_title
order by	


Select job_title
, CASE WHEN job_title like '%Anal%' THEN 'Data Analyst'
else job_title
end
from  data.datacareer

Update data.datacareer
SET job_title = CASE WHEN job_title like '%Anal%' THEN 'Data Analyst'
else job_title
end

----------------------------------------------------------------------------

-- Machine Learning 

SELECT job_title, count(job_title) as count
from data.datacareer
where job_title like '%Machine%'
group by job_title
order by count desc 


Select job_title
, CASE WHEN job_title like '%Machine%' THEN 'Machine Learning Engineer'
else job_title
end
from  data.datacareer

Update data.datacareer
SET job_title = CASE WHEN job_title like '%Machine%' THEN 'Machine Learning Engineer'
else job_title
end
-------------------------------------------------------------------------------------------

-- Data Scientist

SELECT job_title, count(job_title) as count
from data.datacareer
where job_title like '%Scien%'
group by job_title
order by count desc 


Select job_title
, CASE WHEN job_title like '%Scien%' THEN 'Data Scientist'
else job_title
end
from data.datacareer

Update data.datacareer
SET job_title = CASE WHEN job_title like '%Scien%' THEN 'Data Scientist'
else job_title
end


----------------------------------------------------------------------------

-- Data Engineer

SELECT job_title, count(job_title) as count
from data.datacareer
where job_title like '%Engineer%'
group by job_title
order by count desc 


Select job_title
, CASE WHEN job_title like '%Data Engineer%' THEN 'Data Engineer'
else job_title
end
from data.datacareer

Update data.datacareer
SET job_title = CASE WHEN job_title like '%Data Engineer%' THEN 'Data Engineer'
else job_title
end
-------------------------------------------------------------------------------


-- Exploratory Data Analysis --

-- Top 10 most in-demand job positions
SELECT job_title, count(job_title) as count
from data.datacareer
group by job_title
order by count desc
limit 10;

-- Most lucrative job position
SELECT job_title, avg(salary_in_usd) as AVG_sal_Position
from data.datacareer
group by job_title
order by AVG_sal_Position desc;

-- Peak year of Data Career
SELECT work_year, count(work_year) as countwy
from data.datacareer
group by work_year
order by countwy desc;

-- Salaries are on an upward trend every year
SELECT work_year, avg(salary_in_usd) as avg_workyear_sal
from data.datacareer
group by work_year
order by avg_workyear_sal desc;

-- The top-tier average salary level
SELECT experience_level, round(avg(salary_in_usd),0) as lvlSal
from data.datacareer
group by experience_level
order by lvlSal desc;

-- The number of data careers varies across different sizes of companies.
SELECT company_size, count(company_size) as countSize
from data.datacareer
group by company_size
order by countSize desc;

-- Remote Work Ratio
SELECT remote_ratio, count(remote_ratio) as countRemote
from data.salaries
group by remote_ratio
order by remote_ratio desc;

-- Distribution of Remote Work Ratio
SELECT remote_ratio, count(remote_ratio) as countRemote, cast(count(remote_ratio)*100/sum(count(remote_ratio))
over () as dec(5,2)) as distribution
from data.salaries
group by remote_ratio
order by distribution desc;