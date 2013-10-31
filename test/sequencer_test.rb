require 'test_helper'

class SequencerTest < Test::Unit::TestCase
  context 'A new sequencer' do

    context 'that is passed an empty string' do
      
      setup do
        @sequencer = Sequencer.new('')
      end

      should 'return an empty sequence' do
        assert_equal '', @sequencer.sequence
      end

    end

    context 'that is passed the job structure "a =>"' do
      
      setup do
        @sequencer = Sequencer.new('a =>')
      end

      should 'return the sequence: a' do
        assert_equal ['a'], @sequencer.sequence
      end

    end

    context 'that is passed the job structure
              a =>
              b =>
              c =>' do
      
      setup do
        @sequencer = Sequencer.new("a =>\nb =>\nc =>")
      end

      should 'return the sequence: abc' do
        assert_equal ['a','b','c'], @sequencer.sequence
      end

    end

    context 'that is passed the job structure
              a =>
              b => c
              c =>' do
      
      setup do
        @sequencer = Sequencer.new("a =>\nb => c\nc =>")
      end

      should 'return the sequence: abc' do
        assert_equal ['a','c','b'], @sequencer.sequence
      end

    end
  end
end