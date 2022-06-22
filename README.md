# pewlett-hackard-analysis

## Overview of Project

### Purpose

The client, Bobby, has asked for help determining how many positions will need filled as the mass-retirement event, or the "silver tsunami", hits. The company, Pewlett-Hackard, wants to get ahead and be prepared so the business can function properly as many of their employees begin their new chapters in life.

## Results

* A total of 72,458 staff members fit the established retirement criteria. The image below comes from the .csv file exported from the  "retiring_titles" table.

![retiring_titles](Resources/Retiring_Titles.PNG)

* The company is projected to lose more Senior Engineers and Senior Staff than the rest of the titles combined.

* A total of 1,549 staff members were born in 1965 and are recommended to be part of first wave of the proposed mentorship program.

*

## Summary

* 72,458 roles will need replacements as the "silver tsunami" hits.

* For the two titles with the most employees retiring soon (Senior Staff and Senior Engineers), each mentor in the proposed mentorship program would be responsible for training a large amount of new-hires or replacements (44 and 49 respectively). This assumes a 1:1 relationship between lost and gained employee by title. Having groups of this size will likely reduce the quality of training each new employee will get, so the company might want to consider increasing the parameters determining which employees can become a mentor. 

**The following queries may be used in the future to help deepen the company's understanding of the impact of the upcoming retirement wave:**

* This query shows the number of eligible mentors by title. These numbers point to significantly less mentors than seem appropriate for the number of employees being lost

```
SELECT
		title,
		COUNT(title) "count"
FROM
		mentorship_eligibility
GROUP BY title
ORDER BY "count" DESC
```

![New_Query_1](Resources/New_Query_1.PNG)

* 