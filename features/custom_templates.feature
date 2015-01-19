Feature: Custom templates

  Not everyone shares my views about how the perfect
  gem skeleton should look like. Provide your own
  gem skeletons!

  Background:
    Given a file named "foo/README.md.erb" with:
    """
    # custom template for <%= @name %>
    """

  Scenario: `geminio --template foo bar` creates bar with foo template
    When I run `geminio --template foo bar`
    Then the exit status should be 0
    Then the file "bar/README.md" should contain:
    """
    # custom template for bar
    """

  @geminiorc
  Scenario: `geminio --template foo --default bar` should make foo the default template
    When I run `geminio --template foo --default bar`
    Then the exit status should be 0
    Then the file "bar/README.md" should contain:
    """
    # custom template for bar
    """
    When I run `geminio baz`
    Then the exit status should be 0
    Then the file "baz/README.md" should contain:
    """
    # custom template for baz
    """

  Scenario: When --default is used without --template, it prints useful error
    When I run `geminio --default tmp/aruba/foo`
    Then the exit status should be 1
    Then the output should contain:
    """
    Error: You must provide --template that's going to be used as default.

    Run "geminio help" for more info.
    """

  Scenario: When --template is used without gem name, it prints useful errror
    When I run `geminio --template tmp/aruba/foo`
    Then the exit status should be 1
    Then the output should contain:
    """
    Error: You must provide gem name.

    Run "geminio help" for more info.
    """

  @geminiorc
  Scenario: `geminio --template foo --default` works without gem name
    When I run `geminio --template foo --default`
    Then the exit status should be 0
    When I run `geminio baz`
    Then the exit status should be 0
    Then the file "baz/README.md" should contain:
    """
    # custom template for baz
    """
