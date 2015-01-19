module Geminio
  class Shell
    # TODO: throw Thor into a volcano
    #
    include Thor::Base
    include Thor::Actions

    attr_accessor :options

    no_commands { # TODO: throw Thor into a volcano

      def make_folder_structure
        self.class.source_root(template_path)

        say "Generating #{self.destination_root}", :green

        Dir.chdir(template_path) do
          Dir["**/*"].each do |node|
            next unless File.file? node
            file = node

            case File.extname(file)
            when '.erb'
              template file, destination(file.chomp('.erb')), @options
            else
              copy_file file, destination(file)
            end
          end
        end
      end

      def initialize_git_repo
        Dir.chdir(destination_root) { `git init`; `git add .` }

        say "\nGit repo initialized successfully.", :green
      end

      def add_github_remote
        Dir.chdir(destination_root) do
          `git remote add origin git@github.com:#{@github_repo}.git`
        end

        say "Github remote added (#{@github_repo}).", :green
      end

      def set_variables
        @options.each {|k, v| instance_variable_set("@#{k}", v)}

        @github_repo = "#{@author_github}/#{@name}"
      end

      private

        def interpolate(path)
          path.gsub(/%[a-z]+%/) do |capture|
            keyword = capture[1..-2]
            keyword.extend StringExtensions
            @options[keyword.to_sym].underscore
          end
        end

        def destination(path)
          File.join(destination_root, interpolate(path))
        end

        def template_path
          File.expand_path(@options[:template])
        end
    }
  end
end
