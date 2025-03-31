# Problem to Solve

Hartsfield-Jackson International Airport, perhaps better known as “ATL” for its [IATA airport code](https://en.wikipedia.org/wiki/IATA_airport_code), has been the [busiest airport in the world](https://en.wikipedia.org/wiki/List_of_busiest_airports_by_passenger_traffic) since 1998. Located in Atlanta, Georgia in the United States, ATL served 93.7 million passengers in 2022. Maybe you were one of them!

Suppose you’ve just been hired to help ATL re-design their database system. In a file called `schema.sql` in a folder called `atl`, write a set of SQL statements to design a database with which Hartsfield-Jackson could keep track of its passengers and their flights.

# Specification

<p>Your task at hand is to create a SQLite database for ATL from scratch, as by writing a set of <code class="language-plaintext highlighter-rouge">CREATE TABLE</code> statements in a <code class="language-plaintext highlighter-rouge">schema.sql</code> file. The implementation details are up to you, though you should minimally ensure your database meets the <a href="#requirements">airport’s requirements</a> and that it can represent the given <a href="#sample-data">sample data</a>.</p>

## Requirements

To understand ATL’s requirements for their database, you sat down to have a conversation with the Assistant General Manager for IT Operations.

### Passengers

<blockquote>
  <p>When it comes to our passengers, we just need to have the essentials in line: the first name, last name, and age. That’s all we need to know—nothing more.</p>
</blockquote>

### Check-Ins

<blockquote>
  <p>When passengers arrive at ATL, they’ll often “check in” to their flights. That’s them telling us they’re here and all set to board. We’d like to keep a tidy log of such moments. And what would we need to log, you ask? Well, here’s what we need:</p>
  <ul class="fa-ul">
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The exact date and time at which our <a href="#passengers">passenger</a> checked in</li>
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The <a href="#flights">flight</a> they are checking in for, of course. Can’t lose track of where they’re headed, now can we?</li>
  </ul>
</blockquote>

### Airlines

<blockquote>
  <p>ATL’s a hub for many <a href="https://en.wikipedia.org/wiki/Hartsfield%E2%80%93Jackson_Atlanta_International_Airport#Airlines_and_destinations">domestic and international airlines</a>: names like Delta, British Airways, Air France, Korean Air, and Turkish Airlines. The list goes on. So here’s what we track:</p>
  <ul class="fa-ul">
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The name of the airline</li>
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The <a href="https://en.wikipedia.org/wiki/Hartsfield%E2%80%93Jackson_Atlanta_International_Airport#Terminals">“concourse”</a> or, shall I say, the section of our airport where the airline operates. We have 7 concourses: A, B, C, D, E, F, and T.</li>
  </ul>
</blockquote>

### Flights

<blockquote>
  <p>We serve as many as 1,000 flights daily. To ensure that our passengers are never left wondering, we need to give them all the critical details about their flight. Here’s what we’d like to store:</p>
  <ul class="fa-ul">
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The flight number. For example, “900”. Just know that we sometimes re-use flight numbers.</li>
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The <a href="#airlines">airline</a> operating the flight. You can keep it simple and assume one flight is operated by one airline.</li>
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The code of the airport they’re departing from. For example, “ATL” or “BOS”.</li>
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The code of the airport they’re heading to</li>
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The expected departure date and time (to the minute, of course!)</li>
    <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The expected arrival date and time, to the very same accuracy</li>
  </ul>
</blockquote>

## Sample Data

Your database should be able to represent…

- A passenger, **Amelia Earhart**, who is 39 years old
- An airline, **Delta**, which operates out of concourses A, B, C, D, and T
- A flight, **Delta Flight 300**, which is expected to depart from ATL on August 3rd, 2023 at 6:46 PM and arrive at BOS on August 3rd, 2023 at 9:09 PM
- A check-in for Amelia Earhart, for Delta Flight 300, on August 3rd, 2023 at 3:03 PM
