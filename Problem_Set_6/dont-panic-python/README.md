# Problem to Solve

<p>You’re a trained “pentester.” After your success in an <a href="../../../3/dont-panic/">earlier operation</a>, a new company has hired you to perform a <a href="https://en.wikipedia.org/wiki/Penetration_test">penetration test</a> and report the vulnerabilities in their data system. This time, you suspect you can do better by writing a program in Python that automates your hack.</p>
<p>To succeed in this covert operation, you’ll need to…</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><strong>Connect</strong>, via Python, to a SQLite database.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><strong>Alter</strong>, within your Python program, the administrator’s password.</li>
</ul>
<p>If you don’t have experience with Python, not to worry! This problem will walk you through each step along the way.</p>

# Specification

<p>In <code class="language-plaintext highlighter-rouge">hack.py</code>, write a Python program to achieve the following:</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><strong>Connect</strong>, via Python, to a SQLite database.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><strong>Alter</strong>, within your Python program, the administrator’s password.</li>
</ul>
<p>When your program in <code class="language-plaintext highlighter-rouge">hack.py</code> is run on a new instance of the database, it should produce the above results.</p>
<p>Clock’s ticking!</p>

# Walkthrough

<blockquote><p>If you’re new to Python (or to connecting Python with SQL!) this walkthrough will guide you through each of this problem’s steps.</p></blockquote>

## Python

<p>When you download the distribution code for this problem, you should notice a file named <code class="language-plaintext highlighter-rouge">hack.py</code>. You can tell this program is a Python program because it ends with <code class="language-plaintext highlighter-rouge">.py</code>. The <code class="language-plaintext highlighter-rouge">.py</code> extension identifies files as Python files much like how the <code class="language-plaintext highlighter-rouge">.sql</code> extension identifies files as a set of SQL statements.</p>
<p>At first, <code class="language-plaintext highlighter-rouge">hack.py</code> should only include a single line of Python code:</p>
<div class="language-py highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="nf">print</span><span class="p">(</span><span class="sh">"</span><span class="s">Hacked!</span><span class="sh">"</span><span class="p">)</span>
</code></pre></div></div>
<p>To run this Python program, ensure that—when you type <code class="language-plaintext highlighter-rouge">ls</code>—you see <code class="language-plaintext highlighter-rouge">hack.py</code> among the files in your current directory. Then, execute the below in your terminal:</p>
<div class="language-bash highlighter-rouge"><div class="highlight"><pre class="highlight"><code>python hack.py
</code></pre></div></div>
<p>You should see “Hacked!” in your terminal window. Not quite a hack, but you’re on your way!</p>

## Connecting to a Database

<p>Now that you’re able to run your Python program, the next step is to connect your program to <code class="language-plaintext highlighter-rouge">dont-panic.db</code>. To do so, you’ll need to make use of CS50’s <em>library</em> for Python. A library is a collection of code that someone else has written to solve a problem (and, importantly, which you can use in your own program!). In this case, one of the problems the CS50 library for Python helps you solve is the process of connecting to a SQLite database.</p>
<p>To use the CS50 library’s SQL functionality in your own program, replace <code class="language-plaintext highlighter-rouge">print("Hacked!")</code> with the below:</p>
<div class="language-py highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="kn">from</span> <span class="n">cs50</span> <span class="kn">import</span> <span class="n">SQL</span>
</code></pre></div></div>
<p>This line of Python code says that your program should grab (“import”) tools related to SQL from the CS50 library, called <code class="language-plaintext highlighter-rouge">cs50</code>.</p>
<p>With this library now included in your program, establishing a connection to <code class="language-plaintext highlighter-rouge">dont-panic.db</code> is as simple as one line of Python code:</p>
<div class="language-py highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="kn">from</span> <span class="n">cs50</span> <span class="kn">import</span> <span class="n">SQL</span>
<span class="n">db</span> <span class="o">=</span> <span class="nc">SQL</span><span class="p">(</span><span class="sh">"</span><span class="s">sqlite:///dont-panic.db</span><span class="sh">"</span><span class="p">)</span>
</code></pre></div></div>
<p>You can break this line of code into the following pieces:</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">db = SQL(...)</code>, which establishes a connection to the database given as an input, within the parentheses. This line of code also ensures you can refer to your database connection as <code class="language-plaintext highlighter-rouge">db</code> henceforth in your program.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">sqlite:///dont-panic.db</code> is a URL (similar to a website URL!) that identifies the database to which to connect (<code class="language-plaintext highlighter-rouge">dont-panic.db</code>) and which SQL dialect to use (<code class="language-plaintext highlighter-rouge">sqlite</code>, in this case, as opposed to <code class="language-plaintext highlighter-rouge">mysql</code> or <code class="language-plaintext highlighter-rouge">postgres</code>).</li>
</ul>
<p>If you’re feeling more comfortable, you can learn more about this line of code in the <a href="https://cs50.readthedocs.io/libraries/cs50/python/#cs50.SQL">documentation for CS50’s library for Python</a>.</p>
<p>Try running your program now. You might not see anything happen and, if so, that’s a good sign!</p>

