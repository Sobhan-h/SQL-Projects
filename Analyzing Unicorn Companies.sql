WITH best_performing AS (
	select i.industry,
			count (i.industry) as num_unicorns
	from industries as i
	INNER JOIN dates as d
	on i.company_id = d.company_id
	where EXTRACT (YEAR FROM date_joined) IN (2019,2020,2021)
	group by industry
	order by num_unicorns desc
	limit 3
	
),
company_industry AS ( 
    SELECT i.industry, f.valuation, i.company_id
    FROM industries AS i 
    INNER JOIN funding AS f       
    ON i.company_id = f.company_id
),
year_founded AS (
    SELECT ci.industry, ci.valuation,
           EXTRACT(YEAR FROM d.date_joined) AS "year"
    FROM dates AS d
    INNER JOIN company_industry AS ci
    ON d.company_id = ci.company_id
),
ranked_industries AS (
    SELECT industry, "year",
           COUNT(industry) AS num_unicorns,
           ROUND(AVG(valuation) / 1000000000, 2) AS average_valuation_billions,
           ROW_NUMBER() OVER (PARTITION BY "year" ORDER BY COUNT(industry) DESC) AS rank
    FROM year_founded
    WHERE "year" IN (2019, 2020, 2021) 
		and industry IN ( SELECT industry FROM best_performing)
    GROUP BY industry, "year"
)
SELECT industry, "year", num_unicorns, average_valuation_billions
FROM ranked_industries
WHERE rank <= 3
ORDER BY "year" DESC, num_unicorns DESC;
