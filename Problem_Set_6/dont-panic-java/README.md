# Problem to Solve

<p>You’re a trained “pentester.” After your success in an <a href="../../../3/dont-panic/">earlier operation</a>, a new company has hired you to perform a <a href="https://en.wikipedia.org/wiki/Penetration_test">penetration test</a> and report the vulnerabilities in their data system. This time, you suspect you can do better by writing a program in Java that automates your hack.</p>
<p>To succeed in this covert operation, you’ll need to…</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><strong>Connect</strong>, via Java, to a SQLite database.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><strong>Alter</strong>, within your Java program, the administrator’s password.</li>
</ul>
<p>If you don’t have experience with Java, not to worry! This problem will walk you through each step along the way.</p>

# Specification

<p>In <code class="language-plaintext highlighter-rouge">Hack.java</code>, write a Java program to achieve the following:</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><strong>Connect</strong>, via Java, to a SQLite database.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><strong>Alter</strong>, within your Java program, the administrator’s password.</li>
</ul>
<p>When your program in <code class="language-plaintext highlighter-rouge">Hack.java</code> is run on a new instance of the database, it should produce the above results.</p>
<p>Clock’s ticking!</p>

# Walkthrough

<blockquote><p>If you’re new to Java (or to connecting Java with SQL!) this walkthrough will guide you through each of this problem’s steps.</p></blockquote>

## Java

<p>When you download the distribution code for this problem, you should notice a file named <code class="language-plaintext highlighter-rouge">Hack.java</code>. You can tell this program is a Java program because it ends with <code class="language-plaintext highlighter-rouge">.java</code>. The <code class="language-plaintext highlighter-rouge">.java</code> extension identifies files as Java files much like how the <code class="language-plaintext highlighter-rouge">.sql</code> extension identifies files as a set of SQL statements.</p>
<p>At first, <code class="language-plaintext highlighter-rouge">Hack.java</code> should only include the following:</p>
<div class="language-java highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="kd">public</span> <span class="kd">class</span> <span class="nc">Hack</span> <span class="o">{</span>
    <span class="kd">public</span> <span class="kd">static</span> <span class="kt">void</span> <span class="nf">main</span><span class="o">(</span><span class="nc">String</span><span class="o">[]</span> <span class="n">args</span><span class="o">)</span> <span class="kd">throws</span> <span class="nc">Exception</span> <span class="o">{</span>
        <span class="nc">System</span><span class="o">.</span><span class="na">out</span><span class="o">.</span><span class="na">println</span><span class="o">(</span><span class="s">"Hacked!"</span><span class="o">);</span>
    <span class="o">}</span>
<span class="o">}</span></code></pre></div></div>
<p>To run this Java program, ensure that—when you type <code class="language-plaintext highlighter-rouge">ls</code>—you see <code class="language-plaintext highlighter-rouge">Hack.java</code> among the files in your current directory. Then, execute the below in your terminal:</p>
<div class="language-bash highlighter-rouge"><div class="highlight"><pre class="highlight"><code>javac Hack.java</code></pre></div></div>
<p><code class="language-plaintext highlighter-rouge">javac</code> <em>compiles</em> the program in <code class="language-plaintext highlighter-rouge">Hack.java</code> to a file named <code class="language-plaintext highlighter-rouge">Hack.class</code>. To compile a program means to translate a program from one language to another—in this case, from Java source code (the code you wrote yourself!) to Java “bytecode” (the code understandable to the the <code class="language-plaintext highlighter-rouge">java</code> program on your computer). You should then see a new file named <code class="language-plaintext highlighter-rouge">Hack.class</code>. Execute the following to run <code class="language-plaintext highlighter-rouge">Hack.class</code>, the compiled program:</p>
<div class="language-bash highlighter-rouge"><div class="highlight"><pre class="highlight"><code>java Hack</code></pre></div></div>
<p>If all’s gone well, you should see “Hacked!” printed to your terminal. Not quite a hack, but you’re on your way!</p>

