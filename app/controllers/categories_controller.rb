class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index 
    categories = Category.all
    render json: categories
  end

  def show
    render json: @category
  end

  def destroy
    @category.destroy
    redirect_to Category.all, notice: "Category was successfully destroyed.",
                              status: :see_other
  end

  private

  def set_category
    @category = Category.find_by(id: params[:id])
  end

end
