class RegisterController < ApplicationController

skip_before_action :authorize


  def new
  end

  def create
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_url
    else 
      render :new, status: :unprocessable_entity, notice: "Unable to register"
    end
  end
end
