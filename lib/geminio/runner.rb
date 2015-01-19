module Geminio
  class Runner
    DEFAULT_TEMPLATE_PATH = File.expand_path(File.join(File.dirname(__FILE__), "../../templates/default"))

    def initialize(options = {})
      @options = options

      if options[:name]
        @options[:name] = options[:name].dup.extend StringExtensions
      end

      @options[:author_name]   = `git config user.name`.chomp
      @options[:author_email]  = `git config user.email`.chomp
      @options[:author_github] = ENV["GITHUB_USER"] ||
        `git config github.user`.chomp

      if !@options[:template]
        @options[:template] = File.expand_path(config['template'] ||
                                               DEFAULT_TEMPLATE_PATH)
      end

      if @options[:default]
        config.store(
          template: File.expand_path(@options[:template])
        )
      end

      @options[:github_enabled] = !@options[:author_github].empty?
    end

    def run
      if @options[:name]
        shell = Shell.new
        shell.options = @options
        shell.destination_root = @options[:name].underscore
        shell.set_variables
        shell.make_folder_structure
        shell.initialize_git_repo
        shell.add_github_remote if @options[:github_enabled]
      end
    end

    private

      def config
        UserConfigurations::Configuration.new('geminiorc')
      end
  end
end
