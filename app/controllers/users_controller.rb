class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_users, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
    if @user.update(user_params)
      respond_with @user, location: -> { user_path(@user) }, notice: "User was updated successfully"
    else
      render "show"
    end
  end

  def destroy
    if @user.really_destroy!
      redirect_to root_path, notice: "User was successfully removed"
    else
      flash[:error] = "#{@user.full_name} was not successfully removed"
      redirect_back
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name, :email, :password, :password_confirmation,:phone_number)
    end
end
