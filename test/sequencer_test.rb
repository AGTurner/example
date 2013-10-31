require 'test_helper'

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

    context 'that is passed the job structure "a =>"' do
      
      setup do
        @jobs = 'a =>'
      end

      should 'return the sequence: a' do
        assert_equal ['a'], @sequencer.sequence(@jobs)
      end

    end

    context 'that is passed the job structure
              a =>
              b =>
              c =>' do
      
      setup do
        @jobs = "a =>\nb =>\nc =>"
      end

      should 'return the sequence: abc' do
        assert_equal ['a','b','c'], @sequencer.sequence(@jobs)
      end

    end
  end
end