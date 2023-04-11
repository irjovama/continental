class CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :set_category, only: %i[show update destroy]

  def index 
    categories = Category.all
    render json: categories
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors.full_messages, status: :unprocessable_entity
    end
  end


  def show
    render json: @category
  end

  def update
    if @category.update(category_params)
      render json: @category, notice: "Employee was successfully updated."
    else
      render json: @category.errors.full_messages, status: :unprocessable_entity
    end
  end


  def destroy
    @category.destroy
    categories = Category.all
    render json: categories, notice: "Category was successfully destroyed.",
                              status: :see_other
  end


  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id, :weight)
  end
end
