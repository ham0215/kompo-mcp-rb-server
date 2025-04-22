#!/usr/bin/env ruby

require "model_context_protocol"

# HelloPrompt definition
class HelloPrompt < ModelContextProtocol::Server::Prompt
  with_metadata do
    {
      name: "hello_prompt",
      description: "A prompt that generates a greeting message",
      arguments: [
        {
          name: "name",
          description: "The name of the person to greet",
          required: true
        }
      ]
    }
  end

  def call
    name = params["name"]

    greeting_text = "こんにちは、#{name}さん！お元気ですか？"

    messages = [
      {
        role: "user",
        content: {
          type: "text",
          text: "Please greet me."
        }
      },
      {
        role: "assistant",
        content: {
          type: "text",
          text: greeting_text
        }
      }
    ]

    respond_with messages: messages
  end
end

# HelloResource definition
class HelloResource < ModelContextProtocol::Server::Resource
  with_metadata do
    {
      name: "hello_resource",
      description: "A simple resource that returns HELLO",
      mime_type: "text/plain",
      uri: "resource://hello-resource"
    }
  end

  def call
    respond_with :text, text: "HELLO"
  end
end

# HelloTool definition
class HelloTool < ModelContextProtocol::Server::Tool
  with_metadata do
    {
      name: "hello_tool",
      description: "A simple tool that returns HELLO",
      inputSchema: {
        type: "object",
        properties: {
          name: {
            type: "string",
            description: "Optional name to greet (defaults to World)"
          }
        }
      }
    }
  end

  def call
    name = params["name"] || "World"
    respond_with :text, text: "HELLO #{name}"
  end
end

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
