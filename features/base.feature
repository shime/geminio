Feature: Basic usage

  Background:
    Given I run `geminio foo-bar`

  Scenario: 'geminio' command should be available
    Then the exit status should be 0

  Scenario: 'geminio foo-bar' should create foo_bar directory
    Then a directory named "foo_bar" should exist

  Scenario: supports erb templates
    Then a file named "foo_bar/README.md" should exist
    And the file "foo_bar/README.md" should contain "# foo-bar"

  Scenario: supports variables in file names (interpolation)
    Then a file named "foo_bar/foo_bar.gemspec" should exist
    And a file named "foo_bar/lib/foo_bar.rb" should exist

  Scenario: supports variables in directory names (interpolation)
    Then a file named "foo_bar/lib/foo_bar/version.rb" should exist

  Scenario: converts constants to camel case
    Then the file "foo_bar/lib/foo_bar.rb" should contain "module FooBar"

  Scenario: picks up git config variables
    Then the file "foo_bar/foo_bar.gemspec" should contain:
    """
    spec.authors       = ["Little Birdie"]
    """