## Executing SQL Statements with Python

<p>The CS50 library for Python’s SQL functionality comes with a <em>method</em> called <code class="language-plaintext highlighter-rouge">execute</code>. A method receives an input and produces an output. For instance, a method might take a SQL statement as input, execute that SQL statement on a database, and return to you the results of the SQL statement. In fact, that’s exactly what the <code class="language-plaintext highlighter-rouge">execute</code> method does!</p>
<div class="language-py highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="kn">from</span> <span class="n">cs50</span> <span class="kn">import</span> <span class="n">SQL</span>


<span class="n">db</span> <span class="o">=</span> <span class="nc">SQL</span><span class="p">(</span><span class="sh">"</span><span class="s">sqlite:///dont-panic.db</span><span class="sh">"</span><span class="p">)</span>
<span class="n">db</span><span class="p">.</span><span class="nf">execute</span><span class="p">(</span>
    <span class="sh">"""</span><span class="s">
    UPDATE </span><span class="sh">"</span><span class="s">users</span><span class="sh">"</span><span class="s">
    SET </span><span class="sh">"</span><span class="s">password</span><span class="sh">"</span><span class="s"> = </span><span class="sh">'</span><span class="s">hacked!</span><span class="sh">'</span><span class="s">
    WHERE </span><span class="sh">"</span><span class="s">username</span><span class="sh">"</span><span class="s"> = </span><span class="sh">'</span><span class="s">admin</span><span class="sh">'</span><span class="s">;       
    </span><span class="sh">"""</span>
<span class="p">)</span>
</code></pre></div></div>
<p>Notice that, inside the parentheses associated with the <code class="language-plaintext highlighter-rouge">execute</code> method, you’ve now written a fully-formed SQL query. When you run your Python program, the SQL query will be executed on the database.</p>
<p>After you run your program, try opening <code class="language-plaintext highlighter-rouge">dont-panic.db</code> with <code class="language-plaintext highlighter-rouge">sqlite3</code>. When you view the administrator’s password, you should find it is now “hacked!”</p>
<p>If at any point you’d like to reset <code class="language-plaintext highlighter-rouge">dont-panic.db</code> to its original state, recall that you can use <code class="language-plaintext highlighter-rouge">reset.sql</code>.</p>

## Prepared Statements

<p>Imagine you wanted a user to determine the new administrative password <em>as your Python program runs</em>.</p>
<p>Recall from lecture that a prepared statement is a SQL query with placeholders for values that are inserted (“interpolated”) later. Since you don’t know what password your program’s user will choose, the best you can do is set a placeholder for the password and allow your program to interpolate the user-chosen password later. Using a prepared statement, then, can help!</p>
<p>The CS50 library for Python supports using prepared statements. First, modify your program to take input from the user:</p>
<div class="language-py highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="kn">from</span> <span class="n">cs50</span> <span class="kn">import</span> <span class="n">SQL</span>


