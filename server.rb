#!/usr/bin/env ruby

# Script to start Rails server in the myapp directory using Rack::Handler::Puma
# Usage: ruby server.rb

require 'fileutils'
require 'rack'
require 'rack/handler/puma'

# Get the absolute path to the myapp directory
myapp_dir = File.expand_path(File.join(File.dirname(__FILE__), 'myapp'))

# Check if the myapp directory exists
unless Dir.exist?(myapp_dir)
  puts "Error: myapp directory not found at #{myapp_dir}"
  exit 1
end

puts "Starting Rails server in #{myapp_dir}..."

# Change to the myapp directory and start the Rails server
Dir.chdir(myapp_dir) do
  # Load Rails environment
  require File.join(myapp_dir, 'config', 'environment')

  # Set server options (similar to default Rails server settings)
  options = {
    Port: 3000,
    Host: '0.0.0.0',
    Silent: false,
    Threads: '0:16'
  }

  # Start the Rails server using Rack::Handler::Puma
  # Pass options as a parameter to the run method
  Rack::Handler::Puma.run(Rails.application, **options)
end
