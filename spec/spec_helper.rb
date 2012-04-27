# encoding: utf-8

require File.expand_path('../../lib/greeb', __FILE__)

RSpec.configure do |c|
  c.mock_with :rspec
  c.color_enabled = true
end

RSpec::Matchers.define :be_parsed_as do |expected|
  match do |actual|
    @tree = Greeb::Parser.new(actual).parse
    @tree == expected
  end

  failure_message_for_should do |actual|
    "expected: #{expected}\ngot:      #{@tree}"
  end

  failure_message_for_should_not do |actual|
    "expected: #{expected}\ngot:     #{@tree}"
  end
end
