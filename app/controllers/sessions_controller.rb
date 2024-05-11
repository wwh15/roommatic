class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path
    else
      redirect_to login_url, alert: "User or password does not match our records"
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out"
  end
end
