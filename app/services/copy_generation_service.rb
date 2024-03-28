class CopyGenerationService
  def generate_content(copy)
    prompt = build_prompt(copy)
    client = OpenAI::Client.new

    begin
      response = client.completions(
        parameters: {
          prompt: prompt,
          max_tokens: 100,
          model: 'gpt-3.5-turbo-instruct',
          temperature: 0.5
        }
      )
      Rails.logger.info "OpenAI response: #{response.inspect}"
      response['choices'][0]['text']
    rescue OpenAI::Error => e
      Rails.logger.error "OpenAI error: #{e.message}"
      "Error generating content. Please try again later."
    rescue StandardError => e
      Rails.logger.error "Unexpected error: #{e.message}"
      "An unexpected error occurred. Please try again later."
    end
  end

  private

  def build_prompt(copy)
    <<-PROMPT
      You are a copywriter for a marketing agency. Write a website copy paragraph for a business named #{copy.business_name} in the #{copy.industry} industry. They target #{copy.target_market}.
      - Location of Use: #{copy.copy_location}
      - Purpose: #{copy.copy_purpose}
      - Desired Tone: #{copy.copy_tone}
      Ensure the copy is clear, concise, and reflects the provided details.
    PROMPT
  end
end