Feature: add talk

  Scenario: user adds new talk
    Given I am signed in as "bob@test.com" with "secret"
    And I am on the talks page
    When I follow "New talk"
    And I fill in "Title" with "Hello World"
    And I fill in "Abstract" with "Lorem ipsum"
    And I press "Create Talk"
    Then I should be on the talks page
    And I should see "Hello World"
    And I should see "Lorem ipsum"
    And I should see "by bob@test.com"
