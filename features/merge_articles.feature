Feature: Merge Articles
  As a blog administrator
  In order to combine similar topics
  I want to be able to merge articles
  
  Background:
    Given the blog is set up

  Scenario: Successfully merge articles
    Given I am logged into the admin panel
    When I publish an article "espn"
    And I publish an article "espn2"
    Then I should be on the admin content page
    Then I should see "espn2"
    When I follow "espn"
    Then I should see "Merge Articles"
    When I fill in "Article ID:" with the id of "espn2"
    And I press "Merge"
    Then I should see "espn"
    And I should not see "espn2"
    
  Scenario: Non-Admin can't merge
    Given I am logged in as a user
    When I publish an article "espn3"
    And I follow "espn3"
    Then I should not see "Merge Articles"
