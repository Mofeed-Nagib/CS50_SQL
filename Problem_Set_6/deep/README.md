# Problem to Solve

<p>You are a researcher operating a remote submarine, the AquaByte Explorer, which continuously collects observations from the ocean floor. (AquaByte, though fictional, is a bit like the real <a href="https://schmidtocean.org/technology/robotic-platforms/4500-m-remotely-operated-vehicle-rov/">SuBastion</a>!). AquaByte sends data up from the deep, storing it in a database located across several boats on the surface of the ocean.</p>
<p>In a file called <code class="language-plaintext highlighter-rouge">answers.md</code>, your task is to analyze the trade-offs in a few potential designs for AquaByte’s distributed database system!</p>

# Background

<p>AquaByte is capable of sending several thousands of observations per minute, often at particular times of day. For instance, AquaByte most actively observes in the evening and early morning hours, when certain fish can be seen with higher frequency.</p>
<p>Each row of data sent to the surface by AquaByte is tagged with a primary key: in this case, the exact timestamp of the observation in the following format: <code class="language-plaintext highlighter-rouge">YYYY-MM-DD HH:MM:SS.SSS</code>. This happens to be ISO8601 format, if you’re curious!</p>

# Collecting Observations

<p>For simplicity, suppose AquaByte sent the following 6 observations over the course of November 1st, 2023. For the sake of visualization, each observation is denoted by a blue rectangle labeled by its primary key (the timestamp at which the observation was taken).</p>
<p><img src="https://cs50.harvard.edu/sql/2024/psets/6/deep/timestamps.jpg" alt="Timestamps"></p>
<blockquote><p>As a check for understanding, when did most of AquaByte’s observations occur?</p></blockquote>
<details><summary>Between midnight and 1am on November 1st, 2023</summary><br/><p>That’s right!</p></details>
<details><summary>Between noon and 1pm on November 1st, 2023</summary><br/><p>Not quite.</p></details>
<details><summary>Between 4pm and 5pm on November 1st, 2023</summary><br/><p>Not quite.</p></details>

# Partitions

<p>AquaByte plans to send its six observations to a network of boats on the surface: Boat A, Boat B, and Boat C. More boats allow AquaByte to send more data than any single boat could store. Yet more boats comes at the cost of more complexity: assuming the data, once stored, shouldn’t be moved, to which boat should AquaByte send each observation? This is, in fact, a problem of <em>partitioning</em> the data.</p>

## Random Partitioning

<p>One approach is for AquaByte to randomly send its observations to each boat, as per the below. With the questions below, analyze the technical trade-offs of this design decision.</p>
<p><img src="https://cs50.harvard.edu/sql/2024/psets/6/deep/random.jpg" alt="Random Partitioning"></p>
<p>Consider the following two thought questions. Once you have an idea in your head, choose the answer that best corresponds to your thinking by clicking the appropriate dropdown.</p>
<blockquote><p>Will the observations likely be evenly distributed across all boats, even if AquaByte most commonly collects observations between midnight and 1am? Why or why not?</p></blockquote>
<details><summary>The observations will be evenly distributed.</summary><br/><p>That’s right. The observations will be evenly distributed because each one is randomly assigned to any one of the three boats. Or, put another way, an observation is equally likely to be sent to any boat. So, even if AquaByte most commonly collects observations between midnight and 1am, observations will be evenly spread out among the boats.</p></details>
<details><summary>The observations will not be evenly distributed.</summary><br/><p>Not quite. The observations will be evenly distributed because each one is randomly assigned to any one of the three boats. Or, put another way, an observation is equally likely to be sent to any boat. So, even if AquaByte most commonly collects observations between midnight and 1am, observations will be evenly spread out among the boats.</p></details>
<blockquote><p>Suppose a researcher wants to query for all observations between midnight and 1am. On how many of the boats will they need to run the query?</p></blockquote>
<details><summary>The researcher will need to run the query on all of the boats.</summary><br/><p>That’s right. Because the observations are randomly assigned to any boat, each observation between midnight and 1am could be on any one of the three boats. If a query is only run on one boat, there’s a chance it has missed observations, stored on other boats, that it should have returned.</p></details>
<details><summary>The researcher will need to run the query on only some of the boats.</summary><br/><p>Not quite. Consider that each observation between midnight and 1am is equally likely to be on any one of the three boats. So if the researcher only runs the query on one of the boats, there is a chance the query will have missed observations on other boats.</p></details>
<p>Based on what you’ve learned from the above, from lecture, and from your own intuition, write 2–3 sentences that describe both reasons to adopt this approach and reasons <em>not</em> to adopt this approach. Write the sentences in <code class="language-plaintext highlighter-rouge">answers.md</code>, within the “Random Partitioning” section.</p>

