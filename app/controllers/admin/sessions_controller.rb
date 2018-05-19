# frozen_string_literal: true

class Admin::SessionsController < AdminController
  layout "admin_session"
  attr_reader :password, :email

  def new
    @user = User.new
  end

  def create
    if user && user.authenticate(password) && admin?
      login
    else
      login_failed
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  private

    def permit_params
      @email = params[:user][:email].downcase!
      @password = params[:user][:password]
      params.require(:user).permit(:email, :password)
    end

    def user
      return @user if @user
      @user = User.find_by email: permit_params[:email]
    end

    def login
      if user.update(last_login: Time.current, access_token: crypto_token)
        redirect_to admin_path
        create_session
      else
        redirect_to login_path, alert: "Login failed"
      end
    end

    def login_failed
      @user = User.new(permit_params)
      flash.now[:alert] = "Invalid email/password combination"
      render :new
    end

    def admin?
      user.is_admin
    end

    def create_session
      session[:current_user] = {
        'email': user.email,
        'last_login': user.last_login,
        'access_token': user.access_token
      }
    end
end
