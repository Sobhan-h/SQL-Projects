## 1. Evaluate a Manufacturing Process ([advanced SQL project from datacamp.com](https://app.datacamp.com/learn/projects/2044))

Manufacturing processes for any product is like putting together a puzzle. Products are pieced together step by step, and keeping a close eye on the process is important.  
For this project, you're supporting a team that wants to improve how they monitor and control a manufacturing process. The goal is to implement a more methodical approach known as statistical process control (SPC). SPC is an established strategy that uses data to determine whether the process works well. Processes are only adjusted if measurements fall outside of an acceptable range.  
This acceptable range is defined by an upper control limit (UCL) and a lower control limit (LCL), the formulas for which are:

$$
ucl = avg-height + 3 * \frac{stddev-height}{\sqrt{5}} \\
lcl = avg-height - 3 * \frac{stddev-height}{\sqrt{5}}
$$

The UCL defines the highest acceptable height for the parts, while the LCL defines the lowest acceptable height for the parts. Ideally, parts should fall between the two limits.

Using SQL window functions and nested queries, you'll analyze historical manufacturing data to define this acceptable range and identify any points in the process that fall outside of the range and therefore require adjustments. This will ensure a smooth running manufacturing process consistently making high-quality products.


## The data
The data is available in the `manufacturing_parts` table which has the following fields:
- `item_no`: the item number
- `length`: the length of the item made
- `width`: the width of the item made
- `height`: the height of the item made
- `operator`: the operating machine

## Results
![Evaluate a manufacturing process](https://github.com/Sobhan-h/SQL-Projects/blob/master/Result%20(Evaluate%20a%20manufacuting%20process).png)

<br>  <!-- Add another line break for spacing -->
<br>  <!-- Add another line break for spacing -->

## 2. Analyzing Unicorn Companies ([advanced SQL project from datacamp.com](https://app.datacamp.com/learn/projects/1531))

Did you know that the average return from investing in stocks is [10% per year](https://www.nerdwallet.com/article/investing/average-stock-market-return) (not accounting for inflation)? But who wants to be average?! 

You have been asked to support an investment firm by analyzing trends in high-growth companies. They are interested in understanding which industries are producing the highest valuations and the rate at which new high-value companies are emerging. Providing them with this information gives them a competitive insight as to industry trends and how they should structure their portfolio looking forward.

You have been given access to their `unicorns` database, which contains the following tables:

## dates
| Column       | Description                                  |
|------------- |--------------------------------------------- |
| `company_id`   | A unique ID for the company.                 |
| `date_joined` | The date that the company became a unicorn.  |
| `year_founded` | The year that the company was founded.       |

## funding
| Column           | Description                                  |
|----------------- |--------------------------------------------- |
| `company_id`       | A unique ID for the company.                 |
| `valuation`        | Company value in US dollars.                 |
| `funding`          | The amount of funding raised in US dollars.  |
| `select_investors` | A list of key investors in the company.      |

## industries
| Column       | Description                                  |
|------------- |--------------------------------------------- |
| `company_id`   | A unique ID for the company.                 |
| `industry`     | The industry that the company operates in.   |

## companies
| Column       | Description                                       |
|------------- |-------------------------------------------------- |
| `company_id`   | A unique ID for the company.                      |
| `company`      | The name of the company.                          |
| `city`         | The city where the company is headquartered.      |
| `country`      | The country where the company is headquartered.   |
| `continent`    | The continent where the company is headquartered. |


## Results
![Analazying Unicorn Companies](https://github.com/Sobhan-h/SQL-Projects/blob/master/Result%20(Analyzing%20Unicorn%20Companies).png)

## Impact Analysis of GoodThought NGO Initiatives
GoodThought NGO has been a catalyst for positive change, focusing its efforts on education, healthcare, and sustainable development to make a significant difference in communities worldwide. With this mission, GoodThought has orchestrated an array of assignments aimed at uplifting underprivileged populations and fostering long-term growth.

This project offers a hands-on opportunity to explore how data-driven insights can direct and enhance these humanitarian efforts. In this project, you'll engage with the GoodThought PostgreSQL database, which encapsulates detailed records of assignments, funding, impacts, and donor activities from 2010 to 2023. This comprehensive dataset includes:

- **`Assignments`:** Details about each project, including its name, duration (start and end dates), budget, geographical region, and the impact score.
- **`Donations`:** Records of financial contributions, linked to specific donors and assignments, highlighting how financial support is allocated and utilized.
- **`Donors`:** Information on individuals and organizations that fund GoodThought’s projects, including donor types.

Refer to the below ERD diagram for a visual representation of the relationships between these data tables:
![Impact Analysis of GoodThought NGO Initiatives](https://github.com/Sobhan-h/SQL-Projects/blob/master/Tables%20(Impact%20Analysis%20of%20GoodThought%20NGO%20Initiatives).png)

## Results
1.Highest donation assignments
![Highest donation assignments](https://github.com/Sobhan-h/SQL-Projects/blob/master/Results%20(highest%20donation%20assignments).png)
<br>  <!-- Add another line break for spacing -->
2.top regional impact score
![top regional impact score](
