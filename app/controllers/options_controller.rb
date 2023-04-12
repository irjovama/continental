class OptionsController < ApplicationController
    skip_before_action :verify_authenticity_token, raise: false
    before_action :set_option, only: %i[show update destroy]
  
    def index 
      options = Option.all
      render json: options
    end
  
    def create
      @option = Option.new(option_params)
      if @option.save
        render json: @option, status: :created
      else
        render json: @option.errors.full_messages, status: :unprocessable_entity
      end
    end
  
  
    def show
      render json: @option
    end
  
    def update
      if @option.update(option_params)
        render json: @option, notice: "Option was successfully updated."
      else
        render json: @option.errors.full_messages, status: :unprocessable_entity
      end
    end
  
  
    def destroy
      @option.destroy
      options = Option.all
      render json: options, notice: "Option was successfully destroyed.",
                                status: :see_other
    end
  
  
    private
  
    def set_option
      @option = Option.find(params[:id])
    end
  
    def option_params
      params.require(:option).permit(:lower_option, :upper_option)
    end
  
end
