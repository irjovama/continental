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
    def magic_link
        @user = User.where("email=?", params[:email]).first
        if(@user.nil?)
            render json: {"status": "fail", "errors": "Usuario no encontrado"} , status: :unprocessable_entity 
            return
        end
        @test = @user.user_tests.where("test_id =? and status=?", params[:test_id], 0).first
        if(@test.nil?)
            render json: {"status": "fail", "errors": "El usuario no tiene asignada esta encuesta o ya la respondió"} , status: :unprocessable_entity 
            return
        end
        require 'mail'
        Mail.defaults do
            delivery_method :smtp, {
                address: ENV['EMAIL_ADDRESS'],
                port: ENV['EMAIL_PORT'],
                user_name: ENV['EMAIL_USER'],
                password: ENV['EMAIL_PASSWORD'],
                authentication: ENV['EMAIL_AUTHENTICATION'].to_sym, 
                encryption: ENV['EMAIL_ENCRYPTION'].to_sym
            }
        end
        token =  @test.token
        mail = Mail.new do |m|
            m.from    ENV['EMAIL_USER']
            m.to      params[:email]
            m.subject "Invitación Encuesta #{@test.test.title}"
            m.html_part = "<h1>#{@test.test.title}</h1> 
                            <b>Por favor da click en el siguiente link para contestar la encuesta</b> 
                            #{ENV['START_PAGE']}?token=#{token}"
        end
        begin
            mail.deliver
            render json: {status: "success"}
        rescue Net::SMTPAuthenticationError => e
            render json: {status: "fail", errors: e.message}, status: :unprocessable_entity
        end
    end
    def user_params
        params.permit(:name, :middlename, :lastname, :email, :leader_id)
    end
end