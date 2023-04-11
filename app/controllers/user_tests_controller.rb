class UserTestsController < ApplicationController
    def index
        @user_test = UserTest.where("user_id=?", params[:user_id])
        render json: @user_test
    end
    def show
        @user_test = UserTest.where("user_id=? and id=?", params[:user_id], params[:test_id]).first
        render json: @user_test
    end
end
