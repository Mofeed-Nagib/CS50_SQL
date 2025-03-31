# Problem to Solve

[LinkedIn](https://about.linkedin.com/) is “the world’s largest professional network” with a mission to “connect the world’s professionals to make them more productive and successful.” Perhaps you have an account? On the platform, users can post their professional experience (i.e., past jobs, education, etc.) and make connections with other people they’ve met, in-person or online.

In a file called `schema.sql` in a folder called `connect`, write a set of SQL statements to design a database LinkedIn could use.

# Specification

<p>Your task at hand is to create a SQLite database for LinkedIn from scratch, as by writing a set of <code class="language-plaintext highlighter-rouge">CREATE TABLE</code> statements in a <code class="language-plaintext highlighter-rouge">schema.sql</code> file. The implementation details are up to you, though you should minimally ensure that your database meets the <a href="#platform">platform’s specification</a> and that it can represent the given <a href="#sample-data">sample data</a>.</p>

## Platform

### Users

<p>The heart of LinkedIn’s platform is its people. Your database should be able to represent the following information about LinkedIn’s users:</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Their first and last name</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Their username</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Their password</li>
</ul>
<p>Keep in mind that, if a company is following best practices, application passwords are “<a href="https://en.wikipedia.org/wiki/Hash_function">hashed</a>.” No need to worry about hashing passwords here, though.</p>

### Schools and Universities

<p>LinkedIn also allows for official school or university accounts, such as <a href="https://www.linkedin.com/school/harvard-university/">that for Harvard</a>, so alumni (i.e., those who’ve attended) can identify their affiliation. Ensure that LinkedIn’s database can store the following information about each school:</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The name of the school</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The type of school (e.g., “Elementary School”, “Middle School”, “High School”, “Lower School”, “Upper School”, “College”, “University”, etc.)</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The school’s location</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The year in which the school was founded</li>
</ul>

### Companies

<p>LinkedIn allows companies to create their own pages, like the <a href="https://www.linkedin.com/company/linkedin/">one for LinkedIn itself</a>, so employees can identify their past or current employment with the company. Ensure that LinkedIn’s database can store the following information for each company:</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The name of the company</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The company’s industry (e.g., “Education”, “Technology, “Finance”, etc.)</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The company’s location</li>
</ul>

### Connections

<p>And finally, the essence of LinkedIn is its ability to facilitate connections between people. Ensure LinkedIn’s database can support each of the following connections.</p>

<details><summary>Connections with People</summary><br/><p>LinkedIn’s database should be able to represent mutual (reciprocal, two-way) connections between <a href="#users">users</a>. No need to worry about one-way connections, such as user A “following” user B without user B “following” user A.</p></details>

<details><summary>Connections with Schools</summary><br/><p>A <a href="#user">user</a> should be able to create an affiliation with a given school. And similarly, that school should be able to find its alumni. Additionally, allow a user to define:</p>

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The start date of their affiliation (i.e., when they started to attend the school)</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The end date of their affiliation (i.e., when they graduated), if applicable</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The type of degree earned/pursued (e.g., “BA”, “MA”, “PhD”, etc.)</li>
</ul></details>

<details><summary>Connections with Companies</summary><br/><p>A <a href="#user">user</a> should be able to create an affiliation with a given company. And similarly, a company should be able to find its current and past employees. Additionally, allow a user to define:</p>

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The start date of their affiliation (i.e., the date they began work with the company)</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The end date of their affiliation (i.e., when left the company), if applicable</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The title they held while affiliated with the company</li>
</ul></details>

## Sample Data

<p>Your database should be able to represent…</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>A user, <strong><a href="https://en.wikipedia.org/wiki/Alan_Garber">Alan Garber</a></strong>, whose username is “alan” and password is “password”.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>A user, <strong><a href="https://en.wikipedia.org/wiki/Reid_Hoffman">Reid Hoffman</a></strong> whose username is “reid” and password is “password”.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>A school, <strong>Harvard University</strong>, which is a university located in Cambridge, Massachusetts, founded in 1636.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>A company, <strong>LinkedIn</strong>, which is a technology company headquartered in Sunnyvale, California.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Alan Garber’s <strong>undergraduate education at Harvard</strong>, pursuing a BA from September 1st, 1973 to June 1st, 1976.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Reid Hoffman’s <strong>employment with LinkedIn</strong> as its CEO and Chairman, from January 1st, 2003 to February 1st, 2007.</li>
</ul>