## Partitioning by Hour

<p>Suppose, for the reasons you’ve written, the AquaByte team decides not to have AquaByte randomly send its observations to each boat. Instead, a team member proposes that you partition the data by <em>time of day</em>. For instance,</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Boat A will receive all observations within the hours of 0–7 (i.e., midnight to 7:59 AM), inclusive.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Boat B will receive all observations within the hours of 8–15 (i.e., 8:00 AM to 3:59 PM), inclusive.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>Boat C will receive all observations within the hours of 16–23 (i.e., 4:00 PM to 11:59 PM), inclusive.</li>
</ul>
<p>With the questions below, analyze the technical trade-offs of this design decision.</p>
<p><img src="https://cs50.harvard.edu/sql/2024/psets/6/deep/hour.jpg" alt="Partitioning by Hour"></p>
<p>Consider the following two thought questions. Once you have an idea in your head, choose the answer that best corresponds to your thinking by clicking the appropriate dropdown.</p>
<blockquote><p>Will the observations likely be evenly distributed across all boats, even if AquaByte most commonly collects observations between midnight and 1am? Why or why not?</p></blockquote>
<details><summary>The observations will be evenly distributed.</summary><br/><p>Not quite. The observations will not be evenly distributed if AquaByte most commonly collects observations between midnight and 1am. Since most observations are collected between midnight and 1am, and because Boat A will receive all observations within the hours of 0–7 (i.e., midnight to 7:59 AM), inclusive, Boat A will receive most of the observations.</p></details>
<details><summary>The observations will not be evenly distributed.</summary><br/><p>That’s right. Since most observations are collected between midnight and 1am, and because Boat A will receive all observations within the hours of 0–7 (i.e., midnight to 7:59 AM), inclusive, Boat A will receive most of the observations.</p></details>
<blockquote><p>Suppose a researcher wants to query for all observations between midnight and 1am. On how many of the boats will they need to run the query?</p></blockquote>
<details><summary>The researcher will need to run the query on all of the boats.</summary><br/><p>Not quite. Boat A will receive all observations within the hours of 0–7 (i.e., midnight to 7:59 AM), inclusive. This means that all observations between midnight and 1am can be found on Boat A.</p></details>
<details><summary>The researcher will need to run the query on only some of the boats.</summary><br/><p>That’s right. Boat A will receive all observations within the hours of 0–7 (i.e., midnight to 7:59 AM), inclusive. This means that all observations between midnight and 1am can be found on Boat A.</p></details>
<p>Based on what you’ve learned from the above, from lecture, and from your own intuition, write 2–3 sentences that describe both reasons to adopt this approach and reasons <em>not</em> to adopt this approach. Write the sentences in <code class="language-plaintext highlighter-rouge">answers.md</code>, within the “Partitioning by Hour” section.</p>

## Partitioning by Hash Value

