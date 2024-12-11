source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.6"

# Core Rails gems
gem "rails", "~> 7.0.0"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem 'bootsnap', '>= 1.4.4', require: false


# Spina CMS
gem "spina"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem "factory_bot_rails"
end

group :development do
  gem "listen", "~> 3.8"
end