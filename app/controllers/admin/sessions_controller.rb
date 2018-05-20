# frozen_string_literal: true

class Admin::SessionsController < AdminController
  layout "admin_session"
  attr_reader :password, :email, :remember_me
  before_action :redirect_if_logged_in, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    return sign_in if user && user.authenticate(password) && user.is_admin?
    login_failed
  end

  def destroy
    log_out current_user
    redirect_to login_path
  end

  private

    def permit_params
      @email       = params[:user][:email].downcase!
      @password    = params[:user][:password]
      params.require(:user).permit(:email, :password, :remember_digest)
    end

    def user
      @user ||= User.find_by email: permit_params[:email]
    end

    def sign_in
      if login!(user)
        remember(user) if remember?
        redirect_to admin_path
      else
        redirect_to login_path, alert: "Login failed"
      end
    end

    def login_failed
      @user = User.new(permit_params)
      flash.now[:alert] = "Invalid email/password combination"
      render :new
    end

    def redirect_if_logged_in
      redirect_to admin_path if logged_in?
    end

    def remember?
      !params[:user][:remember].to_i.zero?
    end
end
