class CopiesController < ApplicationController
  before_action :authenticate_user!

  def new
    @copy = Copy.new
  end

  def create
    @copy = current_user.copies.new(copy_params)
    @copy.content = CopyGenerationService.new.generate_content(@copy)

    if @copy.save
      redirect_to copies_path, notice: 'Copy created successfully!'
    else
      render :new
    end
  end

  def index
    @copies = current_user.copies
  end

  def destroy
    @copy = Copy.find(params[:id])
    @copy.destroy
    redirect_to copies_path, notice: 'Copy deleted successfully!'
  end

  private

  def copy_params
    params.require(:copy).permit(:business_name, :industry, :target_market, :copy_location, :copy_purpose, :copy_tone)
  end
end