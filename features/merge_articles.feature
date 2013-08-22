Feature: Merge Articles
  As a blog administrator
  In order to help user find and read similar contents together
  I want to be able to merge an article with another

  Background:
    Given the blog is set up

  Scenario: A non-admin cannot merge two articles
    Given I am logged into the publisher panel
    And I write the "Ruby Description" article with the "Ruby is a flexible interpreted language." body
    And I write the "Comment for Ruby Description" comment for the "Ruby Description" article
    And I write the "Rails Description" article with the "Rails is a framework used to develop rapid web applications." body
    And I write the "Comment for Rails Description" comment for the "Rails Description" article
    And I am on all articles page
    Then I should see "Rails Description"
    And I should see "Ruby Description"
    And I will save the Id of the "Rails Description" article
    When I follow "Ruby Description"
    Then I should not see "Merge Articles"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged into the admin panel
    And I write the "Ruby Description" article with the "Ruby is a flexible interpreted language." body
    And I write the "Comment for Ruby Description" comment for the "Ruby Description" article
    And I write the "Rails Description" article with the "Rails is a framework used to develop rapid web applications." body
    And I write the "Comment for Rails Description" comment for the "Rails Description" article
    And I am on all articles page
    Then I should see "Rails Description"
    And I should see "Ruby Description"
    And I will save the Id of the "Rails Description" article
    When I follow "Ruby Description"
    And I fill in "merge_with" with the saved Id
    And I press "Merge"
    Then I should be on all articles page
    And I should see "Ruby Description"
    And I should not see "Rails Description"
    When I follow "Ruby Description"
    Then I should see "Ruby is a flexible interpreted language."
    And I should see "Rails is a framework used to develop rapid web applications."
    When I am on the home page
    And I follow "Ruby Description"
    Then I should see "Comment for Ruby Description"
    And I should see "Comment for Rails Description"
    