-- highest_donation_assignments
WITH round_donations AS (SELECT dn.assignment_id, dr.donor_type, 
	ROUND(SUM(dn.amount), 2) as rounded_total_donation_amount
	FROM public.donations as dn
	INNER JOIN public.donors as dr
	ON dn.donor_id = dr.donor_id
GROUP BY dn.assignment_id, dr.donor_type
)
SELECT a.assignment_name, a.region, r.rounded_total_donation_amount,r.donor_type
FROM public.assignments AS a
	INNER JOIN round_donations as r
	ON a.assignment_id = r.assignment_id
ORDER BY r.rounded_total_donation_amount desc
LIMIT 5

-- top_regional_impact_assignment
WITH num_donation AS (select assignment_id, 
	COUNT (amount) as num_total_donations
from public.donations
group by assignment_id
),
num_donations as (SELECT * FROM num_donation 
WHERE num_total_donations >= 1
),
impact_rank AS (select a.assignment_name, a.region, a.impact_score, n.num_total_donations,
	ROW_NUMBER() OVER (PARTITION BY a.region ORDER BY a.impact_score desc) as impact_rank
	FROM public.assignments AS a 
	INNER JOIN num_donations as n
	ON a.assignment_id = n.assignment_id
				)
Select assignment_name, region, impact_score, num_total_donations
FROM impact_rank 
WHERE impact_rank = 1