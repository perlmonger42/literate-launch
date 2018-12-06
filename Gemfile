# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}"
end

# Specify your gem's dependencies in literate-launch.gemspec
gemspec

# gem 'adobe-reactor',
#     git: 'https://github.com/perlmonger42/reactor-sdk-ruby.git',
#     ref: 'fca3269f0d9339c68e61f1133d9daba7e45be362'
gem 'adobe-reactor', path: '../reactor-sdk-ruby'

group :development, :test do
  gem 'minitest-rg'
  gem 'pry'
  gem 'pry-byebug'
end
