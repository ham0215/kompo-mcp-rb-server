#!/usr/bin/env ruby

require "model_context_protocol"
require_relative "hello_prompt"
require_relative "hello_resource"
require_relative "hello_tool"

# Create a new MCP server instance
server = ModelContextProtocol::Server.new do |config|
  config.name = "Hello MCP Server"
  config.version = "1.0.0"
  config.enable_log = true

  # Register our components
  config.registry = ModelContextProtocol::Server::Registry.new do
    prompts list_changed: true do
      register HelloPrompt
    end
    resources list_changed: true, subscribe: true do
      register HelloResource
    end
    tools list_changed: true do
      register HelloTool
    end
  end
end

server.start
