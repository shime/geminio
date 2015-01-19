Feature: Printing help

  Scenario: 'geminio' prints help
    When I run `geminio`
    Then the output should contain:
    """
    usage: geminio [OPTIONS] GEM_NAME

    Micro utility that sets up the stage for building gems.

    OPTIONS:
        -t, --template TEMPLATE          Path to the template that will be used.
            --default                    Makes the given template a default.
        -v, --version                    Show version information.
        -h, --help                       You're reading it.
    """

  Scenario: 'geminio --help' prints help
    When I run `geminio --help`
    Then the output should contain:
    """
    usage: geminio [OPTIONS] GEM_NAME

    Micro utility that sets up the stage for building gems.

    OPTIONS:
        -t, --template TEMPLATE          Path to the template that will be used.
            --default                    Makes the given template a default.
        -v, --version                    Show version information.
        -h, --help                       You're reading it.
    """

  Scenario: 'geminio -v' prints version
    When I run `geminio -v`
    Then the output should contain current geminio version
