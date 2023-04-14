class DescriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :set_description, only: %i[show update destroy]

  def index 
    descriptions = Description.all
    render json: descriptions
  end

  def create
    @description = Description.new(description_params)
    if @description.save
      render json: @description, status: :created
    else
      render json: @description.errors.full_messages, status: :unprocessable_entity
    end
  end


  def show
    render json: @description
  end

  def update
    if @description.update(description_params)
      render json: @description, notice: "Description was successfully updated."
    else
      render json: @description.errors.full_messages, status: :unprocessable_entity
    end
  end


  def destroy
    @description.destroy
    descriptions = Description.all
    render json: descriptions, notice: "Description was successfully destroyed.",
                              status: :see_other
  end


  private

  def set_description
    @description = Description.find(params[:id])
  end

  def description_params
    params.require(:description).permit(:title, :body, :result_id)
  end

end
