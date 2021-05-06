source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails',      '6.0.3'
gem 'mysql2',     '0.4.10'
gem 'aws-sdk-s3',              '1.46.0', require: false
gem 'active_storage_validations', '0.8.2'
gem 'image_processing',           '1.9.3'
gem 'mini_magick',                '4.9.5'
gem 'bcrypt',     '3.1.13'
gem 'kaminari',   '1.2.1'
gem 'faker',      '2.1.2'
gem 'puma',       '4.3.6'
gem 'sass-rails', '5.1.0'
gem 'webpacker',  '5.3.0'
gem 'turbolinks', '5.2.0'
gem 'jbuilder',   '2.9.1'
gem 'bootsnap',   '1.4.5', require: false
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'

group :production, :staging do
    gem 'unicorn', '6.0.0'
end


group :development do
  gem 'web-console',           '4.0.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'capybara',           '3.28.0'
  gem 'selenium-webdriver', '3.142.4'
  gem 'webdrivers',         '4.1.2'
  gem 'rails-controller-testing', '1.0.4'
end

# Windows ではタイムゾーン情報用の tzinfo-data gem を含める必要があります
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]