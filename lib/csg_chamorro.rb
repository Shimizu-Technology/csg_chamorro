# frozen_string_literal: true

require_relative "csg_chamorro/version"

module CSGChamorro
  # Collection of Chamorro words with translations and usage
  WORDS = [
    {
      chamorro: "Håfa Adai",
      english: "Hello",
      pronunciation: "half-a-day",
      usage: "Traditional Chamorro greeting used throughout the day",
      example: "Håfa Adai! Welcome to Guam!"
    },
    {
      chamorro: "Si Yu'os Ma'åse'",
      english: "Thank you",
      pronunciation: "see-you-os-ma-ah-see",
      usage: "Expression of gratitude and appreciation",
      example: "Si Yu'os Ma'åse' for helping me today."
    },
    {
      chamorro: "Inafa'maolek",
      english: "To make good / Harmony",
      pronunciation: "in-a-fa-mow-lek",
      usage: "Core Chamorro value of cooperation and harmony",
      example: "We practice Inafa'maolek in our community."
    },
    {
      chamorro: "Biba",
      english: "Long live / Hurray",
      pronunciation: "bee-bah",
      usage: "Celebration or showing pride",
      example: "Biba Guåhan! (Long live Guam!)"
    },
    {
      chamorro: "Hågat",
      english: "Hello (casual)",
      pronunciation: "haw-got",
      usage: "Informal greeting among friends",
      example: "Hågat! How are you doing?"
    },
    {
      chamorro: "Adios",
      english: "Goodbye",
      pronunciation: "ah-dee-os",
      usage: "Farewell greeting",
      example: "Adios, see you tomorrow!"
    },
    {
      chamorro: "Pågo",
      english: "Now",
      pronunciation: "paw-go",
      usage: "Refers to the present moment",
      example: "We need to leave pågo."
    },
    {
      chamorro: "Guåhan",
      english: "Guam",
      pronunciation: "gwa-han",
      usage: "The Chamorro name for the island of Guam",
      example: "I'm from Guåhan, born and raised!"
    },
    {
      chamorro: "I Manåmko'",
      english: "The elders",
      pronunciation: "ee man-am-ko",
      usage: "Respected elders in the community",
      example: "We learn from I Manåmko' and honor their wisdom."
    },
    {
      chamorro: "Nåna",
      english: "Mother / Mom",
      pronunciation: "nah-nah",
      usage: "Respectful term for mother",
      example: "My nåna makes the best kelaguen."
    },
    {
      chamorro: "Tåta",
      english: "Father / Dad",
      pronunciation: "tah-tah",
      usage: "Respectful term for father",
      example: "Tåta taught me how to fish."
    },
    {
      chamorro: "Hafa tatatmanu hao?",
      english: "How are you?",
      pronunciation: "hah-fa ta-tot-ma-nu how",
      usage: "Common greeting to ask about someone's wellbeing",
      example: "Håfa Adai! Hafa tatatmanu hao?"
    }
  ].freeze

  # Get a random Chamorro word
  def self.word_of_day
    WORDS.sample
  end

  # Get a nicely formatted word
  def self.pretty
    word = word_of_day
    "\n📚 #{word[:chamorro]} - #{word[:english]}\n" \
    "Pronunciation: #{word[:pronunciation]}\n" \
    "Example: #{word[:example]}\n"
  end

  # Get all words
  def self.all_words
    WORDS
  end

  # Count total words
  def self.count
    WORDS.length
  end

  # Search for words by Chamorro or English term
  # Returns an array of matching words
  def self.search(term)
    # Convert search term to lowercase for case-insensitive search
    search_term = term.downcase
    
    # Filter words where chamorro OR english includes the search term
    WORDS.select do |word|
      word[:chamorro].downcase.include?(search_term) ||
        word[:english].downcase.include?(search_term)
    end
  end

  # Get a random greeting from the collection
  # Only returns words that are greetings
  def self.random_greeting
    # Filter to only words with "greeting" in the usage
    greetings = WORDS.select { |word| word[:usage].downcase.include?("greeting") }
    
    # Return a random greeting
    greetings.sample
  end
end

