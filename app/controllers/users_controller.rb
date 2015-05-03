class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, except: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin? unless @user == current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_admin_index_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_admin_index_path, notice: 'User updated.'
    else
      redirect_to users_admin_index_path, alert: 'Unable to update user.'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_admin_index_path, notice: 'User deleted.'
  end

  private

  def admin_only
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin?
  end

  def secure_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
