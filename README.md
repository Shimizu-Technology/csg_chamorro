# CSG Chamorro 🌴

Learn Chamorro words and phrases with your Ruby projects! A gem built by Code School of Guam students to preserve and share the Chamorro language.

[![Gem Version](https://badge.fury.io/rb/csg_chamorro.svg)](https://badge.fury.io/rb/csg_chamorro)

**🎉 Now published on RubyGems.org!** Install with: `gem install csg_chamorro`

## Table of Contents
- [Why This Gem?](#why-this-gem)
- [What's Included](#whats-included)
- [Project Structure](#-project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [Testing Locally](#-testing-locally-for-developers)
- [Development](#development)
- [Contributing](#contributing)
- [Publishing](#-publishing-to-rubygemsorg-optional)

---

## Why This Gem?

The Chamorro language is an important part of Guam's cultural heritage. This gem helps:
- **Preserve** the language through technology
- **Share** Chamorro words with developers worldwide
- **Learn** basic Chamorro phrases in an accessible way
- **Integrate** language learning into daily development work

## What's Included

The gem includes **12 common Chamorro words and phrases**:

1. **Håfa Adai** - Hello
2. **Si Yu'os Ma'åse'** - Thank you
3. **Inafa'maolek** - Harmony/To make good
4. **Biba** - Long live/Hurray
5. **Hågat** - Hello (casual)
6. **Adios** - Goodbye
7. **Pågo** - Now
8. **Guåhan** - Guam
9. **I Manåmko'** - The elders
10. **Nåna** - Mother
11. **Tåta** - Father
12. **Hafa tatatmanu hao?** - How are you?

Each word includes:
- Chamorro spelling
- English translation
- Pronunciation guide
- Usage context
- Example sentence

---

## 📁 Project Structure

Understanding what each file and folder does:

```
csg_chamorro/
├── lib/                              ← Your Ruby code lives here
│   ├── csg_chamorro.rb              ← Main file with all the methods
│   └── csg_chamorro/
│       └── version.rb                ← Just the version number (0.1.0)
│
├── bin/                              ← Executable command-line tools
│   └── csg_chamorro                  ← The CLI script (runs when you type 'csg_chamorro')
│
├── test/                             ← Automated tests
│   └── csg_chamorro_test.rb         ← Tests all the methods work correctly
│
├── csg_chamorro.gemspec              ← Gem metadata (name, version, description, etc.)
├── Gemfile                           ← Lists dependencies (what other gems this needs)
├── Gemfile.lock                      ← Locks exact versions of dependencies
├── Rakefile                          ← Defines tasks you can run (rake word, rake list, etc.)
├── README.md                         ← Documentation (this file!)
└── LICENSE.txt                       ← MIT License (how others can use your code)
```

### What Each Folder Does:

**`lib/`** - The main code
- This is where your actual Ruby code lives
- `lib/csg_chamorro.rb` is the "entry point" - it's what runs when someone does `require 'csg_chamorro'`
- `lib/csg_chamorro/version.rb` stores the version number
- Ruby convention: main file name matches the gem name

**`bin/`** - Command-line executables
- Contains scripts that users can run from the terminal
- `bin/csg_chamorro` is the CLI tool
- After installing the gem, typing `csg_chamorro` in terminal runs this file
- Must start with `#!/usr/bin/env ruby` (tells system to run it with Ruby)

**`test/`** - Automated tests
- Contains test files that verify your code works
- `test/csg_chamorro_test.rb` has 11 tests
- Run with: `ruby test/csg_chamorro_test.rb`
- Uses Minitest framework (comes with Ruby)

### What Each File Does:

**`csg_chamorro.gemspec`** - Gem specification
- Tells RubyGems everything about your gem
- Name, version, authors, description
- What files to include in the gem package
- What dependencies it needs
- Required for building the gem

**`Gemfile`** - Dependency management
- Lists gems your project depends on
- In our case, just says `gemspec` (use dependencies from .gemspec)
- Run `bundle install` to install dependencies
- Creates `Gemfile.lock` with exact versions

**`Rakefile`** - Task definitions
- Defines shortcuts for common tasks
- `rake word` - print a random word
- `rake list` - list all words
- `rake test` - run tests
- `rake version` - show version
- Like npm scripts, but for Ruby

**`README.md`** - Documentation
- First thing people see on GitHub
- Explains what the gem does
- Shows how to install and use it
- Includes examples

**`LICENSE.txt`** - Legal stuff
- MIT License (very permissive)
- Says others can use, modify, and share your code
- Required if you publish to RubyGems.org

## Installation

**This gem is published on RubyGems.org!** Anyone can install it:

```bash
gem install csg_chamorro
```

Or add to your Gemfile:

```ruby
gem 'csg_chamorro'
```

Then run `bundle install`.

> **📝 Note for students:** This reference gem is already published, so you can install it right away! However, when you create YOUR own gem, it won't be installable via `gem install` until you publish it to RubyGems.org (see "Publishing" section below). Until then, test it locally using the "Testing Locally" section!

---

## Usage

### In Ruby

```ruby
require 'csg_chamorro'

# Get a random Chamorro word
word = CSGChamorro.word_of_day
puts word[:chamorro]  # => "Håfa Adai"
puts word[:english]   # => "Hello"
puts word[:pronunciation]  # => "half-a-day"

# Get a nicely formatted word
puts CSGChamorro.pretty
# => 
# 📚 Chamorro Word of the Day
# 
# Chamorro: Håfa Adai
# English: Hello
# Pronunciation: half-a-day
# Usage: Traditional Chamorro greeting used throughout the day
# Example: "Håfa Adai! Welcome to Guam!"

# Get all words
all_words = CSGChamorro.all_words  # => Array of 12 words

# Count total words
CSGChamorro.count  # => 12

# Search for a word
results = CSGChamorro.search("thank")
# => [{chamorro: "Si Yu'os Ma'åse'", english: "Thank you", ...}]

# Get a random greeting
greeting = CSGChamorro.random_greeting
```

### Command Line

```bash
# Random word of the day
csg_chamorro
# => Håfa Adai - Hello

# Formatted output
csg_chamorro --pretty
# => Full formatted output with pronunciation and example

# Show all words
csg_chamorro --all

# Count words
csg_chamorro --count
# => Total Chamorro words: 12

# Get a random greeting
csg_chamorro --greeting

# Search for a word
csg_chamorro --search "hello"

# Help
csg_chamorro --help
```

---

## Examples

### Terminal Greeting

```ruby
require 'csg_chamorro'

# Print a Chamorro word every time you open your terminal
# Add to your ~/.zshrc or ~/.bashrc:
# ruby -e "require 'csg_chamorro'; puts CSGChamorro.pretty"
```

### Slack Bot

```ruby
require 'csg_chamorro'

# Send a Chamorro word to your team Slack
word = CSGChamorro.word_of_day
message = "🌴 Chamorro Word of the Day: #{word[:chamorro]} (#{word[:english]})\n" \
          "Pronunciation: #{word[:pronunciation]}\n" \
          "#{word[:usage]}"
# send_to_slack(message)
```

### Learning App

```ruby
require 'csg_chamorro'

# Quiz yourself on Chamorro words
word = CSGChamorro.word_of_day
puts "What does '#{word[:chamorro]}' mean?"
# ... get user input ...
puts word[:english]
```

---

## 🧪 Testing Locally (For Developers)

Want to test this gem before installing? Here's how:

### Quick Test in IRB

```bash
# Navigate to the gem folder
cd csg_chamorro

# Open IRB
irb
```

Then load and test the gem:
```ruby
# Load the gem
require './lib/csg_chamorro'

# Test the methods
CSGChamorro.word_of_day
CSGChamorro.pretty
CSGChamorro.search("hello")
CSGChamorro.random_greeting
```

### Run the Tests

```bash
ruby test/csg_chamorro_test.rb
```

Should see: `11 runs, 15 assertions, 0 failures`

### Test Rake Tasks

```bash
bundle install   # First time only
rake word        # Random word
rake list        # All words
rake version     # Show version
rake test        # Run tests
```

### Build & Install Locally

```bash
# Build the gem
gem build csg_chamorro.gemspec
# Creates: csg_chamorro-0.1.0.gem

# Install it
gem install ./csg_chamorro-0.1.0.gem

# Test it works
csg_chamorro --pretty
```

---

## Development

After checking out the repo:

```bash
bundle install
bundle exec rake -T  # See available tasks
```

Run tests:
```bash
ruby test/csg_chamorro_test.rb
```

Build and install locally:
```bash
gem build csg_chamorro.gemspec
gem install ./csg_chamorro-0.1.0.gem
```

## Contributing

We welcome contributions! To add more Chamorro words:

1. Fork the repository
2. Add words to `WORDS` array in `lib/csg_chamorro.rb`
3. Follow the existing format (chamorro, english, pronunciation, usage, example)
4. Submit a pull request

## About Chamorro Language

Chamorro is the indigenous language of the Mariana Islands (Guam and Northern Mariana Islands). It's a vital part of the island's cultural identity and is actively preserved through education and community programs.

**Resources for learning more:**
- [Guampedia](https://www.guampedia.com/)
- [Chamorro Language & Culture](https://www.chamoru.info/)
- [University of Guam Chamorro Studies](https://www.uog.edu/)

## 🚀 Publishing to RubyGems.org (Optional)

Want to share this gem with the world? Here's how to publish it:

### Step 1: Create a RubyGems.org Account
- Go to [rubygems.org](https://rubygems.org)
- Sign up (it's free!)
- Verify your email

### Step 2: Sign In and Create API Key

Run `gem signin` and follow the prompts:
```bash
gem signin
# Enter your RubyGems.org credentials
# Give your API key a name (e.g., "CSG-RubyGems")
# When asked "Do you want to customise scopes? [yN]"
#   - Type "N" (easiest - we'll add permissions on the website)
#   - OR type "Y" and manually add scopes in the terminal
```

### Step 3: Add Push Permissions to Your API Key

**Important:** By default, the API key only has "Index" permissions. You need to add Push!

1. Go to https://rubygems.org/settings/api_keys
2. Click "Edit" on the API key you just created
3. Under **Scopes**, check:
   - ✅ **Push rubygem** (required to publish - this is the one you need!)
   - ✅ Index rubygems (already checked)
   - Optional: Yank rubygem (to unpublish if needed)
4. Click "Update API Key"

**You're now ready to publish!** No need to sign in again.

**💡 Note:** If you typed "Y" in step 2 and added Push permissions in the terminal, you can skip this step!

### Step 4: Build Your Gem
```bash
gem build csg_chamorro.gemspec
# Creates: csg_chamorro-0.1.0.gem
```

### Step 5: Push to RubyGems
```bash
gem push csg_chamorro-0.1.0.gem
```

You'll see:
```
Pushing gem to https://rubygems.org...
Successfully registered gem: csg_chamorro (0.1.0)
```

### Step 6: Verify It's Live
- Visit `https://rubygems.org/gems/csg_chamorro`
- Try installing: `gem install csg_chamorro`

**Now anyone in the world can use your gem!** 🌍

### Updating Your Gem

When you make changes:
1. Update version in `lib/csg_chamorro/version.rb` (e.g., `0.1.0` → `0.1.1`)
2. Rebuild: `gem build csg_chamorro.gemspec`
3. Push: `gem push csg_chamorro-0.1.1.gem`

---

## Built by Code School of Guam 🌴

This gem was created as a learning project by students at Code School of Guam to:
- Learn Ruby gem development
- Practice version control and collaboration
- Contribute to cultural preservation
- Build portfolio-worthy projects

Learn more at https://codeschoolofguam.com

## License

MIT License - see LICENSE.txt

## Si Yu'os Ma'åse' (Thank You!)

Thank you for helping preserve and share the Chamorro language through technology! 🌴

**Biba Guåhan!** (Long live Guam!)

