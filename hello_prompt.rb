require "model_context_protocol"

class HelloPrompt < ModelContextProtocol::Server::Prompt
  with_metadata do
    {
      name: "hello_prompt",
      description: "A prompt that generates a greeting message"
    }
  end

  with_argument do
    {
      name: "name",
      description: "The name of the person to greet",
      required: true
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
