OpenAI.configure do |config|
    config.access_token = Rails.application.credentials.openai_api_key
  end