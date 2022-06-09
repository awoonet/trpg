source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "actionpack", ">= 7.0.2.4"    # For updates due to Dependabot alerts
gem "actionview", ">= 7.0.2.4"    # For updates due to Dependabot alerts
gem "activestorage", ">= 7.0.2.3" # For updates due to Dependabot alerts
gem "bootsnap", require: false    # Reduces boot times through caching; required in config/boot.rb
gem "carrierwave", "~> 2.0"       # Ability to save files (images)
gem "cssbundling-rails"           # Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "jbuilder"                    # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jsbundling-rails"            # Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "meta-tags"                   # Titles of pages in title
gem "nokogiri", ">= 1.13.6"       # For updates due to Dependabot alerts
gem "pagy", "~> 5.10"             # Pagination tool
gem "pg", "~> 1.1"                # Use postgresql as the database for Active Record
gem "puma", "~> 5.0"              # Use the Puma web server [https://github.com/puma/puma]
gem "rack", ">= 2.2.3.1"          # For updates due to Dependabot alerts
gem "rails", "~> 7.0.0"           # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "redis", "~> 4.0"             # Use Redis adapter to run Action Cable in production
gem "sassc-rails"                 # Use Sass to process CSS
gem "slim", "~> 3.0", ">= 3.0.6"  # Slim templates
gem "sorcery"                     # Simple Password Authentication 
gem "sprockets-rails"             # The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "stimulus-rails"              # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "turbo-rails"                 # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem

# gem "bcrypt", "~> 3.1.7"          # Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "image_processing", "~> 1.2"  # Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "kredis"                      # Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ] # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "pry", "~> 0.13.1"
  gem "faker", :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
end

group :development do
  gem "web-console"           # Use console on exceptions pages [https://github.com/rails/web-console]
  # gem "rack-mini-profiler"  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "spring"              # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
