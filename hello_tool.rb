require "model_context_protocol"

class HelloTool < ModelContextProtocol::Server::Tool
  with_metadata do
    {
      name: "HelloTool",
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