## Java’s SQL Package

<p>Imagine your Java program wants to talk to a SQLite database, a bit like how you might call up a friend. But—unlike when you call your friend—there’s a problem: your Java program and the SQLite database don’t speak the same language.</p>
<p>For that reason, the process of connecting your Java program to a database is all about ensuring your Java program and SQLite have some intermediary that can translate statements between them. That’s where Java’s SQL <em>package</em> comes in! A package is a collection of code that someone else has written to solve a problem (and, importantly, which you can use in your own Java program!).</p>
<p>Java’s standard SQL package provides you with a few tools to translate statements between your Java program and SQLite: <code class="language-plaintext highlighter-rouge">DriverManager</code>, <code class="language-plaintext highlighter-rouge">Connection</code>, and <code class="language-plaintext highlighter-rouge">Statement</code>. Each has a role to play in your program:</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">DriverManager</code> begins a database connection. It sets up a particular <em>driver</em> (that is, an intermediary program) to translate statements between your Java program and your database.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>A <code class="language-plaintext highlighter-rouge">Connection</code> is what is created by <code class="language-plaintext highlighter-rouge">DriverManager</code>. It represents a connection to a database and, as such, all SQL statements run through it.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>A <code class="language-plaintext highlighter-rouge">Statement</code> is the messenger that relays SQL statements through the database connection.</li>
</ul>
<p>To include these tools in your program, add the following <code class="language-plaintext highlighter-rouge">import</code> statements:</p>
<div class="language-java highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="kn">import</span> <span class="nn">java.sql.Connection</span><span class="o">;</span>
<span class="kn">import</span> <span class="nn">java.sql.DriverManager</span><span class="o">;</span>
<span class="kn">import</span> <span class="nn">java.sql.Statement</span><span class="o">;</span>
<span class="kd">public</span> <span class="kd">class</span> <span class="nc">Hack</span> <span class="o">{</span>
    <span class="kd">public</span> <span class="kd">static</span> <span class="kt">void</span> <span class="nf">main</span><span class="o">(</span><span class="nc">String</span><span class="o">[]</span> <span class="n">args</span><span class="o">)</span> <span class="kd">throws</span> <span class="nc">Exception</span> <span class="o">{</span>
        <span class="nc">System</span><span class="o">.</span><span class="na">out</span><span class="o">.</span><span class="na">println</span><span class="o">(</span><span class="s">"Hacked!"</span><span class="o">);</span>
    <span class="o">}</span>
<span class="o">}</span></code></pre></div></div>
<p>Try recompiling your Java program, as with <code class="language-plaintext highlighter-rouge">javac Hack.java</code>, and running it, as with <code class="language-plaintext highlighter-rouge">java Hack</code>. Nothing much should change, but that’s actually a good sign!</p>

## Connecting to a Database

