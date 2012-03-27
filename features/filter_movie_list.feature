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
  
Scenario: restrict to movies with 'PG' or 'R' ratings
  # enter step(s) to check the 'PG' and 'R' checkboxes
  # enter step(s) to uncheck all other checkboxes
  # enter step to "submit" the search form on the homepage
  # enter step(s) to ensure that PG and R movies are visible
  # enter step(s) to ensure that other movies are not visible
  When I check "ratings_PG"
  When I check "ratings_R"
  When I uncheck "ratings_G"
  When I uncheck "ratings_PG-13"
  When I uncheck "ratings_NC-17"
  And I press "Refresh"
  #Then I should be on the RottenPotatoes home page
  Then I should see "The Terminator"
  And I should see "When Harry Met Sally"
  And I should see "The Incredibles"
  And I should not see "Aladdin"
  And I should not see "The Help"
  
  

Scenario: no ratings selected
  # see assignment
  Given I uncheck the following ratings: G, PG, R, PG-13
  #Given I check the following ratings: PG-13
  #Then I should be on the RottenPotatoes home page
  Then I should not see "The Help"
  And I should not see "Aladdin"
  And I should not see "The Terminator"

Scenario: all ratings selected
  # see assignment
  Given I check the following ratings: G, PG, R, PG-13
  #Given I check the following ratings: G, PG-13
  #Given I uncheck the following ratings: PG, R
  Then I should see all of the movies

