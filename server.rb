#!/usr/bin/env ruby
require "model-context-protocol-rb"
require_relative "hello_resource"

# Create a new MCP server instance
server = ModelContextProtocol::Server.new do |config|
  config.name = "Hello MCP Server"
  config.version = "1.0.0"
  config.enable_log = true

  # Register our components
  config.registry = ModelContextProtocol::Server::Registry.new do
    resources list_changed: true, subscribe: true do
      register HelloResource
    end
  end
end

puts "Starting Hello MCP server..."
server.start
