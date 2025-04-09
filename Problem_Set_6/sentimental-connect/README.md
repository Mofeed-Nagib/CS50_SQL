# Problem to Solve

<p>You might recall from an <a href="../../2/connect/">earlier problem</a> that <a href="https://about.linkedin.com/">LinkedIn</a> is “the world’s largest professional network” with a mission to “connect the world’s professionals to make them more productive and successful.” Odds are, then, they use full-fledged database servers to ensure their platform is <a href="https://www.digitalocean.com/community/tutorials/what-is-high-availability">highly available</a> around the world.</p>

<p>In a file called <code class="language-plaintext highlighter-rouge">schema.sql</code> in a folder called <code class="language-plaintext highlighter-rouge">sentimental-connect</code>, write a set of SQL statements to design a MySQL database schema that LinkedIn could use.</p>

# Specification

<p>Your task at hand is to create a MySQL database for LinkedIn from scratch. The implementation details are up to you, though you should minimally ensure that your database meets the <a href="#platform">platform’s specification</a> and that it can represent the given <a href="#sample-data">sample data</a>. You’re welcome to use, or improve upon, your design of a SQLite database—just keep in mind that you’ll now have a <a href="https://dev.mysql.com/doc/refman/8.0/en/data-types.html">new set of types</a> at your disposal!</p>

## Platform

### Users

<p>The heart of LinkedIn’s platform is its people. Your database should be able to represent the following information about LinkedIn’s users:</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Their first and last name</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Their username</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Their password</li>
</ul>
<p>Keep in mind that, if a company is following best practices, application passwords are “<a href="https://en.wikipedia.org/wiki/Hash_function">hashed</a>.” No need to worry about hashing passwords here, though it might be helpful to know that some hashing algorithms can produce strings up to 128 characters long.</p>

### Schools and Universities

<p>LinkedIn also allows for official school or university accounts, such as <a href="https://www.linkedin.com/school/harvard-university/">that for Harvard</a>, so alumni (i.e., those who’ve attended) can identify their affiliation. Ensure that LinkedIn’s database can store the following information about each school:</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The name of the school</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The type of school</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The school’s location</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The year in which the school was founded</li>
</ul>
<p>You should assume that LinkedIn only allows schools to choose one of three types: “Primary,” “Secondary,” and “Higher Education.”</p>

### Companies

<p>LinkedIn allows companies to create their own pages, like the <a href="https://www.linkedin.com/company/linkedin/">one for LinkedIn itself</a>, so employees can identify their past or current employment with the company. Ensure that LinkedIn’s database can store the following information for each company:</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The name of the company</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The company’s industry</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The company’s location</li>
</ul>
<p>You should assume that LinkedIn only allows companies to choose from one of three industries: “Technology,” “Education,” and “Business.”</p>

### Connections

<p>And finally, the essence of LinkedIn is its ability to facilitate connections between people. Ensure LinkedIn’s database can support each of the following connections.</p>
<details><summary>Connections with People</summary><br/><p>LinkedIn’s database should be able to represent mutual (reciprocal, two-way) connections between <a href="#users">users</a>. No need to worry about one-way connections user A “following” user B without user B “following” user A.</p></details>
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
</ul></details>

## Sample Data

<p>Your database should be able to represent…</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>A user, <strong><a href="https://en.wikipedia.org/wiki/Claudine_Gay">Claudine Gay</a></strong>, whose username is “claudine” and password is “password”.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>A user, <strong><a href="https://en.wikipedia.org/wiki/Reid_Hoffman">Reid Hoffman</a></strong> whose username is “reid” and password is “password”.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>A school, <strong>Harvard University</strong>, which is a university located in Cambridge, Massachusetts, founded in 1636.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>A company, <strong>LinkedIn</strong>, which is a technology company headquartered in Sunnyvale, California.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Claudine Gay’s <strong>connection with Harvard</strong>, pursuing a PhD from January 1st, 1993, to December 31st, 1998.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Reid Hoffman’s <strong>connection with LinkedIn</strong>, with title “CEO and Chairman”, from January 1st, 2003 to February 1st, 2007</li>
</ul>

## Advice

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Consider the full range of MySQL’s supported types, which are documented in the MySQL 8.0 reference manual at <a href="https://dev.mysql.com/doc/refman/8.0/en/data-types.html">dev.mysql.com/doc/refman/8.0/en/data-types.html</a>.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Also consider the reference manual’s advice on choosing the right type for a column, documented at <a href="https://dev.mysql.com/doc/refman/8.0/en/choosing-types.html">dev.mysql.com/doc/refman/8.0/en/choosing-types.html</a>.
    <ul class="fa-ul">
      <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Among the high-level pieces of advice is to choose the most precise type for your use case. For instance, if you know an integer column will store only positive values, you should consider modifying the integer type with <code class="language-plaintext highlighter-rouge">UNSIGNED</code> (e.g., <code class="language-plaintext highlighter-rouge">INT UNSIGNED</code> or <code class="language-plaintext highlighter-rouge">TINYINT UNSIGNED</code>) to get the most range out of your type.</li>
    </ul>
  </li>
</ul>
