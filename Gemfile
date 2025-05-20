source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

gem 'rails', '~> 6.0.6'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 4.1'
gem 'concurrent-ruby', '1.3.4'

# Trailblazer
gem 'trailblazer'
gem 'trailblazer-rails'
gem 'trailblazer-cells'

# JSON:API
gem 'jsonapi-rails'

# CORS-Unterstützung
gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
