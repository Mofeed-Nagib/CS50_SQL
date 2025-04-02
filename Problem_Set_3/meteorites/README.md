# Problem to Solve

As a data engineer at [NASA](https://www.nasa.gov/), you often spend your time cleaning [meteorites](https://solarsystem.nasa.gov/asteroids-comets-and-meteors/meteors-and-meteorites/in-depth/)—or at least the data they create.

You’ve been given a CSV file of historical meteorite landings here on Earth, of which there are quite a few! Your job is to import the data into a SQLite database, cleaning it up along the way. After you’re done, the database will be used in analyses by some of your fellow engineers.

# Specification

In `import.sql`, write a series of SQL (and SQLite) statements to import and clean the data from `meteorites.csv` into a table, `meteorites`, in a database called `meteorites.db`.

Within `meteorites.db`, the `meteorites` table should have the following columns:

<details><summary>Columns in the <code>meteorites</code> table</summary><br/><ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">id</code>, which represents the unique ID of the meteorite.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">name</code>, which represents the given name of the meteorite.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">class</code>, which is the classification of the meteorite, according to the <a href="https://en.wikipedia.org/wiki/Meteorite_classification">traditional classification scheme</a>.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">mass</code>, which is the weight of the meteorite, in grams.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">discovery</code>, which is either <strong>“Fell”</strong> or <strong>“Found”</strong>. “Fell” indicates the meteorite was seen falling to Earth, whereas “Found” indicates the meteorite was found only <em>after</em> landing on Earth.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">year</code>, which is the year in which the the meteorite was discovered.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">lat</code>, which is the latitude at which the meteorite landed.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span><code class="language-plaintext highlighter-rouge">long</code>, which is the longitude at which the meteorite landed.</li>
</ul></details>

Keep in mind that not all columns in the CSV should end up in the final table!

To consider the data in the `meteorites` table clean, you should ensure…

1. Any empty values in `meteorites.csv` are represented by `NULL` in the `meteorites` table.
    - Keep in mind that the `mass`, `year`, `lat`, and `long` columns have empty values in the CSV.
2. All columns with decimal values (e.g., 70.4777) should be rounded to the nearest hundredths place (e.g., 70.4777 becomes 70.48).
    - Keep in mind that the `mass`, `lat`, and `long` columns have decimal values.
3. All meteorites with the `nametype` “Relict” are not included in the `meteorites` table.
4. The meteorites are sorted by `year`, oldest to newest, and then—if any two meteorites landed in the same year—by `name`, in alphabetical order.
5. You’ve updated the IDs of the meteorites from `meteorites.csv`, according to the order specified in #4.
    - The `id` of the meteorites should start at 1, beginning with the meteorite that landed in the oldest year and is the first in alphabetical order for that year.

# Acknowledgements

Meteorite CSV retrieved from NASA’s Open Data Portal, [data.nasa.gov/Space-Science/Meteorite-Landings/gh4g-9sfh](https://data.nasa.gov/Space-Science/Meteorite-Landings/gh4g-9sfh).
