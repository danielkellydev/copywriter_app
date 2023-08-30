class CopiesController < ApplicationController
    before_action :authenticate_user!

    # Display the form to create a new Copy
    def new
      @copy = Copy.new
    end
  
    # Capture user input, call the OpenAI API, store the generated content, and save the copy to the database
    def create
      @copy = current_user.copies.new(copy_params)
      @copy.content = fetch_openai_content
    
      if @copy.save
        redirect_to copies_path, notice: 'Copy created successfully!'
      else
        render :new
      end
    end
  
    # Display all copies for the logged-in user
    def index
      @copies = current_user.copies
    end
  
    def destroy
      @copy = Copy.find(params[:id])
      @copy.destroy
      redirect_to copies_path, notice: 'Copy deleted successfully!'
    end

    private

    def fetch_openai_content
      prompt = <<-PROMPT
        You are a copywriter for a marketing agency. Write a website copy paragraph for a business named #{@copy.business_name} in the #{@copy.industry} industry. They target #{@copy.target_market}. 
        - Location of Use: #{@copy.copy_location}
        - Purpose: #{@copy.copy_purpose}
        - Desired Tone: #{@copy.copy_tone}
        Ensure the copy is clear, concise, and reflects the provided details.
      PROMPT
    
      client = OpenAI::Client.new
    
      begin
        response = client.completions(
          parameters: {
            prompt: prompt,
            max_tokens: 100,
            model: 'text-davinci-001',
            temperature: 0.5
          }
        )
        
        return response['choices'][0]['text']
        
      rescue OpenAI::Error => e
        # Handle the specific error from the OpenAI library here.
        # You might log the error, show a message to the user, etc.
        Rails.logger.error "OpenAI Error: #{e.message}"
        return "Error generating content. Please try again later."
        
      rescue StandardError => e
        # Handle other possible errors.
        Rails.logger.error "Unknown Error: #{e.message}"
        return "An unexpected error occurred. Please try again later."
        
      end
    end

  
    def copy_params
      params.require(:copy).permit(:business_name, :industry, :target_market, :copy_location, :copy_purpose, :copy_tone)
    end

end
