Feature: Merge Articles
  As a blog administrator
  In order to categorize articles
  I want to be able to create and edit article categories

  Background:
    Given the blog is set up

  Scenario: An admin creates an article category
    Given I am logged into the admin panel
    Then I should see "Categories"
    When I follow "Categories"
    Then I should be on the categories page
    When I fill in "category_name" with "Paper"
    And I fill in "category_keywords" with "Science"
    And I fill in "category_description" with "Scientific publication"
    And I press "Save"
    Then I should be on the categories page
    And I should see "Paper"
    And I should see "Science"
    And I should see "Scientific publication"

  Scenario: An admin edits an article category
    Given I am logged into the admin panel
    Then I should see "Categories"
    When I follow "Categories"
    Then I should be on the categories page
    When I follow "General"
    Then the "category_name" field should contain "General"
    When I fill in "category_keywords" with "Generic"
    And I fill in "category_description" with "Regular publication"
    And I press "Save"
    Then I should be on the categories page
    And I should see "General"
    And I should see "Generic"
    And I should see "Regular publication"
