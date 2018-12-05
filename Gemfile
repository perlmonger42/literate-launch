source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}"
end

# Specify your gem's dependencies in literate-launch.gemspec
gemspec
gem 'ruby-graphviz'

group :development, :test do
  gem 'pry'
  gem 'pry-byebug'
  gem 'minitest-rg'
end