<p>As mentioned before, you can use <code class="language-plaintext highlighter-rouge">DriverManager</code> to establish a connection to <code class="language-plaintext highlighter-rouge">dont-panic.db</code>. To do so, replace <code class="language-plaintext highlighter-rouge">System.out.println("Hacked!");</code> with the below:</p>
<div class="language-java highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="nc">Connection</span> <span class="n">sqliteConnection</span> <span class="o">=</span> <span class="nc">DriverManager</span><span class="o">.</span><span class="na">getConnection</span><span class="o">(</span><span class="s">"jdbc:sqlite:dont-panic.db"</span><span class="o">);</span></code></pre></div></div>
<p>This line of Java code is composed of a few pieces:</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">Connection sqliteConnection</code>, which initializes a <code class="language-plaintext highlighter-rouge">Connection</code> named <code class="language-plaintext highlighter-rouge">sqliteConnection</code>. Henceforth in your program, you can use <code class="language-plaintext highlighter-rouge">sqliteConnection</code> to reference the connection between your Java program and your database.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">DriverManager.getConnection(...)</code>, which establishes a connection the database given as input within the parentheses.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">jdbc:sqlite:dont-panic.db</code>, which is a URL (similar to a website URL!) that identifies the database to which to connect (<code class="language-plaintext highlighter-rouge">dont-panic.db</code>) and the SQL dialect to which to translate (<code class="language-plaintext highlighter-rouge">sqlite</code>, in this case, as opposed to <code class="language-plaintext highlighter-rouge">mysql</code> or <code class="language-plaintext highlighter-rouge">postgres</code>).</li>
</ul>
<p>Your program should now look as follows:</p>
<div class="language-java highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="kn">import</span> <span class="nn">java.sql.Connection</span><span class="o">;</span>
<span class="kn">import</span> <span class="nn">java.sql.DriverManager</span><span class="o">;</span>
<span class="kn">import</span> <span class="nn">java.sql.Statement</span><span class="o">;</span>
<span class="kd">public</span> <span class="kd">class</span> <span class="nc">Hack</span> <span class="o">{</span>
    <span class="kd">public</span> <span class="kd">static</span> <span class="kt">void</span> <span class="nf">main</span><span class="o">(</span><span class="nc">String</span><span class="o">[]</span> <span class="n">args</span><span class="o">)</span> <span class="kd">throws</span> <span class="nc">Exception</span> <span class="o">{</span>
        <span class="nc">Connection</span> <span class="n">sqliteConnection</span> <span class="o">=</span> <span class="nc">DriverManager</span><span class="o">.</span><span class="na">getConnection</span><span class="o">(</span><span class="s">"jdbc:sqlite:dont-panic.db"</span><span class="o">);</span>
    <span class="o">}</span>
<span class="o">}</span></code></pre></div></div>
<p>However, if you run <code class="language-plaintext highlighter-rouge">javac Hack.java</code> and <code class="language-plaintext highlighter-rouge">java Hack</code> to compile and run your updated program, you might encounter an error:</p>
<div class="language-plaintext highlighter-rouge"><div class="highlight"><pre class="highlight"><code>Exception in thread "main" java.sql.SQLException: No suitable driver found for jdbc:sqlite:dont-panic.db
        at java.sql/java.sql.DriverManager.getConnection(DriverManager.java:708)
        at java.sql/java.sql.DriverManager.getConnection(DriverManager.java:253)
        at Hack.main(Hack.java:7)
</code></pre></div></div>
<p>You might notice in particular that there is “No suitable driver found for <code class="language-plaintext highlighter-rouge">jdbc:sqlite:dont-panic.db</code>.” In other words, Java is telling you it can’t find the program to translate between Java and SQLite!</p>
<p>To fix this issue, you’ll need to add the Java SQLite driver to your project. Once you do, your Java program and the SQLite database can start talking to each other.</p>
<p>Compile your program as usual with <code class="language-plaintext highlighter-rouge">javac Hack.java</code>. But instead of running <code class="language-plaintext highlighter-rouge">java Hack</code>, execute the following:</p>
<div class="language-bash highlighter-rouge"><div class="highlight"><pre class="highlight"><code>java <span class="nt">-cp</span> .:sqlite-jdbc-3.43.0.0.jar Hack</code></pre></div></div>
<p>This command is composed of a few pieces:</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">-cp</code>, which stands for “Class Path.” It’s a way of telling Java where to look for extra things your program needs, like the Java SQLite driver.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">.</code>, which means “look in the current directory.” That’s where Java finds your <code class="language-plaintext highlighter-rouge">Hack.class</code> file.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">:</code>, which is similar to saying “and also look over here.” It’s how you separate different places Java should search.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">sqlite-jdbc-3.43.0.0.jar</code>, which is the name of the file that contains the SQLite driver.</li>
</ul>
<p>Putting it all together, <code class="language-plaintext highlighter-rouge">java -cp .:sqlite-jdbc-3.43.0.0.jar Hack</code> tells Java to run the Hack class and, at the same time, use the current directory and the <code class="language-plaintext highlighter-rouge">sqlite-jdbc-3.43.0.0.jar</code> file to find any extra programs it might need.</p>
<p>Try running your program now. You might not see anything happen and, if so, that’s a good sign!</p>