<p>Suppose, for the reasons you’ve identified above, the AquaByte team decides not to have AquaByte send observations to certain boats depending on the hour in which they were collected. Instead, a team member proposes that you partition the observations by <em>hash value</em> of their timestamp.</p>
<p>If unfamiliar, a hash value is generated by a <em>hash function</em>. A hash function is an algorithm that takes some input (such as a timestamp, for example) and—based on the input—outputs an arbitrary number (the hash value).</p>
<p>For instance, suppose the team develops a hash function that assigns a value between 0 and 1,499, inclusive, to each possible primary key AquaByte could send to the distributed data system. As examples of inputs and outputs:</p>
<ul class="fa-ul">
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The algorithm computes the hash value 45 for <code class="language-plaintext highlighter-rouge">2023-11-01 00:00:01.020</code>.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The algorithm computes the hash value 588 for <code class="language-plaintext highlighter-rouge">2023-11-01 16:21:59.924</code>.</li>
  <li data-marker="*"><span class="fa-li"><i class="fas fa-square"></i></span>The algorithm computes the hash value 1200 for <code class="language-plaintext highlighter-rouge">2023-11-01 00:00:04.127</code>.</li>
</ul>
<p>Importantly, the hash function is <em>consistent</em>: it will always compute the same hash value when given the same timestamp. The hash function also distributes timestamps <em>evenly</em> across all possible hash values: that is, a single observation is no more likely to be assigned one hash value than another. With the questions below, analyze the technical trade-offs of this design decision.</p>
<p><img src="https://cs50.harvard.edu/sql/2024/psets/6/deep/hash.jpg" alt="Hash Partitioning"></p>
<p>Consider the following three thought questions. Once you have an idea in your head, choose the answer that best corresponds to your thinking by clicking the appropriate dropdown.</p>
<blockquote><p>Will the observations likely be evenly distributed across all boats, even if AquaByte most commonly collects observations between midnight and 1am? Why or why not?</p></blockquote>
<details><summary>The observations will be evenly distributed.</summary><br/><p>That’s right. A single observation is no more likely to be assigned one hash value than another, which means any single observation could be sent to any one of the three available boats.</p></details>
<details><summary>The observations will not be evenly distributed.</summary><br/><p>Not quite. Though AquaByte does most commonly collect observations between midnight and 1am, a single observation is no more likely to be assigned one hash value than another. Any single observation could be sent to any one of the three available boats.</p></details>
<blockquote><p>Suppose a researcher wants to query for all observations between midnight and 1am. On how many of the boats will they need to run the query?</p></blockquote>
<details><summary>The researcher will likely need to run the query on all of the boats.</summary><br/><p>That’s right. Each observation in a <em>range</em> of observations could be assigned any arbitrary hash value: the hash values themselves are not in a specified range. For that reason, the query would be best run on all boats.</p></details>
<details><summary>The researcher will likely need to run the query on only some of the boats.</summary><br/><p>Not quite. It’s certainly possible to know the hash value of a <em>specific</em> observation. But each observation in a <em>range</em> of observations could be assigned any arbitrary hash value: the hash values themselves are not in a specified range. For that reason, the query would be best run on all boats.</p></details>
<blockquote><p>Suppose a researcher wants to query for a specific observation, which occurred at exactly <code class="language-plaintext highlighter-rouge">2023-11-01 00:00:01.020</code>. On how many of the boats will they need to run the query?</p></blockquote>
<details><summary>The researcher will need to run the query on all of the boats.</summary><br/><p>Not quite. It is possible to know the hash value of a specific timestamp, which can tell the researcher where to run the query.</p></details>
<details><summary>The researcher will need to run the query on only some of the boats.</summary><br/><p>That’s right. It is possible to know the hash value of a specific timestamp, which can tell the researcher where to run the query.</p></details>
<p>Based on what you’ve learned from the above, from lecture, and from your own intuition, write 2–3 sentences that describe both reasons to adopt this approach and reasons <em>not</em> to adopt this approach. Write the sentences in <code class="language-plaintext highlighter-rouge">answers.md</code>, within the “Partitioning by Hash Value” section.</p>
