source "https://rubygems.org"

ruby '3.2.2'

gem 'cocoapods', '~> 1.14.3'
gem "fastlane"

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)