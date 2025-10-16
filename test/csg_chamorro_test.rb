# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/csg_chamorro"

class CSGChamorroTest < Minitest::Test
  # Test that word_of_day returns a Hash
  def test_word_of_day_returns_hash
    word = CSGChamorro.word_of_day
    assert_kind_of Hash, word
  end
  
  # Test that each word has the required keys
  def test_word_has_required_keys
    word = CSGChamorro.word_of_day
    assert word.key?(:chamorro)
    assert word.key?(:english)
    assert word.key?(:pronunciation)
    assert word.key?(:usage)
    assert word.key?(:example)
  end
  
  # Test that pretty returns a String
  def test_pretty_returns_string
    assert_kind_of String, CSGChamorro.pretty
  end
  
  # Test that all_words returns an Array that's not empty
  def test_all_words_returns_array
    assert_kind_of Array, CSGChamorro.all_words
    refute_empty CSGChamorro.all_words
  end
  
  # Test that count matches the actual number of words
  def test_count_is_correct
    assert_equal 12, CSGChamorro.count
    assert_equal CSGChamorro.all_words.length, CSGChamorro.count
  end
  
  # Test that WORDS constant is frozen (can't be modified)
  def test_words_are_frozen
    assert CSGChamorro::WORDS.frozen?
  end
  
  # Test search finds words by Chamorro term
  def test_search_finds_chamorro_words
    results = CSGChamorro.search("håfa")
    refute_empty results
    # Check that at least one result contains "håfa" in the chamorro field
    assert results.any? { |word| word[:chamorro].downcase.include?("håfa") }
  end
  
  # Test search finds words by English term
  def test_search_finds_english_words
    results = CSGChamorro.search("hello")
    refute_empty results
    # Check that at least one result contains "hello" in the english field
    assert results.any? { |word| word[:english].downcase.include?("hello") }
  end
  
  # Test search returns empty array when no match
  def test_search_returns_empty_for_no_match
    results = CSGChamorro.search("xyz123notaword")
    assert_empty results
  end
  
  # Test that random_greeting returns a Hash
  def test_random_greeting_returns_hash
    greeting = CSGChamorro.random_greeting
    assert_kind_of Hash, greeting
  end
  
  # Test that random_greeting only returns greeting words
  def test_random_greeting_is_actually_greeting
    greeting = CSGChamorro.random_greeting
    # The usage field should contain "greeting"
    assert greeting[:usage].downcase.include?("greeting")
  end
end

