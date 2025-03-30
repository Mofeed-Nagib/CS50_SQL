# Problem to Solve

You just landed a new job as a data analyst for the State of Massachusetts, working within the Department of Elementary and Secondary Education (or DESE, for short!). DESE oversees the state’s [public education system](https://en.wikipedia.org/wiki/Education_in_the_United_States). One responsibility of DESE is to ensure every child has a quality education—one in which they encounter experienced teachers, have access to an abundance of resources, and ultimately graduate having met all requirements of the state. Your SQL skills have a part to play in these lofty goals!

In a database called `dese.db`, answer questions about the state of education in Massachusetts.

# Schema

In Massachusetts, public education is delegated to [districts](https://en.wikipedia.org/wiki/School_district), a type of school government often associated with an individual town. These districts, in turn, contain many individual schools. Consider the entity relationship diagram below, which codifies the relationship between districts, schools, and other data DESE collects.

![Entity Relationship Diagram for dese.db](https://github.com/user-attachments/assets/4625b1ee-d4d4-4cbb-b4a6-bf5ea8eb995c)

Within `dese.db`, you’ll find several tables that implement the relationships described in the diagram above. Click the drop-downs below to learn more about the schema of each individual table.

<details><summary><code>districts</code> table</summary><br/><p>The <code class="language-plaintext highlighter-rouge">districts</code> table contains the following columns:</p>

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">id</code>, which is the ID of the district</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">name</code>, which is the name of the district</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">type</code>, which denotes the type of district. In Massachusetts, there are public school districts (denoted “Public School District”) and charter districts (denoted “Charter District”). No need to learn the difference, though you can do so from <a href="https://en.wikipedia.org/wiki/Charter_school">Wikipedia</a> if curious!</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">city</code>, which is the city in which the district is located</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">state</code>, which is the state in which the district is located</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">zip</code>, which is the <a href="https://en.wikipedia.org/wiki/ZIP_Code">ZIP Code</a> in which the district is located</li>
</ul></details>

<details><summary><code>schools</code> table</summary><br/><p>The <code class="language-plaintext highlighter-rouge">schools</code> table contains the following columns:</p>

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">id</code>, which is the ID of the school</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">district_id</code>, which is the ID of the district to which the school belongs</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">name</code>, which is the name of the school</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">type</code>, which denotes the type of school. In Massachusetts, there are public schools (denoted “Public School”) and charter schools (denoted “Charter School”). No need to learn the difference, though you can do so from <a href="https://en.wikipedia.org/wiki/Charter_school">Wikipedia</a> if curious!</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">city</code>, which is the city in which the school is located</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">state</code>, which is the state in which the school is located</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">zip</code>, which is the <a href="https://en.wikipedia.org/wiki/ZIP_Code">ZIP Code</a> in which the school is located</li>
</ul></details>

<details><summary><code>graduation_rates</code> table</summary><br/><p>The <code class="language-plaintext highlighter-rouge">graduation_rates</code> table contains the following columns:</p>

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">id</code>, which is the ID of the graduation rate</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">school_id</code>, which is the ID of the school with which the graduation is associated</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">graduated</code>, which is the percentage of students, 0–100, who graduated on time</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">dropped</code>, which is the percentage of students, 0–100, who dropped out of school before graduation</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">excluded</code>, which is the percentage of students, 0–100, who were “excluded” (i.e., expelled)</li>
</ul></details>

<details><summary><code>expenditures</code> table</summary><br/><p>The <code class="language-plaintext highlighter-rouge">expenditures</code> table contains the following columns:</p>

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">id</code>, which is the ID of the expenditure</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">district_id</code>, which is the ID of the district with which the expenditure is associated</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">pupils</code>, which is the number of pupils attending the given district</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">per_pupil_expenditure</code>, which is the amount of money spent, in dollars, on each student attending the district</li>
</ul></details>

<details><summary><code>staff_evaluations</code> table</summary><br/><p>The <code class="language-plaintext highlighter-rouge">staff_evaluations</code> table contains the following columns:</p>

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">id</code>, which is the ID of the evaluation report</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">district_id</code>, which is the ID of the district with which the evaluation is associated</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">evaluated</code>, which is the percentage of district staff, 0–100, formally evaluated</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">exemplary</code>, which is the percentage of district staff, 0–100, evaluated as “exemplary”</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">proficient</code>, which is the percentage of district staff, 0–100, evaluated as “proficient”</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">needs_improvement</code>, which is the percentage of district staff, 0–100, evaluated as “needing improvement”</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">unsatisfactory</code>, which is the percentage of district staff, 0–100, evaluated as “unsatisfactory”</li>
</ul></details>

You might (cleverly!) note that some of these relationships could be implemented with a single table. You’d be correct, though in this case, you’ll simply have to work with what your colleagues at DESE created!

# Specification

For each of the following questions, you should write a single SQL query that outputs the results specified by each problem. Your response must take the form of a single SQL query. You should not assume anything about the `id`s of any particular rows: your queries should be accurate even if the `id`s were different. Finally, each query should return only the data necessary to answer the question.

### `1.sql`

Your colleague is preparing a map of all public schools in Massachusetts. In `1.sql`, write a SQL query to find the names and cities of all public schools in Massachusetts.

- Keep in mind that not all schools in the `schools` table are considered traditional public schools. Massachusetts also recognizes [charter schools](https://en.wikipedia.org/wiki/Charter_schools_in_the_United_States), which (according to DESE!) are considered distinct.

### `2.sql`

Your team is working on archiving old data. In `2.sql`, write a SQL query to find the names of districts that are no longer operational.

- Districts that are no longer operational have “(non-op)” at the end of their name.

### `3.sql`

The Massachusetts Legislature would like to learn how much money, on average, districts spent per-pupil last year. In `3.sql`, write a SQL query to find the average per-pupil expenditure. Name the column “Average District Per-Pupil Expenditure”.

- Note the `per_pupil_expenditure` column in the `expenditures` table contains the average amount, per pupil, each district spent last year. You’ve been asked to find the average of this set of averages, weighting all districts equally regardless of their size.

### `4.sql`

Some cities have more public schools than others. In `4.sql`, write a SQL query to find the 10 cities with the most public schools. Your query should return the names of the cities and the number of public schools within them, ordered from greatest number of public schools to least. If two cities have the same number of public schools, order them alphabetically.

### `5.sql`

DESE would like you to determine in what cities additional public schools might be needed. In `5.sql`, write a SQL query to find cities with 3 or fewer public schools. Your query should return the names of the cities and the number of public schools within them, ordered from greatest number of public schools to least. If two cities have the same number of public schools, order them alphabetically.

### `6.sql`

DESE wants to assess which schools achieved a 100% graduation rate. In `6.sql`, write a SQL query to find the names of schools (public or charter!) that reported a 100% graduation rate.

### `7.sql`

DESE is preparing a report on schools in the Cambridge school district. In `7.sql`, write a SQL query to find the names of schools (public or charter!) in the Cambridge school district. Keep in mind that Cambridge, the city, contains a few school districts, but DESE is interested in the district whose name is “Cambridge.”

### `8.sql`

A parent wants to send their child to a district with many other students. In `8.sql`, write a SQL query to display the names of all school districts and the number of pupils enrolled in each.

### `9.sql`

Another parent wants to send their child to a district with few other students. In `9.sql`, write a SQL query to find the name (or names) of the school district(s) with the single least number of pupils. Report only the name(s).

### `10.sql`

In Massachusetts, school district expenditures are in part determined by local taxes on property (e.g., home) values. In `10.sql`, write a SQL query to find the 10 public school districts with the highest per-pupil expenditures. Your query should return the names of the districts and the per-pupil expenditure for each.

### `11.sql`

Is there a relationship between school expenditures and graduation rates? In `11.sql`, write a SQL query to display the names of schools, their per-pupil expenditure, and their graduation rate. Sort the schools from greatest per-pupil expenditure to least. If two schools have the same per-pupil expenditure, sort by school name.

- You should assume a school spends the same amount per-pupil their district as a whole spends.

### `12.sql`

A parent asks you for advice on finding the best public school districts in Massachusetts. In `12.sql`, write a SQL query to find public school districts with above-average per-pupil expenditures _and_ an above-average percentage of teachers rated “exemplary”. Your query should return the districts’ names, along with their per-pupil expenditures and percentage of teachers rated exemplary. Sort the results first by the percentage of teachers rated exemplary (high to low), then by the per-pupil expenditure (high to low).

### `13.sql`

In `13.sql`, write a SQL query to answer a question you have about the data! The query should:

- Involve at least one `JOIN` or subquery
