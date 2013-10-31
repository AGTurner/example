require 'test/unit'
require 'shoulda'
require_relative '../lib/sequencer'

class SequencerTest < Test::Unit::TestCase
  context 'A new sequencer' do
    
    setup do
      @sequencer = Sequencer.new
    end

    context 'that is passed an empty string' do
      
      setup do
        @jobs = ''
      end

      should 'return an empty sequence' do
        assert_equal '', @sequencer.sequence(@jobs)
      end
      
    end
  end
end