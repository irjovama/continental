class LeadershipController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
    before_action :set_leadership, only: %i[show update destroy]
  
    def index 
      leaderships = Leadership.all
      render json: leaderships
    end
  
    def create
      @leadership = Leadership.new(leadership_params)
      if @leadership.save
        render json: @leadership, status: :created
      else
        render json: @leadership.errors.full_messages, status: :unprocessable_entity
      end
    end
  
  
    def show
      render json: @leadership
    end
  
    def update
      if @leadership.update(leadership_params)
        render json: @leadership, notice: "Option was successfully updated."
      else
        render json: @leadership.errors.full_messages, status: :unprocessable_entity
      end
    end
  
  
    def destroy
      @leadership.destroy
      leaderships = Leadership.all
      render json: leaderships, notice: "Leadership was successfully destroyed.",
                                status: :see_other
    end
  
  
    private
  
    def set_leadership
      @leadership = Leadership.find(params[:id])
    end
  
    def leadership_params
      params.require(:leadership).permit(:employee_id, :leader_id, :leadership_type)
    end
  
end
