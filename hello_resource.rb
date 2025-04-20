require "model_context_protocol"

class HelloResource < ModelContextProtocol::Server::Resource
  with_metadata do
    {
      name: "HelloResource",
      description: "A simple resource that returns HELLO",
      mime_type: "text/plain",
      uri: "resource://hello-resource"
    }
  end

  def call
    respond_with :text, text: "HELLO"
  end
end
