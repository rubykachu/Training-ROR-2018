# frozen_string_literal: true

class Admin::UsersController < AdminController
  def index
    User.all
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
    user.destroy!
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
