# Problem to Solve

CS50’s duck debugger has disappeared once more and you desperately need a detective. You’ve heard stories of one who lives uptown, always secretive in their work, never seen but when they want to be. Unsurprisingly, they’ve proven to be quite elusive to you. But here you are, in their study, after picking up their address from a certain mail clerk.

On their mahogany desk, fresh white paper glints. Inscribed is the following table:

<table class="table table-bordered table-striped">
  <tbody>
    <tr>
      <td>14</td>
      <td>98</td>
      <td>4</td>
    </tr>
    <tr>
      <td>114</td>
      <td>3</td>
      <td>5</td>
    </tr>
    <tr>
      <td>618</td>
      <td>72</td>
      <td>9</td>
    </tr>
    <tr>
      <td>630</td>
      <td>7</td>
      <td>3</td>
    </tr>
    <tr>
      <td>932</td>
      <td>12</td>
      <td>5</td>
    </tr>
    <tr>
      <td>2230</td>
      <td>50</td>
      <td>7</td>
    </tr>
    <tr>
      <td>2346</td>
      <td>44</td>
      <td>10</td>
    </tr>
    <tr>
      <td>3041</td>
      <td>14</td>
      <td>5</td>
    </tr>
  </tbody>
<thead class=""></thead></table>

And tucked underneath, a worn book, [_The Adventures of Sherlock Holmes_](https://en.wikipedia.org/wiki/The_Adventures_of_Sherlock_Holmes).

# Background

Given the paper’s proximity to _The Adventures of Sherlock Holmes_, what’s written on it seems to be some variation of a [book cipher](https://en.wikipedia.org/wiki/Book_cipher). You know that in one version of a book cipher, the cipher’s creator gives you a list of “triplets” (i.e., a set of three numbers). Each triplet is structured as follows:

- The first number in the triplet is the _sentence number_ referenced by the encoder.
- The second number in the triplet is the _character number_, within that sentence, at which the message begins.
- The third number in the triplet is the _message length_ in characters (i.e., how many characters to read from the first, including spaces and punctuation).

For instance, consider the triplet **2**, **1**, **8** in light of the following sentences:

<blockquote>Quite so! You have not observed. And yet you have seen.</blockquote>

**2** refers to the 2nd sentence, “You have not observed.” **1** refers to the 1st character in that sentence, “Y.” And **8** refers to the length of the message from that first character. Starting from the 1st character of the 2nd sentence, reading 8 characters (including spaces!) gives you:

<blockquote>You have</blockquote>

You can imagine, now, stringing together multiple tuples to encode a longer message. Perhaps that’s exactly what the detective has done!

# Schema

Within `private.db`, you’ll find a table, `sentences`. The `sentences` table contains all sentences in _The Adventures of Sherlock Holmes_. In particular, it contains the following columns:

- `id`, which is the ID of the sentence
- `sentence`, which is the sentence itself

# Specification

Your task at hand is to decode the cipher left for you by the detective. How you do so is up to you, but you should ensure that—at the end of your process—you have a view structured as follows:

- The view should be named `message`
- The view should have a single column, `phrase`
- When the following SQL query is executed on `private.db`, your view should return a single column in which each row is one phrase in the message.

  `SELECT "phrase" FROM "message";`

In `private.sql`, you should write _all_ SQL statements required to replicate your creation of the view. That is:

- If creating the view requires creating a separate table and inserting data into it, you should ensure that `private.sql` contains the statements to create that table and insert that data. (Don’t be afraid to add tables and add data as you wish!)
- `private.sql`, when run a fresh instance of `private.db`, should be able to fully reconstruct your view.

# Acknowledgements

Text retrieved _The Adventures of Sherlock Holmes_, part of the public domain.
