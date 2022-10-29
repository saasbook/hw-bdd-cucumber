Feature: display list of movies filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

Background: movies have been added to database

  Given the following movies exist:
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

  And  I am on the RottenPotatoes home page
  Then 10 seed movies should exist

Scenario: restrict to movies with 'PG' or 'R' ratings
  # enter step(s) to check the 'PG' and 'R' checkboxes
  Given I check the following ratings: PG R
  # enter step(s) to uncheck all other checkboxes
  And I uncheck the following ratings: G PG-13
  # enter step to "submit" the search form on the homepage
  When I press "Refresh"
  # enter step(s) to ensure that PG and R movies are visible
  Then I should see "Terminator"
  Then I should see "Raiders of the Lost Ark"
  # enter step(s) to ensure that other movies are not visible
  Then I should not see "The Help"
  Then I should not see "Aladdin"
Scenario: all ratings selected
  Then I should see all the movies

  # see assignment
