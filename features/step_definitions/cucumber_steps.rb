# This file contains step definitions which are relevant to
# Cucumber.js feature suite only.

Given /^a mapping written in CoffeeScript$/ do
  write_coffee_script_definition_file
end

When /^Cucumber executes a scenario using that mapping$/ do
  write_feature <<-EOF
Feature:
  Scenario:
    Given a mapping
EOF
  run_feature
end

Then /^the mapping is run$/ do
  assert_passed "a mapping"
end

Then /^I see the version of Cucumber$/ do
  assert_matching_output "\\d+\\.\\d+\\.\\d+\\n", all_output
  assert_success true
end

Then /^I see the help of Cucumber$/ do
  assert_partial_output "Usage: cucumber.js ", all_output
  assert_success true
end
