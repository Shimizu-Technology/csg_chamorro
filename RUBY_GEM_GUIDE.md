# Ruby Gem — 90-Minute Starter Guide

> **📚 For instructors & self-learners:** This is the complete teaching guide.  
> **🚀 Want to jump right in?** This guide walks you through everything step-by-step!

## Two Ways to Use This Guide:

1. **Build your own gem from scratch** - Follow along with the examples and create whatever gem you want!
2. **Study the working example** - Examine the `csg_chamorro` gem already in this folder for reference

**💡 You can build ANY gem you want!** The guide uses `csg_dad_jokes` as an example, but feel free to create:
- Your own joke/quote gem with custom content
- A Chamorro word gem (see `csg_chamorro` folder)
- A formatter/utility gem (phone numbers, currency, etc.)
- An API wrapper gem
- Anything else you can imagine!

**✨ The `csg_chamorro` gem in this folder is a complete, working reference implementation** that shows advanced features like search, detailed data structures, and comprehensive tests.

---

## 0) What you'll build

**A real Ruby gem** that you can install and use anywhere on your computer!

**This guide uses `csg_dad_jokes` as an example**, but you can build whatever you want!

**Example usage (if you build a dad jokes gem):**
```ruby
require 'csg_dad_jokes'
puts CSGDadJokes.joke
# => "Why don't scientists trust atoms? Because they make up everything!"
```

**Or build something completely different!** See Section 9 for more ideas:
- Chamorro word of the day (see `csg_chamorro` folder for working example!)
- Recipe helper
- Phone number formatter
- Your own custom theme!

**Bonus:** Add a command-line tool:
```bash
$ your_gem_name
Your awesome output here!

$ your_gem_name --pretty
Formatted output with extras!
```

**Why build a gem?**
- 📦 Real Ruby gem (just like Rails, RSpec, Puma, etc.!)
- 🌍 Works on any project after `gem install`
- 💼 Great portfolio piece - "I published a Ruby gem on RubyGems.org"
- 🎨 Create anything you want - jokes, quotes, utilities, formatters, cultural content
- 🎓 Understand how the gems you use every day actually work!

**Time:** 60-75 minutes for core gem, +15 minutes for CLI

**🎯 Remember:** The examples in this guide use `csg_dad_jokes`, but replace it with YOUR gem name and theme!

### 📊 Simple vs. Advanced Approach

| Feature | Simple (Guide Examples) | Advanced (csg_chamorro) |
|---------|------------------------|-------------------------|
| **Data structure** | Array of strings (jokes) | Array of hashes with 5 fields (words) |
| **Methods** | `.joke`, `.pretty`, `.all`, `.count` | `.word_of_day`, `.pretty`, `.all_words`, `.count`, `.search`, `.random_greeting` |
| **CLI flags** | `--pretty`, `--all`, `--count` | `--pretty`, `--all`, `--count`, `--search`, `--greeting` |
| **Comments** | Basic | Detailed, beginner-friendly |
| **Tests** | Optional | 11 comprehensive tests |
| **Best for** | First-time gem builders | 8-10 weeks Ruby experience |

**💡 Recommendation:** Build the simple version first to understand the basics, then level up to the advanced features!

---

## 1) Create the project folder

**🎯 First: Choose your gem name!** Examples:
- `csg_dad_jokes` (jokes)
- `csg_chamorro` (Chamorro words - see working example in folder!)
- `guam_formatter` (phone/currency formatters)
- `island_recipes` (recipe helper)
- **Your own idea!**

### The structure:

```
your_gem_name/
  ├── Gemfile                      ← Gem dependencies
  ├── your_gem_name.gemspec        ← Gem metadata (name, version, etc.)
  ├── Rakefile                     ← Tasks you can run
  ├── lib/                         ← Your actual code
  │   ├── your_gem_name.rb         ← Main file (the entry point)
  │   └── your_gem_name/
  │       └── version.rb           ← Just the version number
  └── bin/                         ← Optional: command-line tools
      └── your_gem_name             ← The CLI command
```

