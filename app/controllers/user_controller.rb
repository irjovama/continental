class UserController < ApplicationController
    def index
        @Users = User.all
        render json: @Users
    end
    def show
        @user = User.find(params[:id])
        render json: @user
    end
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: @user
        else
            render json: { success: false, errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else
            render json: { success: false, errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
        
    end
    def destroy
        begin
            @user = User.find(params[:id])
            @user.delete
            render json: {success: true}
        rescue ActiveRecord::RecordNotFound => e
            render json: { success: false, errors: e.message }, status: :unprocessable_entity
        end

    end
    def user_params
        params.permit(:name, :middlename, :lastname, :email, :leader_id)
    end
end