<span class="n">db</span> <span class="o">=</span> <span class="nc">SQL</span><span class="p">(</span><span class="sh">"</span><span class="s">sqlite:///dont-panic.db</span><span class="sh">"</span><span class="p">)</span>
<span class="n">password</span> <span class="o">=</span> <span class="nf">input</span><span class="p">(</span><span class="sh">"</span><span class="s">Enter a password: </span><span class="sh">"</span><span class="p">)</span>
<span class="n">db</span><span class="p">.</span><span class="nf">execute</span><span class="p">(</span>
    <span class="sh">"""</span><span class="s">
    UPDATE </span><span class="sh">"</span><span class="s">users</span><span class="sh">"</span><span class="s">
    SET </span><span class="sh">"</span><span class="s">password</span><span class="sh">"</span><span class="s"> = </span><span class="sh">'</span><span class="s">oops!</span><span class="sh">'</span><span class="s">
    WHERE </span><span class="sh">"</span><span class="s">username</span><span class="sh">"</span><span class="s"> = </span><span class="sh">'</span><span class="s">admin</span><span class="sh">'</span><span class="s">;       
    </span><span class="sh">"""</span>
<span class="p">)</span>
</code></pre></div></div>
<p>Notice that if you now run your program, you’re prompted for a password. Whatever you enter is stored in the <em>variable</em> named <code class="language-plaintext highlighter-rouge">password</code>. A variable is a name for a value that can change.</p>
<p>Now, modify your SQL query to be a prepared statement. In CS50’s library, you can use a <code class="language-plaintext highlighter-rouge">?</code> to represent a placeholder for a value you’ll supply later.</p>
<div class="language-py highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="kn">from</span> <span class="n">cs50</span> <span class="kn">import</span> <span class="n">SQL</span>
<span class="n">db</span> <span class="o">=</span> <span class="nc">SQL</span><span class="p">(</span><span class="sh">"</span><span class="s">sqlite:///dont-panic.db</span><span class="sh">"</span><span class="p">)</span>
<span class="n">password</span> <span class="o">=</span> <span class="nf">input</span><span class="p">(</span><span class="sh">"</span><span class="s">Enter a password: </span><span class="sh">"</span><span class="p">)</span>
<span class="n">db</span><span class="p">.</span><span class="nf">execute</span><span class="p">(</span>
    <span class="sh">"""</span><span class="s">
    UPDATE </span><span class="sh">"</span><span class="s">users</span><span class="sh">"</span><span class="s">
    SET </span><span class="sh">"</span><span class="s">password</span><span class="sh">"</span><span class="s"> = ?
    WHERE </span><span class="sh">"</span><span class="s">username</span><span class="sh">"</span><span class="s"> = </span><span class="sh">'</span><span class="s">admin</span><span class="sh">'</span><span class="s">;       
    </span><span class="sh">"""</span>
<span class="p">)</span>
</code></pre></div></div>
<p>The last step, of course, is to tell the <code class="language-plaintext highlighter-rouge">execute</code> method which value it should substitute for the placeholder. To do that, you can add the value to substitute after the SQL query, separated by a comma:</p>
<div class="language-py highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="kn">from</span> <span class="n">cs50</span> <span class="kn">import</span> <span class="n">SQL</span>
<span class="n">db</span> <span class="o">=</span> <span class="nc">SQL</span><span class="p">(</span><span class="sh">"</span><span class="s">sqlite:///dont-panic.db</span><span class="sh">"</span><span class="p">)</span>
<span class="n">password</span> <span class="o">=</span> <span class="nf">input</span><span class="p">(</span><span class="sh">"</span><span class="s">Enter a password: </span><span class="sh">"</span><span class="p">)</span>
<span class="n">db</span><span class="p">.</span><span class="nf">execute</span><span class="p">(</span>
    <span class="sh">"""</span><span class="s">
    UPDATE </span><span class="sh">"</span><span class="s">users</span><span class="sh">"</span><span class="s">
    SET </span><span class="sh">"</span><span class="s">password</span><span class="sh">"</span><span class="s"> = ?
    WHERE </span><span class="sh">"</span><span class="s">username</span><span class="sh">"</span><span class="s"> = </span><span class="sh">'</span><span class="s">admin</span><span class="sh">'</span><span class="s">;       
    </span><span class="sh">"""</span><span class="p">,</span>
    <span class="n">password</span>
<span class="p">)</span>
</code></pre></div></div>
<p>Now, try running your program and viewing the changes in <code class="language-plaintext highlighter-rouge">dont-panic.db</code>!</p>
