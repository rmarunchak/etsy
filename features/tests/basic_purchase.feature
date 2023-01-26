Feature: : Basic purchase

  Scenario: As a payer, I want to be able to make a basic purchase via Bank Wire
    Given I am on base page
    And I visit "onizuka" shop
    And I select "NewTest" product
    And I click on checkout button
    And I fill in payer information and press buy button
    And I verify Bank Wire order