### Create it:

**💡 Replace `csg_dad_jokes` with YOUR gem name in all examples below!**

**Option 1: Using terminal**
```bash
# Replace csg_dad_jokes with YOUR gem name!
mkdir -p csg_dad_jokes/{lib/csg_dad_jokes,bin}
cd csg_dad_jokes
touch Gemfile csg_dad_jokes.gemspec Rakefile
touch lib/csg_dad_jokes.rb lib/csg_dad_jokes/version.rb
touch bin/csg_dad_jokes
```

**Option 2: Using your editor**
- Create the folders manually
- Add each file as shown above

---

## 2) Define the version

**lib/csg_dad_jokes/version.rb**

```ruby
# frozen_string_literal: true

module CSGDadJokes
  VERSION = "0.1.0"
end
```

**✅ Why this file?**
- Keeps version in one place
- Easy to update for new releases
- Standard Ruby convention

---

## 3) Add gem metadata

**csg_dad_jokes.gemspec**

```ruby
# frozen_string_literal: true

require_relative "lib/csg_dad_jokes/version"

Gem::Specification.new do |spec|
  spec.name          = "csg_dad_jokes"
  spec.version       = CSGDadJokes::VERSION
  spec.authors       = ["Your Name"]
  spec.email         = ["your.email@example.com"]

  spec.summary       = "Get dad jokes in your Ruby projects"
  spec.description   = "A simple gem that provides random dad jokes from icanhazdadjoke.com. Built by Code School of Guam students!"
  spec.homepage      = "https://github.com/yourusername/csg_dad_jokes"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 3.0"

  # Which files to include in the gem
  spec.files         = Dir.glob("lib/**/*") + ["README.md", "LICENSE.txt", "Rakefile", "csg_dad_jokes.gemspec", "bin/csg_dad_jokes"]
  
  # Where the main code lives
  spec.require_paths = ["lib"]
  
  # CLI setup (optional - include if you want a command-line tool)
  spec.bindir        = "bin"
  spec.executables   = ["csg_dad_jokes"]
  
  # Dependencies (we only need json, which comes with Ruby)
  spec.add_dependency "json"
end
```

**✅ Key fields:**
- `name` - What users will type: `gem install csg_dad_jokes`
- `version` - Pulled from version.rb
- `files` - What gets packaged in your gem (must include `bin/your_cli` explicitly!)
- `executables` - CLI commands (skip this line if no CLI)

**💡 If you're NOT building a CLI:** Remove the `spec.executables`, `spec.bindir`, and `bin/csg_dad_jokes` from files, then skip section 6.

---

## 4) Write the main code

