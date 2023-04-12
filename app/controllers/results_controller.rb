class ResultsController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :set_result, only: %i[show update destroy]

  def index 
    results = Result.all
    render json: results
  end

  def create
    @result = Result.new(result_params)
    if @result.save
      render json: @result, status: :created
    else
      render json: @result.errors.full_messages, status: :unprocessable_entity
    end
  end


  def show
    render json: @result
  end

  def update
    if @result.update(result_params)
      render json: @result, notice: "Employee was successfully updated."
    else
      render json: @result.errors.full_messages, status: :unprocessable_entity
    end
  end


  def destroy
    @result.destroy
    results = Result.all
    render json: results, notice: "Category was successfully destroyed.",
                              status: :see_other
  end


  private

  def set_result
    @result = Result.find(params[:id])
  end

  def result_params
    params.require(:result).permit(:min_range, :max_range, :category_id)
  end

end