## Executing SQL Statements with Java

<p>Once you’ve created a connection to a database, you can start executing SQL statements. As mentioned above, you can use <code class="language-plaintext highlighter-rouge">Statement</code> to relay SQL statements through your newly created database connection: a <code class="language-plaintext highlighter-rouge">Statement</code> is like a messenger between your Java program and the database to which you’ve connected.</p>
<p>Here’s how you can set up and execute an <code class="language-plaintext highlighter-rouge">UPDATE</code> statement:</p>
<div class="language-java highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="kn">import</span> <span class="nn">java.sql.Connection</span><span class="o">;</span>
<span class="kn">import</span> <span class="nn">java.sql.DriverManager</span><span class="o">;</span>
<span class="kn">import</span> <span class="nn">java.sql.Statement</span><span class="o">;</span>
<span class="kd">public</span> <span class="kd">class</span> <span class="nc">Hack</span> <span class="o">{</span>
    <span class="kd">public</span> <span class="kd">static</span> <span class="kt">void</span> <span class="nf">main</span><span class="o">(</span><span class="nc">String</span><span class="o">[]</span> <span class="n">args</span><span class="o">)</span> <span class="kd">throws</span> <span class="nc">Exception</span> <span class="o">{</span>
        <span class="nc">Connection</span> <span class="n">sqliteConnection</span> <span class="o">=</span> <span class="nc">DriverManager</span><span class="o">.</span><span class="na">getConnection</span><span class="o">(</span><span class="s">"jdbc:sqlite:dont-panic.db"</span><span class="o">);</span>
        <span class="nc">Statement</span> <span class="n">sqliteStatement</span> <span class="o">=</span> <span class="n">sqliteConnection</span><span class="o">.</span><span class="na">createStatement</span><span class="o">();</span>
        <span class="n">sqliteStatement</span><span class="o">.</span><span class="na">executeUpdate</span><span class="o">(</span><span class="sh">"""
            UPDATE "users"
            SET "password" = 'hacked!'
            WHERE "username" = 'admin';
        """</span><span class="o">);</span>
        <span class="n">sqliteConnection</span><span class="o">.</span><span class="na">close</span><span class="o">();</span>
    <span class="o">}</span>
<span class="o">}</span></code></pre></div></div>
<p>Notice that you first create a <code class="language-plaintext highlighter-rouge">Statement</code> named <code class="language-plaintext highlighter-rouge">sqliteStatement</code>. <code class="language-plaintext highlighter-rouge">sqliteStatement</code> is created by using a <em>method</em> of <code class="language-plaintext highlighter-rouge">sqliteConnection</code> called <code class="language-plaintext highlighter-rouge">createStatement</code>. A method is some piece of code that takes an input and produces some output: in this case, a <code class="language-plaintext highlighter-rouge">Statement</code>!</p>
<p>Next, you can use <code class="language-plaintext highlighter-rouge">sqliteStatement</code>’s <code class="language-plaintext highlighter-rouge">executeUpdate</code> method, which takes as input any SQL query that writes to the database. <code class="language-plaintext highlighter-rouge">executeUpdate</code> relays the statement to the database and runs it. Once the update is complete, you can close the connection to the database, using <code class="language-plaintext highlighter-rouge">sqliteConnection</code>’s <code class="language-plaintext highlighter-rouge">close</code> method.</p>
<p>After you re-compile and run your program, try opening <code class="language-plaintext highlighter-rouge">dont-panic.db</code> with <code class="language-plaintext highlighter-rouge">sqlite3</code>. When you view the administrator’s password, you should find it is now “hacked!”</p>
<p>If at any point you’d like to reset <code class="language-plaintext highlighter-rouge">dont-panic.db</code> to its original state, recall that you can use <code class="language-plaintext highlighter-rouge">reset.sql</code>.</p>

