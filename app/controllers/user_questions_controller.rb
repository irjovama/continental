class UserQuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :set_user_question, only: %i[show update destroy]

  def index 
    user_questions = UserQuestion.all
    render json: user_questions
  end

  def create
    @user_question = Result.new(user_question_params)
    if @user_question.save
      render json: @user_question, status: :created
    else
      render json: @user_question.errors.full_messages, status: :unprocessable_entity
    end
  end


  def show
    render json: @user_question
  end

  def update
    if @user_question.update(user_question_params)
      render json: @user_question, notice: "Employee was successfully updated."
    else
      render json: @user_question.errors.full_messages, status: :unprocessable_entity
    end
  end


  def destroy
    @user_question.destroy
    user_questions = UserQuestion.all
    render json: user_questions, notice: "Category was successfully destroyed.",
                              status: :see_other
  end


  private

  def set_user_question
    @user_question = UserQuestion.find(params[:id])
  end

  def user_question_params
    params.require(:user_question).permit(:user_id, :question_id, :evaluation)
  end

end
