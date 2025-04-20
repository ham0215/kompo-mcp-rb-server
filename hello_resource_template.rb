require "model_context_protocol"

class HelloResourceTemplate < ModelContextProtocol::Server::ResourceTemplate
  with_metadata do
    {
      name: "hello_resource_template",
      description: "A resource template that returns a greeting with the name from URI",
      mime_type: "text/plain",
      uri_template: "resource://hello/{name}"
    }
  end

  def call
    name = extracted_uri["name"]
    result = "Hello, #{name}! Welcome to the resource template."
    respond_with :text, text: result
  end
end
