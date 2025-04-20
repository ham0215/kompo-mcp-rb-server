require "model-context-protocol-rb"

class HelloResource < ModelContextProtocol::Server::Resource
  with_metadata do
    {
      name: "Hello Resource",
      description: "A simple resource that returns HELLO",
      mime_type: "text/plain",
      uri: "resource://hello-resource"
    }
  end

  def call
    respond_with :text, text: "HELLO"
  end
end
