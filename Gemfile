source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.7.5'

gem 'rails', '~> 6.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'uglifier', '>= 1.3.0'
gem 'sass-rails', '~> 5'

gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'haml'
gem 'jquery-rails'
gem 'bootstrap', '~> 4.0.0'

gem 'rails_admin'
gem 'seed_dump'

group :development, :test do
  gem 'pry-rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development do
  gem 'annotate'
  gem 'erb2haml'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
