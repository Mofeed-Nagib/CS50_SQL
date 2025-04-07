# Problem to Solve

After the printing press, the postal service, and the telegram came the messaging apps. Chances are you’ve used a messaging app _today_—whether [Facebook Messenger](https://messenger.com/), [iMessage](https://mymessage.apple.com/), [Instagram](https://instagram.com/), [Signal](https://www.signal.org/) or [Snapchat](https://snapchat.com/), among many others. Whereas their early counterparts measured speed of communication in terms of weeks, days, or hours, messaging apps depend on a kind of speed that’s on the order of milliseconds: a message delayed is now a connection missed.

In this problem, you’ll write SQL queries for a fictional app that allows users to send pictures which expire 30 seconds after the recipient views them (an idea popularized by [Snapchat](https://snapchat.com/)!). The queries you’ll write will ultimately enable the app to implement its core features. Yet, given the app has several thousand users depending on instant communication, it’s especially important to write queries that are _fast_, not only _correct_. You’ll practice writing queries that take advantage of indexes, all in the service of letting users stay in touch in a snap.

# Schema

![Entity Relationship Diagram for snap.db](https://github.com/user-attachments/assets/d053db64-623a-41c6-8f78-1f9952ea2598)

Within `snap.db`, you’ll find three tables that implement the relationships described in the ER diagram above. Click the drop-downs below to learn more about the schema of each individual table.

<details><summary><code>users</code> table</summary><br/><p>The <code class="language-plaintext highlighter-rouge">users</code> table contains the following columns:</p>

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">id</code>, which is the user’s ID.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">username</code>, which is the user’s username.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">phone_number</code>, which is the user’s phone number.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">joined_date</code>, which is the date the user joined the app.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">last_login_date</code>, which is the date the user last logged in.</li>
</ul></details>

<details><summary><code>friends</code> table</summary><br/><p>The <code class="language-plaintext highlighter-rouge">friends</code> table contains the following columns:</p>

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">user_id</code>, which is the ID of a given user.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">friend_id</code>, which is the ID of the user with whom the given user is friends.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">friendship_date</code>, which is the date the friendship began.</li>
</ul>

<p>For each row, the user in the <code class="language-plaintext highlighter-rouge">user_id</code> column counts the user in the <code class="language-plaintext highlighter-rouge">friend_id</code> column among their friends—but not necessarily vice versa. When two users both count each other among their friends, two rows are inserted:</p>

<div class="bootstrap-table bootstrap5">
      <div class="fixed-table-toolbar"></div>
      </div>
      <table class="table table-bordered table-striped">
  <thead><tr><th data-field="0"><div class="th-inner "><div style="text-align: left">user_id</div></div><div class="fht-cell"></div></th><th data-field="1"><div class="th-inner "><div style="text-align: left">friend_id</div></div><div class="fht-cell"></div></th><th data-field="2"><div class="th-inner "><div style="text-align: left">friendship_date</div></div><div class="fht-cell"></div></th></tr></thead>
  <tbody><tr data-index="0"><td class="">1</td><td class="">2</td><td class="">2024-01-01</td></tr><tr data-index="1"><td class="">2</td><td class="">1</td><td class="">2024-01-01</td></tr></tbody>
</table></div>
      <div class="fixed-table-footer"></div>
      </div>
      <div class="fixed-table-pagination" style="display: none;"></div>
      </div><div class="clearfix"></div></details>

<details><summary><code>messages</code> table</summary><br/><p>The <code class="language-plaintext highlighter-rouge">messages</code> table contains the following columns:</p>

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">id</code>, which is the ID of the message.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">from_user_id</code>, which is the ID of the user who sent the message.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">to_user_id</code>, which is the ID of the user to whom the message was sent.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">picture</code>, which is the filename of the picture that was sent in the message.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">sent_timestamp</code>, which is the timestamp at which the message was sent.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">viewed_timestamp</code>, which is the timestamp at which the message was viewed.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">expires_timestamp</code>, which is the timestamp at which the message expires.</li>
</ul></details>

# Specification

In each corresponding `.sql` file, write a SQL query to implement the features described below. Since speed is of the essence, you’ll need to also ensure your query uses the specified index. The best way to ensure a query is using an index to check the results of `EXPLAIN QUERY PLAN`.

<p>If feeling unsure how to interpret the output of <code class="language-plaintext highlighter-rouge">EXPLAIN QUERY PLAN</code>, see the <a href="#advice">Advice</a> section for some additional explanation!</p> explanation!

### `1.sql`

The app’s user engagement team needs to identify active users. Find all usernames of users who have logged in since 2024-01-01. Ensure your query uses the `search_users_by_last_login index`, which is defined as follows:

```
CREATE INDEX "search_users_by_last_login"
ON "users"("last_login_date");
```
### `2.sql`

Users need to be prevented from re-opening a message that has expired. Find when the message with ID 151 expires. You may use the message’s ID directly in your query.

Ensure your query uses the index automatically created on the primary key column of the `messages` table.

### `3.sql`

The app needs to rank a user’s “best friends,” similar to Snapchat’s [“Friend Emojis” feature](https://help.snapchat.com/hc/en-us/articles/7012335460372). Find the user IDs of the top 3 users to whom `creativewisdom377` sends messages most frequently. Order the user IDs by the number of messages `creativewisdom377` has sent to those users, most to least.

Ensure your query uses the `search_messages_by_from_user_id` index, which is defined as follows:

```
CREATE INDEX "search_messages_by_from_user_id"
ON "messages"("from_user_id");
```

### `4.sql`

The app needs to send users a summary of their engagement. Find the username of the most popular user, defined as the user who has had the most messages sent to them.

Ensure your query uses the `search_messages_by_to_user_id` index, which is defined as follows:

```
CREATE INDEX "search_messages_by_to_user_id"
ON "messages"("to_user_id");
```

### `5.sql`

For any two users, the app needs to quickly show a list of the friends they have in common. Given two usernames, `lovelytrust487` and `exceptionalinspiration482`, find the user IDs of their mutual friends. A mutual friend is a user that both `lovelytrust487` and `exceptionalinspiration482` count among their friends.

Ensure your query uses the index automatically created on primary key columns of the `friends` table. This index is called `sqlite_autoindex_friends_1`.

# Advice

<details><summary>Use <code>EXPLAIN QUERY PLAN</code> to show a query's steps</summary><br/><p>To check the results of <code class="language-plaintext highlighter-rouge">EXPLAIN QUERY PLAN</code>, you need simply prepend <code class="language-plaintext highlighter-rouge">EXPLAIN QUERY PLAN</code> to your query:</p>

<div class="language-sql highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="k">EXPLAIN</span> <span class="n">QUERY</span> <span class="n">PLAN</span>
<span class="k">SELECT</span> <span class="nv">"username"</span>
<span class="k">FROM</span> <span class="nv">"users"</span>
<span class="k">WHERE</span> <span class="nv">"id"</span> <span class="o">=</span> <span class="mi">151</span><span class="p">;</span>
</code></pre></div></div></details>

<details><summary>Interpret the results of <code>EXPLAIN QUERY PLAN</code></summary><br/><p>Recall from lecture that <code class="language-plaintext highlighter-rouge">EXPLAIN QUERY PLAN</code> displays the steps the SQLite database engine will take to execute a given SQL query. The output of <code class="language-plaintext highlighter-rouge">EXPLAIN QUERY PLAN</code> can indicate whether a query is utilizing an index.</p>

<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>If you see a step labeled as <code class="language-plaintext highlighter-rouge">USING INDEX</code>, it signifies that the query is leveraging an index in that step.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>If you see a step labeled as <code class="language-plaintext highlighter-rouge">USING COVERING INDEX</code>, it indicates that the query is using a covering index in that step.
    <ul class="fa-ul">
      <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Recall that a covering index is a special type of index that includes all the columns needed for the query. This means the database can fulfill the query directly from the index without having to look up additional data in a table.</li>
    </ul>
  </li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>When you see a step labeled as <code class="language-plaintext highlighter-rouge">USING INTEGER PRIMARY KEY</code>, it implies that the query is utilizing the index on the primary key column, which is provided automatically by SQLite when the primary key is of the <code class="language-plaintext highlighter-rouge">INTEGER</code> type affinity. It is an efficient way to access rows directly if the query conditions involve a table’s primary key.</li>
</ul>

<p>Below are some examples of the results of <code class="language-plaintext highlighter-rouge">EXPLAIN QUERY PLAN</code>, from queries that use an index in at least one step of their execution:</p>

<a data-id="" id="example-1" style="top: -58px;"></a><h5><a data-id="" href="#example-1">Example 1</a></h5>

<div class="language-plaintext highlighter-rouge"><div class="highlight"><pre class="highlight"><code>QUERY PLAN
`--SEARCH users USING INDEX search_users_by_last_login (last_login_date&gt;?)
</code></pre></div></div>

<p>Notice that this query can be executed in a single step, by searching the index <code class="language-plaintext highlighter-rouge">search_users_by_last_login</code>.</p>

<a data-id="" id="example-2" style="top: -58px;"></a><h5><a data-id="" href="#example-2">Example 2</a></h5>

<div class="language-plaintext highlighter-rouge"><div class="highlight"><pre class="highlight"><code>QUERY PLAN
|--SEARCH messages USING COVERING INDEX search_messages_by_to_user_id (to_user_id=?)
`--SCALAR SUBQUERY 1
   `--SEARCH users USING COVERING INDEX sqlite_autoindex_users_1 (username=?)
</code></pre></div></div>

<p>Notice that this query requires two steps:</p>

<ol>
  <li>The first searches the index <code class="language-plaintext highlighter-rouge">search_messages_by_to_user_id</code>.</li>
  <li>The second resolves a subquery by searching the index <code class="language-plaintext highlighter-rouge">sqlite_autoindex_users_1</code>.</li>
</ol>

<a data-id="" id="example-3" style="top: -58px;"></a><h5><a data-id="" href="#example-3">Example 3</a></h5>

<div class="language-plaintext highlighter-rouge"><div class="highlight"><pre class="highlight"><code>QUERY PLAN
|--SEARCH messages USING INDEX search_messages_by_from_user_id (from_user_id=?)
|--SCALAR SUBQUERY 1
|  `--SEARCH users USING COVERING INDEX sqlite_autoindex_users_1 (username=?)
|--USE TEMP B-TREE FOR GROUP BY
`--USE TEMP B-TREE FOR ORDER BY
</code></pre></div></div>

<p>Notice that this query involves several steps, and that it uses indexes to accomplish most:</p>

<ol>
  <li>The first step searches the index <code class="language-plaintext highlighter-rouge">search_messages_by_from_user_id</code>.</li>
  <li>The second step searches the index <code class="language-plaintext highlighter-rouge">sqlite_autoindex_users_1</code>.</li>
  <li>The final steps use temporary B-trees to group and order the results.</li>
</ol>

<a data-id="" id="example-4" style="top: -58px;"></a><h5><a data-id="" href="#example-4">Example 4</a></h5>

<div class="language-plaintext highlighter-rouge"><div class="highlight"><pre class="highlight"><code>QUERY PLAN
|--SEARCH users USING INTEGER PRIMARY KEY (rowid=?)
`--SCALAR SUBQUERY 1
   |--SCAN messages USING COVERING INDEX search_messages_by_to_user_id
   `--USE TEMP B-TREE FOR ORDER BY
</code></pre></div></div>

<p>Notice that this query involves several steps, and that it uses indexes to accomplish most:</p>

<ol>
  <li>The first step searches an automatic primary key index.</li>
  <li>The second step scans rows using the index <code class="language-plaintext highlighter-rouge">search_messages_by_to_user_id</code>.</li>
  <li>The final step uses a temporary B-tree to order the results.</li>
</ol>

<a data-id="" id="example-5" style="top: -58px;"></a><h5><a data-id="" href="#example-5">Example 5</a></h5>

<div class="language-plaintext highlighter-rouge"><div class="highlight"><pre class="highlight"><code>QUERY PLAN
`--COMPOUND QUERY
   |--LEFT-MOST SUBQUERY
   |  |--SEARCH friends USING COVERING INDEX sqlite_autoindex_friends_1 (user_id=?)
   |  `--SCALAR SUBQUERY 1
   |     `--SEARCH users USING COVERING INDEX sqlite_autoindex_users_1 (username=?)
   `--INTERSECT USING TEMP B-TREE
      |--SEARCH friends USING COVERING INDEX sqlite_autoindex_friends_1 (user_id=?)
      `--SCALAR SUBQUERY 3
         `--SEARCH users USING COVERING INDEX sqlite_autoindex_users_1 (username=?)
</code></pre></div></div>

<p>Notice that this query involves many steps, and that it uses indexes to accomplish most. See in particular that the index <code class="language-plaintext highlighter-rouge">sqlite_autoindex_friends_1</code> is frequently accessed.</p></details>
