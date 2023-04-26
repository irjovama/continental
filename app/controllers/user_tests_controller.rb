require_relative "../models/user"
require_relative "../models/option"
class UserTestsController < ApplicationController
    def index
        user_tests = UserTest.all;
        render json: user_tests;
    end 

    def update
        user_test = UserTest.where("token=?", params[:id]).first;
        if user_test.update(ut_params)
            render json: user_test
        else
            render json: { success: false, errors: user_test.errors.full_messages }, status: :unprocessable_entity
        end
    end
    def questions
        user_test = UserTest.where("token=? and status=0", params[:id]).first;
        questions = user_test.test.questions.map do |q|
            optns = q.question_type == "text_input" ? nil :  {upper: q.option.upper_option, lower: q.option.lower_option}
            {id: q.id, title: q.title, index: q.index, type: q.question_type, options: optns}
        end
        render json: questions
    end
    def show
        user_test = UserTest.where("token=? and status=0", params[:id]).first;
        tests = user_test.user.user_tests.map do |test|
            user = User.find(test.evaluated_id)
            {user_id: test.user_id, leader: user, test_id: test.test_id}
        end.filter {|ts| ts[:test_id] ==user_test.test_id }
        render json: tests, status: :ok
    end
    private

    def ut_params
        params.permit(:status)
    end

end