**lib/your_gem_name.rb** (we'll use `csg_dad_jokes` as an example)

**💡 Two approaches:** 
1. **Simple** - Array of strings (great for starting out!)
2. **Advanced** - Hashes with detailed data (like `csg_chamorro` in this folder)

**🎨 Customize the content!** The examples show dad jokes, but use YOUR theme:
- Your own jokes/quotes
- Chamorro words (see `csg_chamorro`)
- Recipes, tips, formatters, etc.

**Simple version (array of strings):**

```ruby
# frozen_string_literal: true

require_relative "csg_dad_jokes/version"

module CSGDadJokes
  # Array of dad jokes
  JOKES = [
    "Why don't scientists trust atoms? Because they make up everything!",
    "What do you call a fake noodle? An impasta!",
    "Why did the scarecrow win an award? He was outstanding in his field!",
    "What do you call a bear with no teeth? A gummy bear!",
    "Why don't eggs tell jokes? They'd crack each other up!",
    "What did the ocean say to the beach? Nothing, it just waved!",
    "Why did the bicycle fall over? It was two tired!",
    "What do you call cheese that isn't yours? Nacho cheese!"
  ].freeze

  # Main public method - returns a random joke
  def self.joke
    JOKES.sample
  end

  # Bonus method - returns a nicely formatted joke
  def self.pretty
    j = joke
    "\n😄 #{j}\n"
  end

  # Bonus method - returns all jokes
  def self.all
    JOKES
  end

  # Bonus method - returns joke count
  def self.count
    JOKES.length
  end
end
```

**Advanced version (with detailed data - like csg_chamorro):**

See the actual `lib/csg_chamorro.rb` file in this folder for a full example using hash structures with multiple fields (`:chamorro`, `:english`, `:pronunciation`, `:usage`, `:example`), plus `.search()` and `.random_greeting()` methods!

**✅ What this does:**
- `CSGDadJokes.joke` - Returns a random joke
- `CSGDadJokes.pretty` - Returns a formatted joke with emoji
- `CSGDadJokes.all` - Returns all jokes
- `CSGDadJokes.count` - Returns the number of jokes

**📝 Ruby concepts:**
- `module` - Namespace for your code
- `.freeze` - Makes the array immutable (can't be changed)
- `self.method_name` - Class method (call it on the module itself)
- `.sample` - Ruby method to get a random item from an array

---

## 4.5) Test it works (before building the gem)

Let's make sure your code works before packaging it!

**Open IRB in your gem folder:**

```bash
irb
```

**Then test:**

```ruby
require_relative './lib/csg_dad_jokes'

CSGDadJokes.joke
# => "Why don't scientists trust atoms? Because they make up everything!"

CSGDadJokes.pretty
# => "\n😄 What do you call a fake noodle? An impasta!\n"

CSGDadJokes.count
# => 8

CSGDadJokes.all
# => ["Why don't scientists trust atoms?...", ...]
```

**✅ If this works, you're ready to build the gem!**

If you get errors, check:
- File names match exactly
- Code has no typos
- `require_relative` path is correct

---

## 5) Add Gemfile and Rakefile

**Gemfile**

```ruby
# frozen_string_literal: true

source "https://rubygems.org"

# This tells Bundler to use the gemspec for dependencies
gemspec
```

**Rakefile** (optional but handy)

```ruby
# frozen_string_literal: true

require "rake"

desc "Print a random dad joke"
task :joke do
  require_relative "lib/csg_dad_jokes"
  puts CSGDadJokes.pretty
end

desc "Show gem version"
task :version do
  require_relative "lib/csg_dad_jokes/version"
  puts "CSGDadJokes v#{CSGDadJokes::VERSION}"
end
```

**Install dependencies:**

```bash
bundle install
```

You should see: `Bundle complete!`

**Test the Rake tasks:**

```bash
rake joke
rake version
```

---

## 6) Optional: Add a CLI (command-line tool)

Want to run `csg_dad_jokes` in your terminal? Let's build it!

**bin/csg_dad_jokes** (basic version for simple string-based gem)

```ruby
#!/usr/bin/env ruby
# frozen_string_literal: true

require "optparse"
require_relative "../lib/csg_dad_jokes"

# Hash to store which options the user selected
options = {}

# OptionParser reads the command-line flags
OptionParser.new do |opts|
  opts.banner = "Usage: csg_dad_jokes [options]"
  
  # --pretty flag: show formatted output
  opts.on("--pretty", "Print a nicely formatted joke") do
    options[:pretty] = true
  end
  
  # --all flag: list all jokes
  opts.on("--all", "Show all available jokes") do
    options[:all] = true
  end
  
  # --count flag: show total number of jokes
  opts.on("--count", "Show total number of jokes") do
    options[:count] = true
  end
  
  # -h or --help flag: show help
  opts.on("-h", "--help", "Show this help message") do
    puts opts
    exit
  end
end.parse!

# Determine which command to run based on the flags
if options[:all]
  # List all jokes
  CSGDadJokes.all.each_with_index do |joke, i|
    puts "#{i + 1}. #{joke}"
  end
elsif options[:count]
  # Just show the count
  puts "Total jokes: #{CSGDadJokes.count}"
elsif options[:pretty]
  # Show formatted joke
  puts CSGDadJokes.pretty
else
  # Default: simple random joke
  puts CSGDadJokes.joke
end
```

**💡 For advanced CLI with search, greetings, etc.:** Check out the `bin/csg_chamorro` file in this folder for a more complex example with `--search` and `--greeting` flags!

**Make it executable:**

```bash
chmod +x bin/csg_dad_jokes
```

**Test it locally:**

```bash
./bin/csg_dad_jokes
./bin/csg_dad_jokes --pretty
./bin/csg_dad_jokes --all
./bin/csg_dad_jokes --help
```

**✅ If this works, your CLI is ready!**

---

## 7) Build and install your gem

This is where the magic happens! You'll turn your code into an installable gem.

### Step 1: Build the gem

```bash
gem build csg_dad_jokes.gemspec
```

**You should see:**
```
  Successfully built RubyGem
  Name: csg_dad_jokes
  Version: 0.1.0
  File: csg_dad_jokes-0.1.0.gem
```

**✅ Success!** You now have a `.gem` file!

### Step 2: Install it locally

```bash
gem install ./csg_dad_jokes-0.1.0.gem
```

**You should see:**
```
Successfully installed csg_dad_jokes-0.1.0
1 gem installed
```

### Step 3: Test it works everywhere!

**Open a new terminal window** (important!) and try:

**Test in Ruby:**
```bash
ruby -e "require 'csg_dad_jokes'; puts CSGDadJokes.joke"
```

**Test the CLI (if you built it):**
```bash
csg_dad_jokes
csg_dad_jokes --pretty
csg_dad_jokes --all
```

### 🐛 Troubleshooting

**Problem:** `command not found: csg_dad_jokes`

**Solution:** Add RubyGems bin directory to your PATH:

```bash
# Find where gems install binaries:
gem environment | grep "EXECUTABLE DIRECTORY"
# You'll see something like: /usr/local/bin or ~/.rbenv/shims

# Add to your PATH (in ~/.zshrc or ~/.bashrc):
export PATH="$PATH:/path/from/above"

# Reload your shell:
source ~/.zshrc  # or source ~/.bashrc
```

**Problem:** `cannot load such file -- csg_dad_jokes`

**Solutions:**
1. Make sure `gem install` succeeded with no errors
2. Try `gem list csg_dad_jokes` to verify it's installed
3. Check your gemspec `require_paths` includes `["lib"]`
4. Try uninstalling and reinstalling: 
   ```bash
   gem uninstall csg_dad_jokes
   gem install ./csg_dad_jokes-0.1.0.gem
   ```

**Problem:** `gem build` fails with "ERROR: Specification does not validate"

**Solutions:**
- Check all required fields in gemspec are filled out
- Make sure `spec.files` includes files that actually exist
- Verify `version.rb` has the VERSION constant defined

---

## 8) Time budget (90 minutes)

- **Setup & scaffold** (5 min)
- **Version file & gemspec** (10 min)
- **Main code (quotes)** (10 min)
- **Test in IRB** (5 min)
- **Gemfile & Rakefile** (5 min)
- **Build & install** (15 min) ← *This often has PATH issues, budget extra time*
- **Test the installed gem** (5 min)
- **Optional: Build CLI** (20 min)
- **Customize your theme** (10 min)
- **Polish & troubleshooting** (5 min)

**💡 Pro tip:** Get the basic gem working first (sections 1-7), *then* add the CLI. Don't try to do both at once!

---

## 9) Customization Ideas - Make It Your Own!

**🎨 You can build ANY gem you want!** Here are some ideas to inspire you:

### Your Own Theme Ideas:
- Personal quote collection
- Programming tips
- Study flashcards
- Recipe collection
- Workout routines
- Travel tips
- Gaming tips
- Your favorite anything!

### Guam/Chamorro-Themed Ideas:

### Guam Idea #1: Chamorro Word of the Day ✅ (Already built!)

**This is exactly what the `csg_chamorro` gem in this folder does!** Check out these files to see a full, working implementation:
- `lib/csg_chamorro.rb` - Has 12 words with `:chamorro`, `:english`, `:pronunciation`, `:usage`, `:example`
- `bin/csg_chamorro` - CLI with `--search`, `--greeting`, `--pretty`, `--all`, `--count` flags
- `test/csg_chamorro_test.rb` - 11 tests covering all methods

**Key methods:**
```ruby
CSGChamorro.word_of_day      # Returns a random word (hash)
CSGChamorro.pretty           # Formatted output with emoji
CSGChamorro.all_words        # All 12 words
CSGChamorro.count            # Total word count
CSGChamorro.search("hello")  # Search by Chamorro or English
CSGChamorro.random_greeting  # Random greeting only
```

**💡 Tip:** Use this as your reference if you want to build something similar, or build something completely different!

### Guam Idea #2: Guam Phone Number Formatter

```ruby
module GuamFormat
  def self.phone(number)
    # Clean the number (remove non-digits)
    clean = number.to_s.gsub(/\D/, '')
    
    # Format as Guam number
    if clean.length == 7
      "(671) #{clean[0..2]}-#{clean[3..6]}"
    elsif clean.length == 10 && clean.start_with?('671')
      "(#{clean[0..2]}) #{clean[3..5]}-#{clean[6..9]}"
    else
      number # Return original if can't format
    end
  end
  
  def self.currency(amount)
    "$#{'%.2f' % amount}"
  end
end

# Usage:
# GuamFormat.phone("6714551234")  # => "(671) 455-1234"
# GuamFormat.currency(42.5)        # => "$42.50"
```

### Guam Idea #3: Island Recipe Helper

```ruby
module IslandRecipes
  RECIPES = [
    { name: "Kelaguen", time: "20 min", difficulty: "Easy", type: "Chicken/Fish" },
    { name: "Red Rice", time: "45 min", difficulty: "Medium", type: "Side" },
    { name: "Chicken Estufao", time: "60 min", difficulty: "Medium", type: "Main" },
    { name: "Chamorro Empanada", time: "40 min", difficulty: "Hard", type: "Snack" },
    { name: "Latiya", time: "30 min", difficulty: "Easy", type: "Dessert" }
  ].freeze

  def self.random
    recipe = RECIPES.sample
    <<~RECIPE
      #{recipe[:name]} (#{recipe[:type]})
      Time: #{recipe[:time]}
      Difficulty: #{recipe[:difficulty]}
    RECIPE
  end
  
  def self.by_difficulty(level)
    RECIPES.select { |r| r[:difficulty] == level }
  end
end
```

### Guam Idea #4: Weather Helper (F to C converter)

```ruby
module GuamWeather
  def self.f_to_c(fahrenheit)
    celsius = (fahrenheit - 32) * 5.0 / 9.0
    "#{fahrenheit}°F = #{celsius.round(1)}°C"
  end
  
  def self.c_to_f(celsius)
    fahrenheit = (celsius * 9.0 / 5.0) + 32
    "#{celsius}°C = #{fahrenheit.round(1)}°F"
  end
  
  def self.typical_guam_temp
    "Guam's typical temperature: 75-85°F (24-29°C) year-round!"
  end
end
```

### More Ideas:
- **Dad Jokes API wrapper** - Like the Chrome extension, but for Ruby!
- **Motivational quotes** - Your favorite inspirational sayings
- **Sports stats** - Track your favorite teams
- **Study helper** - Flashcards or study tips
- **Code snippets** - Common code patterns you use often

**🎯 The key: Pick something YOU'RE excited about!** The best gems solve real problems or bring joy! 🌴

---

## 10) Optional: Add API integration

Want your gem to fetch data from an API? Here's a simple example using the Dad Jokes API:

```ruby
require "net/http"
require "json"

module CSGDadJokes
  # Fallback jokes if API is down
  LOCAL_JOKES = [
    "Why don't scientists trust atoms? Because they make up everything!",
    "What do you call a fake noodle? An impasta!"
  ].freeze

  def self.joke_from_api
    uri = URI("https://icanhazdadjoke.com/")
    request = Net::HTTP::Get.new(uri)
    # Dad Jokes API requires these headers
    request["Accept"] = "application/json"
    request["User-Agent"] = "CSG Ruby Gem (learning project)"
    
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end
    
    data = JSON.parse(response.body)
    data["joke"]
  rescue StandardError => e
    # If API fails, use local jokes
    LOCAL_JOKES.sample
  end
  
  # Keep the original joke method using local jokes
  def self.joke
    LOCAL_JOKES.sample
  end
end
```

**Usage:**
```ruby
CSGDadJokes.joke_from_api
# => "Why don't scientists trust atoms? Because they make up everything!"

CSGDadJokes.joke
# => "What do you call a fake noodle? An impasta!"
```

**💡 Pro tip:** Always have a fallback! APIs can be slow or go down.

**📚 More APIs to try:**
- [icanhazdadjoke.com](https://icanhazdadjoke.com/api) - Dad jokes (used in our Chrome extension!)
- [jsonplaceholder.typicode.com](https://jsonplaceholder.typicode.com/) - Fake data for testing
- [open-meteo.com](https://open-meteo.com/) - Weather data

---

## 11) Polishing touches (choose 1-2)

### Add a README.md

```markdown
# CSG Dad Jokes 🌴😄

Get dad jokes in your Ruby projects!

## Installation

```bash
gem install csg_dad_jokes
```

## Usage

```ruby
require 'csg_dad_jokes'

CSGDadJokes.joke
# => "Why don't scientists trust atoms? Because they make up everything!"

CSGDadJokes.pretty
# => "😄 What do you call a fake noodle? An impasta!"

CSGDadJokes.all
# => array of all jokes
```

## Command Line

```bash
csg_dad_jokes              # Random joke
csg_dad_jokes --pretty     # Formatted joke
csg_dad_jokes --all        # Show all jokes
```

## Built by Code School of Guam Students 🌴

Learn more at https://codeschoolofguam.com
```

### Add a LICENSE file

Create `LICENSE.txt`:

```
MIT License

Copyright (c) 2025 Your Name

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

### Add simple tests (optional)

Create `test/csg_dad_jokes_test.rb`:

```ruby
require "minitest/autorun"
require_relative "../lib/csg_dad_jokes"

class CSGDadJokesTest < Minitest::Test
  def test_joke_returns_string
    assert_kind_of String, CSGDadJokes.joke
  end
  
  def test_joke_is_not_empty
    refute_empty CSGDadJokes.joke
  end
  
  def test_count_matches_jokes
    assert_equal 8, CSGDadJokes.count
  end
  
  def test_all_returns_array
    assert_kind_of Array, CSGDadJokes.all
  end
end
```

Run tests: `ruby test/csg_dad_jokes_test.rb`

---

## 12) Publishing to RubyGems.org (Optional)

Ready to share your gem with the world?

### Why publish?
- 🌟 Anyone can install with `gem install your_gem`
- 📱 Great portfolio piece
- 💼 Shows you understand Ruby packaging
- 🎓 Real open-source contribution!

### Steps to publish:

**1. Create a RubyGems.org account**
- Go to [rubygems.org](https://rubygems.org)
- Sign up (it's free!)
- Verify your email

**2. Prepare your gem**
- ✅ Ensure README.md exists with good documentation
- ✅ Add LICENSE.txt file
- ✅ Make sure gemspec has homepage and description
- ✅ Test thoroughly - no bugs!
- ✅ Update version if needed

**3. Get your API key**
```bash
gem signin
# Enter your rubygems.org credentials
```

**4. Build your gem (if not already built)**
```bash
gem build csg_dad_jokes.gemspec
```

**5. Push to RubyGems**
```bash
gem push csg_dad_jokes-0.1.0.gem
```

You'll see:
```
Pushing gem to https://rubygems.org...
Successfully registered gem: csg_dad_jokes (0.1.0)
```

**6. Verify it's live**
- Visit `https://rubygems.org/gems/your_gem_name`
- Try installing: `gem install your_gem_name`

### 📝 Publishing Tips:

**Good gem names:**
- Use underscores: `csg_dad_jokes` not `csg-dad-jokes`
- Make it descriptive: `guam_phone_formatter` not `formatter`
- Check if name is taken: search on rubygems.org first

**Versioning:**
- Start with `0.1.0` for your first release
- Use [Semantic Versioning](https://semver.org/): MAJOR.MINOR.PATCH
- Update version in `version.rb` before each release

**Before publishing:**
- Search for similar gems (don't duplicate existing work)
- Make sure your gem name is unique
- Test on a fresh Ruby installation if possible

### Updating your gem:

1. Make your code changes
2. Update `version.rb` (e.g., `0.1.0` → `0.1.1`)
3. Rebuild: `gem build csg_dad_jokes.gemspec`
4. Push: `gem push csg_dad_jokes-0.1.1.gem`

### Alternative: Keep it private

Don't want to publish? That's fine!
- Share the `.gem` file directly with friends
- They can install with: `gem install ./your_gem.gem`
- Perfect for internal/team tools

---

## 13) Demo checklist (end of session)

✅ `gem build` succeeds with no errors

✅ `gem install` works locally

✅ Can `require 'your_gem'` and use it in Ruby

✅ CLI works (if you built one)

✅ Each person shares:
- What their gem does
- One unique feature or theme
- One thing they learned about Ruby gems

✅ **Bonus:** Push to GitHub for your portfolio

✅ **Bonus:** Publish to RubyGems.org!

---

## Quick "starter tasks" you can assign to pairs

| Pair | Task |
|------|------|
| **Pair A** (Chamorro Culture) | Build a Chamorro word-of-the-day gem |
| **Pair B** (Utilities) | Create Guam phone/currency formatters |
| **Pair C** (Recipes) | Make an island recipe helper gem |
| **Pair D** (Weather) | Build a temperature converter with Guam context |
| **Pair E** (API Integration) | Connect to an external API with fallback quotes |
| **Pair F** (Testing) | Focus on adding comprehensive tests to a basic gem |

---

## 14) Common issues & solutions

| Problem | Solution |
|---------|----------|
| **Gem build fails** | Check gemspec syntax, ensure all files in `spec.files` exist |
| **CLI not found** | Add RubyGems bin dir to PATH, or use `bundle exec` |
| **LoadError on require** | Verify `spec.require_paths = ["lib"]` in gemspec |
| **Version error** | Make sure VERSION constant is defined in version.rb |
| **Windows issues** | Use WSL (Windows Subsystem for Linux) for consistency |
| **Permission denied** | Use `chmod +x bin/your_cli` to make CLI executable |

---

## 15) Resources

- [RubyGems Guides](https://guides.rubygems.org/)
- [Bundler Documentation](https://bundler.io/guides/creating_gem.html)
- [Semantic Versioning](https://semver.org/)
- [RubyGems.org](https://rubygems.org/)
- [Ruby Style Guide](https://rubystyle.guide/)
- [Minitest Documentation](https://github.com/minitest/minitest)

---

**Good luck building! 🚀 Remember: Start simple, get it working, then make it awesome.**

**Si Yu'os Ma'åse' for learning with Code School of Guam! 🌴**

