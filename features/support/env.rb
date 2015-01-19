require 'aruba/cucumber'
require 'pry'
require 'user-configurations'

require 'geminio'

@name = `git config user.name`.chomp
@email = `git config user.email`.chomp
@github = `git config github.user`.chomp

`git config user.name "Little Birdie"`
`git config user.email "little@bird.ie"`
`git config github.user birdie`

Before do
  @config = UserConfigurations::Configuration.new('geminiorc')
  if File.exists?(File.expand_path('~/.geminiorc'))
    FileUtils.rm(File.expand_path('~/.geminiorc'))
  end
end

After do
  if @config["template"]
    @config.store(template: @config["template"])
  end
end

at_exit do
  `git config user.name "#{@name}"`
  `git config user.email "#{@email}"`
  `git config github.user "#{@github}"`
end
