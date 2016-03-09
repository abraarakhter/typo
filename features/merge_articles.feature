Feature: Merge Articles
  As a blog administrator
  In order to combine similar topics
  I want to be able to merge articles
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully merge articles
    When I publish an article "espn"
    And I publish an article "espn2"
    Then I should be on the admin content page
    When I follow "espn"
    Then I should see "Merge Articles"
    When I fill in "Article ID:" with "espn2"
    And I press "Merge"
    Then I should be on the admin content page
