SELECT name, SUM(pupils * per_pupil_expenditure) AS `Total Expenditures`
FROM districts
JOIN expenditures ON districts.id = expenditures.district_id
GROUP BY districts.id
ORDER BY `Total Expenditures` DESC;