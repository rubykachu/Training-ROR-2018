# frozen_string_literal: true

class Admin::UsersController < AdminController
  def index
    @users = User.all.order(:email)
  end

  def new
    @user = User.new
  end

  def edit
    user
  end

  def show
    user
  end

  def create
    @user = User.create(permit_params)
    redirect_after_update_or_create(@user)
  end

  def update
    user.update(permit_params)
    redirect_after_update_or_create(user)
  end

  def destroy
    if user.destroy!
      flash[:notice] = "#{user.email} deleted successfully"
    else
      flash[:alert] = "#{user.email} deleted failed"
    end
    redirect_to users_path
  end

  private

    def permit_params
      params.require(:user).permit(:email, :password, :password_confirmation, :is_admin)
    end

    def user
      return @user if @user
      @user = User.find(params[:id])
    end
end
