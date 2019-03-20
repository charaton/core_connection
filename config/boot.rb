ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

# NOTE: https://github.com/Shopify/bootsnap/issues/77
# require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
