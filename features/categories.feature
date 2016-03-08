Feature: Categories
  As an admin
  In order to add and edit blogging categories
  I want the category page to work
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
  
  Scenario:
    Given I am on the admin_dashboard page
    When I follow "Categories"
    Then I should see "Categories"