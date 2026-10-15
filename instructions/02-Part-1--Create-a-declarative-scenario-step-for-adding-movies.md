# Part 1: Create a declarative scenario step for adding movies

The goal of BDD is to express behavioral tasks rather than low-level operations.

The background step of all the scenarios in this homework requires that the movies database contain some movies. It would go against the goal of BDD to do this by writing scenarios that spell out every interaction required to add a new movie, since adding new movies is not what these scenarios are about.

Recall that the `Given` steps of a user story specify the initial state of the system: it does not matter how the system got into that state.

First, verify that your app is setup correctly without errors:

```sh
bundle exec cucumber
```

Read through the output. Does it make sense? (Failing tests are expected because you haven't implemented them yet.)

<details>
<summary>Example Cucumber Output</summary>
<pre><code>
Using the default profile...
Feature: display list of movies filtered by MPAA rating
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

  Background: movies have been added to database # features/filter_movie_list.feature:7
    Given the following movies exist:            # features/step_definitions/movie_steps.rb:3
      | title                   | rating | release_date |
      | Aladdin                 | G      | 25-Nov-1992  |
      | The Terminator          | R      | 26-Oct-1984  |
      | When Harry Met Sally    | R      | 21-Jul-1989  |
      | The Help                | PG-13  | 10-Aug-2011  |
      | Chocolat                | PG-13  | 5-Jan-2001   |
      | Amelie                  | R      | 25-Apr-2001  |
      | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
      | The Incredibles         | PG     | 5-Nov-2004   |
      | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
      | Chicken Run             | G      | 21-Jun-2000  |
    And I am on the RottenPotatoes home page     # features/step_definitions/web_steps.rb:44
    Then 10 seed movies should exist             # features/step_definitions/movie_steps.rb:11

  Scenario: restrict to movies with "PG" or "R" ratings # features/filter_movie_list.feature:25
    When I check the following ratings: PG, R           # features/step_definitions/movie_steps.rb:28
    Then complete the rest of of this scenario          # features/step_definitions/movie_steps.rb:60
    # enter step(s) to check the "PG" and "R" checkboxes
    # enter step(s) to uncheck all other checkboxes
    # enter step to "submit" the search form on the homepage
    # enter step(s) to ensure that PG and R movies are visible
    # enter step(s) to ensure that other movies are not visible
  Scenario: all ratings selected               # features/filter_movie_list.feature:34
    # your steps here
    Then complete the rest of of this scenario # features/step_definitions/movie_steps.rb:60

Feature: display list of movies sorted by different criteria
  As an avid moviegoer
  So that I can quickly browse movies based on my preferences
  I want to see movies sorted by title or release date

  Background: movies have been added to database # features/sort_movie_list.feature:7
    Given the following movies exist:            # features/step_definitions/movie_steps.rb:3
      | title                   | rating | release_date |
      | Aladdin                 | G      | 25-Nov-1992  |
      | The Terminator          | R      | 26-Oct-1984  |
      | When Harry Met Sally    | R      | 21-Jul-1989  |
      | The Help                | PG-13  | 10-Aug-2011  |
      | Chocolat                | PG-13  | 5-Jan-2001   |
      | Amelie                  | R      | 25-Apr-2001  |
      | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
      | The Incredibles         | PG     | 5-Nov-2004   |
      | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
      | Chicken Run             | G      | 21-Jun-2000  |
    And I am on the RottenPotatoes home page     # features/step_definitions/web_steps.rb:44
    Then 10 seed movies should exist             # features/step_definitions/movie_steps.rb:11

  Scenario: sort movies alphabetically         # features/sort_movie_list.feature:25
    When I select "Title" from "sort_by"       # features/step_definitions/web_steps.rb:85
    Then complete the rest of of this scenario # features/step_definitions/movie_steps.rb:60

  Scenario: sort movies in increasing order of release date # features/sort_movie_list.feature:30
    When I select "Release date" from "sort_by"             # features/step_definitions/web_steps.rb:85
    Then complete the rest of of this scenario              # features/step_definitions/movie_steps.rb:60

4 scenarios (4 pending)
19 steps (15 skipped, 4 pending)
0m0.102s
</code></pre>
</details>


**For this entire assignment, you need to modify** `movie_steps.rb` **under features/step_definition as well as** `sort_movie_list.feature` **and** `filter_movie_list.feature` **under features/**

For part 1, you will create a step definition that will match the step `Given the following movies exist` in the `Background` section of both `sort_movie_list.feature` and `filter_movie_list.feature`. (Later in the course, we will show how to DRY out the repeated `Background` sections in the two feature files.)

Add your code in the `movie_steps.rb` step definition file. You can just use ActiveRecord calls to directly add movies to the database; it's OK to bypass the GUI associated with creating new movies, since that's not what these scenarios are testing. Tip: you can use the `log` method just like `puts` to output to the console while running Cucumber tests.

**Remove** any instances of `pending` in code when you implement each step definition.

SUCCESS is when all **Background** steps for the scenarios in `filter_movie_list.feature` and `sort_movie_list.feature` are passing Green.

---

[← BDD and Cucumber](01-BDD-and-Cucumber.md) | [Contents](README.md) | [Part 2: Happy paths for filtering movies →](03-Part-2--Happy-paths-for-filtering-movies.md)
