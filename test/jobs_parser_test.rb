require 'test_helper'

class JobsParserTest < Test::Unit::TestCase
  context 'The jobs parser' do

    setup do
      @jobs = "a =>\nb => c\nc =>"
    end

    should 'parse a valid job sequence into a hash' do
      assert_equal({"a" => nil, "b" => "c", "c" => nil}, JobsParser.new(@jobs).parse)
    end
  end
end