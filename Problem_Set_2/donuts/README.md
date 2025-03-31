# Problem to Solve

Around Boston, Brookline, and Somerville, you might catch sight of Union Square Donuts, a shop famous in the area for its delicious confections. Suppose that Union Square Donuts has been around for a while and, while their paper receipts have worked well so far, they’re hoping for a system to help them handle more customers. In fact, they’ve just hired you to design a database fitting for their shop. In exchange, free donuts? 🍩

In a file called `schema.sql` in a folder called `donuts`, write a set of SQL statements to create a database that Union Square Donuts could use to manage their day-to-day operations.

# Specification

<p>Your task at hand is to create a SQLite database for Union Square Donuts from scratch, as by writing a set of <code class="language-plaintext highlighter-rouge">CREATE TABLE</code> statements in a <code class="language-plaintext highlighter-rouge">schema.sql</code> file. The implementation details are up to you, though you should minimally ensure that your database meets the team’s <a href="#expectations">expectations</a> and that it can represent the <a href="#sample-data">sample data</a>.</p>

## Expectations

<p>To understand the team’s expectations for their database, you sat down to talk with them after the shop closed for the day.</p>

### Ingredients

<blockquote>
  <p>We certainly need to keep track of our ingredients. Some of the typical ingredients we use include flour, yeast, oil, butter, and several different types of sugar. Moreover, we would love to keep track of the price we pay <em>per unit</em> of ingredient (whether it’s pounds, grams, etc.).</p>
</blockquote>

### Donuts

<blockquote>
  <p>We’ll need to include our selection of donuts, past and present! For each donut on the menu, we’d love to include three things:</p>
  <ul class="fa-ul">
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The name of the donut</li>
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Whether the donut is <a href="https://en.wikipedia.org/wiki/Gluten-free_diet">gluten-free</a></li>
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The price per donut</li>
  </ul>

  <p>Oh, and it’s important that we be able to look up the <a href="#ingredients">ingredients</a> for each of the donuts!</p>
</blockquote>

### Orders

<blockquote>
  <p>We love to see customers in person, though we realize a good number of people might order online nowadays. We’d love to be able to keep track of those online orders. We think we would need to store:</p>
  <ul class="fa-ul">
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>An order number, to keep track of each order internally</li>
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>All the <a href="#donuts">donuts</a> in the order</li>
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The <a href="#customers">customer</a> who placed the order. We suppose we could assume only one customer places any given order.</li>
  </ul>
</blockquote>

### Customers

<blockquote>
  <p>Oh, and we realize it would be lovely to keep track of some information about each of our customers. We’d love to remember the history of the orders they’ve made. In that case, we think we should store:</p>
  <ul class="fa-ul">
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>A customer’s first and last name</li>
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>A history of their <a href="#orders">orders</a></li>
  </ul>
</blockquote>

## Sample Data

<p>Your database should be able to represent…</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><strong>Cocoa</strong>, for which Union Square Donuts pays $5.00 for one pound.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><strong>Sugar</strong>, for which Union Square Donuts pays $2.00 for one pound.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Union Square Donuts’ <strong>“Belgian Dark Chocolate” donut</strong>, which is <em>not</em> gluten-free, costs $4.00, and includes the following ingredients:
    <ul class="fa-ul">
      <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Cocoa</li>
      <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Flour</li>
      <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Buttermilk</li>
      <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Sugar</li>
    </ul>
  </li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Union Square Donuts’ <strong>“Back-To-School Sprinkles” donut</strong>, which is <em>not</em> gluten-free, costs $4.00, and includes the following ingredients:
    <ul class="fa-ul">
      <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Flour</li>
      <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Buttermilk</li>
      <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Sugar</li>
      <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Sprinkles</li>
    </ul>
  </li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><strong>Order 1</strong> from <strong>Luis Singh</strong> for 3 Belgian Dark Chocolate donuts and 2 Back-To-School Sprinkles donuts.</li>
</ul>

