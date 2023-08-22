class CopiesController < ApplicationController
    before_action :authenticate_user!

    # Display the form to create a new Copy
    def new
      @copy = Copy.new
    end
  
    # Capture user input, call the OpenAI API, store the generated content, and save the copy to the database
    def create
      @copy = current_user.copies.new(copy_params)
      
      prompt = "Create a copy for a business named #{@copy.business_name}, in the #{@copy.industry} industry targeting #{@copy.target_market}."
      client = OpenAI::Client.new(access_token: "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")
      response = client.completions.create(
        prompt: prompt,
        max_tokens: 150,
        model: "davinci"
        )
      @copy.content = response.choices.first.text.strip
  
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
  
    private
  
    def copy_params
      params.require(:copy).permit(:business_name, :industry, :target_market)
    end
end
