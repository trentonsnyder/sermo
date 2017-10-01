source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'

gem 'bcrypt', '~> 3.1.7'
gem 'jbuilder', '~> 2.5'
gem 'jwt'
gem 'knock', '~> 1.2'
gem 'pg', '~> 0.18'
gem 'phony_rails', '~> 0.14.2'
gem 'puma', '~> 3.7'
gem 'rack-cors'
gem 'redis', '~> 3.3', '>= 3.3.1'
gem 'twilio-ruby', '~> 5.2.3'
gem 'aws-sdk-s3', '~> 1'

group :development, :test do
  gem 'pry'
  gem 'faker', git: 'git://github.com/stympy/faker.git', branch: 'master'
  gem 'awesome_print'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
