class TestsController < ApplicationController
    def index
        @test = Test.all
        render json: @test
    end
    def show
        @test = Test.find(params[:id])
        render json: @test
    end
    def update
        @test = Test.find(params[:id])
        if @test.update(test_params)
            render json: @test
        else
            render json: { success: false, errors: @test.errors.full_messages }, status: :unprocessable_entity
        end
    end
    def create
        @test = Test.new(test_params)
        if @test.save
            render json: @test, status: :created
        else
            render json: { success: false, errors: @test.errors.full_messages }, status: :unprocessable_entity
        end

    end
    def destroy
        begin
            @test = Test.find(params[:id])
            @test.delete
            render json: {success: true}
        rescue ActiveRecord::RecordNotFound => e
            render json: { success: false, errors: e.message }, status: :unprocessable_entity
        end
    end
    def test_params
        params.permit(:title, :description)
    end
end
