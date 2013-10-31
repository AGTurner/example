require 'test_helper'

class SequencerTest < Test::Unit::TestCase
  context 'A new sequencer' do

    setup do
      @assert_hash = {}
    end

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

      should 'return the a sequence that positions c before b, containing all three jobs abc' do
        result = @sequencer.sequence
        result.each_with_index do |job, index|
          @assert_hash[job] = index
        end
        assert_equal 'abc', result.sort.join('')
        assert @assert_hash['c'] < @assert_hash['b']
      end

    end

    context 'that is passed the job structure
              a =>
              b => c
              c => f
              d => a
              e => b
              f =>' do
      
      setup do
        @sequencer = Sequencer.new("a =>\nb => c\nc =>f\nd => a\ne => b\nf =>")
      end

      should 'return a sequence that positions f before c, c before b, b before e and a before d containing all six jobs abcdef' do
        result = @sequencer.sequence
        result.each_with_index do |job, index|
          @assert_hash[job] = index
        end
        assert_equal 'abcdef', result.sort.join('')
        assert @assert_hash['f'] < @assert_hash['c']
        assert @assert_hash['c'] < @assert_hash['b']
        assert @assert_hash['a'] < @assert_hash['d']
      end

    end
  end
end