class UsersController < ApplicationController
  before_action :set_user, only: [:create, :show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @users = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
      attar = [:email, :first_name, :last_name, :phone_number]
      attar.push role_ids: [] if current_user.has_role?(:admin)
      params.require(:user).permit(attar)
    end
end
