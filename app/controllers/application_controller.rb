class ApplicationController < ActionController::Base
    before_action :current_user
    before_action :authorize
    helper_method :current_user

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    protected

    def authorize
      unless current_user
        redirect_to login_url, notice: "Please log in"
      end
    end
end
