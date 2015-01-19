require 'thor'
require 'user-configurations'

require 'geminio/utils/string_extensions'
require 'geminio/error_message'
require 'geminio/runner'
require 'geminio/shell'

module Geminio
  ERROR_MESSAGES = {
    missing_template: ErrorMessage.new(%{
      Error: You must provide --template that's going to be used as default.

      Run "geminio help" for more info.
    }),

    missing_name: ErrorMessage.new(%{
      Error: You must provide gem name.

      Run "geminio help" for more info.
    })
  }

  def self.run(*args)
    Runner.new(*args).run
  end
end
