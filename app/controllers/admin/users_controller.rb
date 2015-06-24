class Admin::UsersController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :admin_only, except: [:show]

  def index
    @users = User.search(params[:search]).paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_path, alert: 'Access denied.' unless current_admin_user.admin? unless @user == current_admin_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to admin_users_path, notice: 'User updated.'
    else
      redirect_to admin_users_path, alert: 'Unable to update user.'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path, notice: 'User deleted.'
  end

  private

  def admin_only
    redirect_to root_path, alert: 'Access denied.' unless current_admin_user.admin?
  end

  def secure_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