## Prepared Statements

<p>Imagine you wanted a user to determine the new administrative password <em>as your Java program runs</em>.</p>
<p>Recall from lecture that a prepared statement is a SQL query with placeholders for values that are inserted (“interpolated”) later. Since you don’t know what password your program’s user will choose, the best you can do is set a placeholder for the password and allow your program to interpolate the user-chosen password later. Using a prepared statement, then, can help!</p>
<p>The <code class="language-plaintext highlighter-rouge">java.sql</code> package supports using prepared statements. First, replace importing <code class="language-plaintext highlighter-rouge">java.sql.Statement</code> with importing <code class="language-plaintext highlighter-rouge">java.sql.PreparedStatement</code> and write your query with a <code class="language-plaintext highlighter-rouge">?</code> as a placeholder:</p>
<div class="language-java highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="kn">import</span> <span class="nn">java.sql.Connection</span><span class="o">;</span>
<span class="kn">import</span> <span class="nn">java.sql.DriverManager</span><span class="o">;</span>
<span class="kn">import</span> <span class="nn">java.sql.PreparedStatement</span><span class="o">;</span>
<span class="kd">public</span> <span class="kd">class</span> <span class="nc">Hack</span> <span class="o">{</span>
    <span class="kd">public</span> <span class="kd">static</span> <span class="kt">void</span> <span class="nf">main</span><span class="o">(</span><span class="nc">String</span><span class="o">[]</span> <span class="n">args</span><span class="o">)</span> <span class="kd">throws</span> <span class="nc">Exception</span> <span class="o">{</span>
        <span class="nc">Connection</span> <span class="n">sqliteConnection</span> <span class="o">=</span> <span class="nc">DriverManager</span><span class="o">.</span><span class="na">getConnection</span><span class="o">(</span><span class="s">"jdbc:sqlite:dont-panic.db"</span><span class="o">);</span>
        <span class="nc">String</span> <span class="n">query</span> <span class="o">=</span> <span class="sh">"""
            UPDATE "users"
            SET "password" = ?
            WHERE "username" = 'admin';
        """</span><span class="o">;</span>
        <span class="n">sqliteConnection</span><span class="o">.</span><span class="na">close</span><span class="o">();</span>
    <span class="o">}</span>
<span class="o">}</span></code></pre></div></div>
<p>Next, use the <code class="language-plaintext highlighter-rouge">prepareStatement</code> and <code class="language-plaintext highlighter-rouge">setString</code> methods to substitute some value for that placeholder.</p>
<div class="language-java highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="kn">import</span> <span class="nn">java.sql.Connection</span><span class="o">;</span>
<span class="kn">import</span> <span class="nn">java.sql.DriverManager</span><span class="o">;</span>
<span class="kn">import</span> <span class="nn">java.sql.PreparedStatement</span><span class="o">;</span>
<span class="kd">public</span> <span class="kd">class</span> <span class="nc">Hack</span> <span class="o">{</span>
    <span class="kd">public</span> <span class="kd">static</span> <span class="kt">void</span> <span class="nf">main</span><span class="o">(</span><span class="nc">String</span><span class="o">[]</span> <span class="n">args</span><span class="o">)</span> <span class="kd">throws</span> <span class="nc">Exception</span> <span class="o">{</span>
        <span class="nc">Connection</span> <span class="n">sqliteConnection</span> <span class="o">=</span> <span class="nc">DriverManager</span><span class="o">.</span><span class="na">getConnection</span><span class="o">(</span><span class="s">"jdbc:sqlite:dont-panic.db"</span><span class="o">);</span>
        <span class="nc">String</span> <span class="n">query</span> <span class="o">=</span> <span class="sh">"""
            UPDATE "users"
            SET "password" = ?
            WHERE "username" = 'admin';
        """</span><span class="o">;</span>
        <span class="nc">PreparedStatement</span> <span class="n">sqliteStatement</span> <span class="o">=</span> <span class="n">sqliteConnection</span><span class="o">.</span><span class="na">prepareStatement</span><span class="o">(</span><span class="n">query</span><span class="o">);</span>
        <span class="n">sqliteStatement</span><span class="o">.</span><span class="na">setString</span><span class="o">(</span><span class="mi">1</span><span class="o">,</span> <span class="s">"hacked!"</span><span class="o">);</span>
        <span class="n">sqliteStatement</span><span class="o">.</span><span class="na">executeUpdate</span><span class="o">();</span>
        <span class="n">sqliteConnection</span><span class="o">.</span><span class="na">close</span><span class="o">();</span>
    <span class="o">}</span>
<span class="o">}</span></code></pre></div></div>
<p>And finally, consider what you could do to get user input. While we won’t dive into all the details of how to collect user input with Java, suffice to say that the following should work!</p>
<div class="language-java highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="kn">import</span> <span class="nn">java.sql.Connection</span><span class="o">;</span>
<span class="kn">import</span> <span class="nn">java.sql.DriverManager</span><span class="o">;</span>
<span class="kn">import</span> <span class="nn">java.sql.PreparedStatement</span><span class="o">;</span>
<span class="kn">import</span> <span class="nn">java.util.Scanner</span><span class="o">;</span>
<span class="kd">public</span> <span class="kd">class</span> <span class="nc">Hack</span> <span class="o">{</span>
    <span class="kd">public</span> <span class="kd">static</span> <span class="kt">void</span> <span class="nf">main</span><span class="o">(</span><span class="nc">String</span><span class="o">[]</span> <span class="n">args</span><span class="o">)</span> <span class="kd">throws</span> <span class="nc">Exception</span> <span class="o">{</span>
        <span class="nc">Scanner</span> <span class="n">scanner</span> <span class="o">=</span> <span class="k">new</span> <span class="nc">Scanner</span><span class="o">(</span><span class="nc">System</span><span class="o">.</span><span class="na">in</span><span class="o">);</span>
        <span class="nc">System</span><span class="o">.</span><span class="na">out</span><span class="o">.</span><span class="na">println</span><span class="o">(</span><span class="s">"Enter the new password: "</span><span class="o">);</span>
        <span class="nc">String</span> <span class="n">password</span> <span class="o">=</span> <span class="n">scanner</span><span class="o">.</span><span class="na">nextLine</span><span class="o">();</span>
        <span class="nc">Connection</span> <span class="n">sqliteConnection</span> <span class="o">=</span> <span class="nc">DriverManager</span><span class="o">.</span><span class="na">getConnection</span><span class="o">(</span><span class="s">"jdbc:sqlite:dont-panic.db"</span><span class="o">);</span>
        <span class="nc">String</span> <span class="n">query</span> <span class="o">=</span> <span class="sh">"""
            UPDATE "users"
            SET "password" = ?
            WHERE "username" = 'admin';
        """</span><span class="o">;</span>
        <span class="nc">PreparedStatement</span> <span class="n">sqliteStatement</span> <span class="o">=</span> <span class="n">sqliteConnection</span><span class="o">.</span><span class="na">prepareStatement</span><span class="o">(</span><span class="n">query</span><span class="o">);</span>
        <span class="n">sqliteStatement</span><span class="o">.</span><span class="na">setString</span><span class="o">(</span><span class="mi">1</span><span class="o">,</span> <span class="n">password</span><span class="o">);</span>
        <span class="n">sqliteStatement</span><span class="o">.</span><span class="na">executeUpdate</span><span class="o">();</span>
        <span class="n">sqliteConnection</span><span class="o">.</span><span class="na">close</span><span class="o">();</span>
        <span class="n">scanner</span><span class="o">.</span><span class="na">close</span><span class="o">();</span>
    <span class="o">}</span>
<span class="o">}</span></code></pre></div></div>
<p>Now, try running your program and viewing the changes in <code class="language-plaintext highlighter-rouge">dont-panic.db</code>!</p>
