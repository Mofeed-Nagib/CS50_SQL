# Problem to Solve

If you’re not already familiar, Harvard has a course shopping tool called [my.harvard](https://my.harvard.edu/), with which students explore (and ultimately register for!) classes. To keep track of courses, students, and their registrations, my.harvard presumably uses some kind of underlying database. And yet, if you’ve ever used it, you’ll know that my.harvard isn’t especially… quick.

Here’s your chance to make my.harvard just a little bit faster! In this problem, take some Harvard course data and create indexes to speed up typical queries on the database. Keep in mind that indexing every column isn’t always the best solution: you’ll need to consider trade-offs in terms of space and time, ultimately representing Harvard’s courses and students in the most efficient way possible.

# Schema

![Entity Relationship Diagram from harvard.db](https://github.com/user-attachments/assets/a6d52d0e-33f7-47d9-a1b8-134723fc4bf4)

Within `harvard.db`, you’ll find five tables that implement the relationships described in the ER diagram above. Click the drop-downs below to learn more about the schema of each individual table.

<details><summary><code>students</code> table</summary><br/><p>The <code class="language-plaintext highlighter-rouge">students</code> table contains the following columns:</p>

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">id</code>, which is the student’s ID.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">name</code>, which is the student’s name.</li>
</ul></details>

<details><summary><code>courses</code> table</summary><br/><p>The <code class="language-plaintext highlighter-rouge">courses</code> table contains the following columns:</p>

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">id</code>, which is the courses’s ID.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">department</code>, which is the department in which the course is taught (e.g., “Computer Science”, “Economics”, “Philosophy”).</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">number</code>, which is the course number (e.g., 50, 12, 330).</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">semester</code>, which is the semester in which the class was taught (e.g., “Spring 2024”, “Fall 2023”).</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">title</code>, which is the title of the course (e.g., “Introduction to Computer Science”).</li>
</ul></details>

<details><summary><code>enrollments</code> table</summary><br/><p>The <code class="language-plaintext highlighter-rouge">enrollments</code> table contains the following columns:</p>

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">id</code>, which is the ID to identify the enrollment.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">student_id</code>, which is the ID of the student enrolled.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">course_id</code>, which is the ID of the course in which the student is enrolled.</li>
</ul></details>

<details><summary><code>requirements</code> table</summary><br/><p>The <code class="language-plaintext highlighter-rouge">requirements</code> table contains the following columns:</p>

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">id</code>, which is the ID of the requirement.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">name</code>, which is the name of the requirement.</li>
</ul></details>

<details><summary><code>satisfies</code> table</summary><br/><p>The <code class="language-plaintext highlighter-rouge">satisfies</code> table contains the following columns:</p>

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">id</code>, which is the ID of the course-requirement pair.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">course_id</code>, which is the ID of a given course.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">requirement_id</code>, which is the ID of the requirement which the given course satisfies.</li>
</ul></details>

# Specification

In `indexes.sql`, write a set of SQL statements that create indexes which will speed up typical queries on the `harvard.db` database. The number of indexes you create, as well as the columns they include, is entirely up to you. Be sure to balance speed with disk space, only creating indexes you need.

When engineers optimize a database, they often care about the typical queries run on the database. Such queries highlight patterns with which a database is accessed, thus revealing the best columns and tables on which to create indexes. Click the spoiler tag below to see the set of typical `SELECT` queries run on `harvard.db`.

<details><summary>Typical <code>SELECT</code> queries on <code>harvard.db</code></summary><ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>
    <p>Find a student’s historical course enrollments, based on their ID:</p>
    <div class="language-sql highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="k">SELECT</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"title"</span><span class="p">,</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"semester"</span>
<span class="k">FROM</span> <span class="nv">"enrollments"</span>
<span class="k">JOIN</span> <span class="nv">"courses"</span> <span class="k">ON</span> <span class="nv">"enrollments"</span><span class="p">.</span><span class="nv">"course_id"</span> <span class="o">=</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"id"</span>
<span class="k">JOIN</span> <span class="nv">"students"</span> <span class="k">ON</span> <span class="nv">"enrollments"</span><span class="p">.</span><span class="nv">"student_id"</span> <span class="o">=</span> <span class="nv">"students"</span><span class="p">.</span><span class="nv">"id"</span>
<span class="k">WHERE</span> <span class="nv">"students"</span><span class="p">.</span><span class="nv">"id"</span> <span class="o">=</span> <span class="mi">3</span><span class="p">;</span>
</code></pre></div>    </div>
  </li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>
    <p>Find all students who enrolled in Computer Science 50 in Fall 2023:</p>
    <div class="language-sql highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="k">SELECT</span> <span class="nv">"id"</span><span class="p">,</span> <span class="nv">"name"</span>
<span class="k">FROM</span> <span class="nv">"students"</span>
<span class="k">WHERE</span> <span class="nv">"id"</span> <span class="k">IN</span> <span class="p">(</span>
    <span class="k">SELECT</span> <span class="nv">"student_id"</span>
    <span class="k">FROM</span> <span class="nv">"enrollments"</span>
    <span class="k">WHERE</span> <span class="nv">"course_id"</span> <span class="o">=</span> <span class="p">(</span>
        <span class="k">SELECT</span> <span class="nv">"id"</span>
        <span class="k">FROM</span> <span class="nv">"courses"</span>
        <span class="k">WHERE</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"department"</span> <span class="o">=</span> <span class="s1">'Computer Science'</span>
        <span class="k">AND</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"number"</span> <span class="o">=</span> <span class="mi">50</span>
        <span class="k">AND</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"semester"</span> <span class="o">=</span> <span class="s1">'Fall 2023'</span>
    <span class="p">)</span>
<span class="p">);</span>
</code></pre></div>    </div>
  </li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>
    <p>Sort courses by most- to least-enrolled in Fall 2023:</p>
    <div class="language-sql highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="k">SELECT</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"id"</span><span class="p">,</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"department"</span><span class="p">,</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"number"</span><span class="p">,</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"title"</span><span class="p">,</span> <span class="k">COUNT</span><span class="p">(</span><span class="o">*</span><span class="p">)</span> <span class="k">AS</span> <span class="nv">"enrollment"</span>
<span class="k">FROM</span> <span class="nv">"courses"</span>
<span class="k">JOIN</span> <span class="nv">"enrollments"</span> <span class="k">ON</span> <span class="nv">"enrollments"</span><span class="p">.</span><span class="nv">"course_id"</span> <span class="o">=</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"id"</span>
<span class="k">WHERE</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"semester"</span> <span class="o">=</span> <span class="s1">'Fall 2023'</span>
<span class="k">GROUP</span> <span class="k">BY</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"id"</span>
<span class="k">ORDER</span> <span class="k">BY</span> <span class="nv">"enrollment"</span> <span class="k">DESC</span><span class="p">;</span>
</code></pre></div>    </div>
  </li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>
    <p>Find all computer science courses taught in Spring 2024:</p>
    <div class="language-sql highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="k">SELECT</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"id"</span><span class="p">,</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"department"</span><span class="p">,</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"number"</span><span class="p">,</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"title"</span>
<span class="k">FROM</span> <span class="nv">"courses"</span>
<span class="k">WHERE</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"department"</span> <span class="o">=</span> <span class="s1">'Computer Science'</span>
<span class="k">AND</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"semester"</span> <span class="o">=</span> <span class="s1">'Spring 2024'</span><span class="p">;</span>
</code></pre></div>    </div>
  </li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>
    <p>Find the requirement satisfied by “Advanced Databases” in Fall 2023:</p>
    <div class="language-sql highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="k">SELECT</span> <span class="nv">"requirements"</span><span class="p">.</span><span class="nv">"name"</span>
<span class="k">FROM</span> <span class="nv">"requirements"</span>
<span class="k">WHERE</span> <span class="nv">"requirements"</span><span class="p">.</span><span class="nv">"id"</span> <span class="o">=</span> <span class="p">(</span>
    <span class="k">SELECT</span> <span class="nv">"requirement_id"</span>
    <span class="k">FROM</span> <span class="nv">"satisfies"</span>
    <span class="k">WHERE</span> <span class="nv">"course_id"</span> <span class="o">=</span> <span class="p">(</span>
        <span class="k">SELECT</span> <span class="nv">"id"</span>
        <span class="k">FROM</span> <span class="nv">"courses"</span>
        <span class="k">WHERE</span> <span class="nv">"title"</span> <span class="o">=</span> <span class="s1">'Advanced Databases'</span>
        <span class="k">AND</span> <span class="nv">"semester"</span> <span class="o">=</span> <span class="s1">'Fall 2023'</span>
    <span class="p">)</span>
<span class="p">);</span>
</code></pre></div>    </div>
  </li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>
    <p>Find how many courses in each requirement a student has satisfied:</p>
    <div class="language-sql highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="k">SELECT</span> <span class="nv">"requirements"</span><span class="p">.</span><span class="nv">"name"</span><span class="p">,</span> <span class="k">COUNT</span><span class="p">(</span><span class="o">*</span><span class="p">)</span> <span class="k">AS</span> <span class="nv">"courses"</span>
<span class="k">FROM</span> <span class="nv">"requirements"</span>
<span class="k">JOIN</span> <span class="nv">"satisfies"</span> <span class="k">ON</span> <span class="nv">"requirements"</span><span class="p">.</span><span class="nv">"id"</span> <span class="o">=</span> <span class="nv">"satisfies"</span><span class="p">.</span><span class="nv">"requirement_id"</span>
<span class="k">WHERE</span> <span class="nv">"satisfies"</span><span class="p">.</span><span class="nv">"course_id"</span> <span class="k">IN</span> <span class="p">(</span>
    <span class="k">SELECT</span> <span class="nv">"course_id"</span>
    <span class="k">FROM</span> <span class="nv">"enrollments"</span>
    <span class="k">WHERE</span> <span class="nv">"enrollments"</span><span class="p">.</span><span class="nv">"student_id"</span> <span class="o">=</span> <span class="mi">8</span>
<span class="p">)</span>
<span class="k">GROUP</span> <span class="k">BY</span> <span class="nv">"requirements"</span><span class="p">.</span><span class="nv">"name"</span><span class="p">;</span>
</code></pre></div>    </div>
  </li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>
    <p>Search for a course by title and semester:</p>
    <div class="language-sql highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="k">SELECT</span> <span class="nv">"department"</span><span class="p">,</span> <span class="nv">"number"</span><span class="p">,</span> <span class="nv">"title"</span>
<span class="k">FROM</span> <span class="nv">"courses"</span>
<span class="k">WHERE</span> <span class="nv">"title"</span> <span class="k">LIKE</span> <span class="nv">"History%"</span>
<span class="k">AND</span> <span class="nv">"semester"</span> <span class="o">=</span> <span class="s1">'Fall 2023'</span><span class="p">;</span>
</code></pre></div>    </div>
  </li>
</ul></details>

<p>Be sure to consider the <a href="#advice">Advice</a> section as you get started!</p>

# Advice

In this problem, you’ll take the opposite perspective you did while working on [In a Snap](https://cs50.harvard.edu/sql/2024/psets/5/snap/): rather than design a query that takes advantage of existing indexes, your task is to design indexes which existing queries can take advantage of.

<details><summary>Use <code>EXPLAIN QUERY PLAN</code> on each <code>SELECT</code> query to assess where best to create indexes</summary><br/><p>Begin by assessing where best to create indexes by understanding the plan for each typical query on my.harvard’s database.</p>

<p>For example, try revealing the plan for the first typical query, as by executing the following:</p>

<div class="language-sql highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="k">EXPLAIN</span> <span class="n">QUERY</span> <span class="n">PLAN</span>
<span class="k">SELECT</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"title"</span><span class="p">,</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"semester"</span>
<span class="k">FROM</span> <span class="nv">"enrollments"</span>
<span class="k">JOIN</span> <span class="nv">"courses"</span> <span class="k">ON</span> <span class="nv">"enrollments"</span><span class="p">.</span><span class="nv">"course_id"</span> <span class="o">=</span> <span class="nv">"courses"</span><span class="p">.</span><span class="nv">"id"</span>
<span class="k">JOIN</span> <span class="nv">"students"</span> <span class="k">ON</span> <span class="nv">"enrollments"</span><span class="p">.</span><span class="nv">"student_id"</span> <span class="o">=</span> <span class="nv">"students"</span><span class="p">.</span><span class="nv">"id"</span>
<span class="k">WHERE</span> <span class="nv">"students"</span><span class="p">.</span><span class="nv">"id"</span> <span class="o">=</span> <span class="mi">3</span><span class="p">;</span>
</code></pre></div></div>

<p>The output of the above is as follows:</p>

<div class="language-plaintext highlighter-rouge"><div class="highlight"><pre class="highlight"><code>QUERY PLAN
|--SEARCH students USING INTEGER PRIMARY KEY (rowid=?)
|--SCAN enrollments
`--SEARCH courses USING INTEGER PRIMARY KEY (rowid=?)
</code></pre></div></div>

<p>Notice that, while the database engine is already <code class="language-plaintext highlighter-rouge">SEARCH</code>ing the <code class="language-plaintext highlighter-rouge">students</code> and <code class="language-plaintext highlighter-rouge">courses</code> tables using their primary key indexes, there are still improvements to be made: the database engine is <code class="language-plaintext highlighter-rouge">SCAN</code>ning the <code class="language-plaintext highlighter-rouge">enrollments</code> table without an index. Recall that to <code class="language-plaintext highlighter-rouge">SCAN</code> means that the database engine must search through all rows, one by one—a process that is much slower than searching an index!</p>

<p>Experiment now by creating an index which could turn that <code class="language-plaintext highlighter-rouge">SCAN</code> into a <code class="language-plaintext highlighter-rouge">SEARCH</code> that uses an index. Then, repeat the same process for each of the typical queries on my.harvard’s database until you’ve arrived at a set of indexes which ensure all queries are using indexes to their full potential.</p></details>

<details><summary>Minimize the number of indexes you've created</summary><br/><p>Keep in mind that indexes take up additional space, and that they can slow <code class="language-plaintext highlighter-rouge">INSERT</code>, <code class="language-plaintext highlighter-rouge">UPDATE</code>, and <code class="language-plaintext highlighter-rouge">DELETE</code> queries. Once you’ve arrived at an initial set of indexes, start paring them down until you’ve created the minimum required for each query to use indexes optimally. How to start this process? Consider the following questions:</p>

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Do any of your indexes include the same columns? If so, it’s likely you need only one index on that particular column.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Do any of your indexes include columns unused by the given queries? If so, it’s likely you can remove those columns from your indexes.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Does removing an index have any impact on each query’s plan? If not, might be best to remove it!</li>
</ul>

<p>Through the iterative process above, you’ll refine the indexes you’ve chosen to create.</p></details>
