When(/^I debug with pry$/) do
  binding.pry
end


Then(/^the output should contain current geminio version$/) do
  step("the output should contain \"#{Geminio::VERSION}\"")
end
