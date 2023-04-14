class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :set_question, only: %i[show update destroy]

  def index 
    if params[:test_id]
      questions = Question.where(["test_id = ?", params[:test_id]])
      render json: questions
    else 
      questions = Question.all
      render json: questions
    end
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      render json: @question, status: :created
    else
      render json: @question.errors.full_messages, status: :unprocessable_entity
    end
  end


  def show
    render json: @question
  end

  def update
    if @question.update(question_params)
      render json: @question, notice: "Question was successfully updated."
    else
      render json: @question.errors.full_messages, status: :unprocessable_entity
    end
  end


  def destroy
    @question.destroy
    questions = Question.all
    render json: questions, notice: "Question was successfully destroyed.",
                              status: :see_other
  end


  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :category_id, :weight, :test_id, :index, :option_id)
  end

end
