class Admin::PlansController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @plans = Plan.paginate(page: params[:page], per_page: 10)
  end

  def show
    @plan = Plan.find(params[:id])
    redirect_to root_path, alert: 'Access denied.' unless current_admin_user.admin? unless @user == current_admin_user
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)

    if @plan.save
      redirect_to admin_plans_path, notice: 'Plan was successfully created.'
    else
      render :new
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update_attributes(plan_params)
      redirect_to admin_plans_path, notice: 'Plan was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to admin_plans_path, notice: 'Plan was successfully destroyed.'
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :description, :price, :discount, :start_time)
  end
end
