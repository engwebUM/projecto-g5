class HomeController < ApplicationController
  def index
    @participant = Participant.new
    @plans = check_active_plans
  end

  def check_active_plans
    previous_plan = Plan.new
    Plan.by_start_time.all.each_with_index do |plan, index|
      next unless date_plan_less_today?(plan.start_time)
      if first_date_plan_greater?(index, plan, previous_plan)
        set_active_plan(plan, previous_plan)
      end
      plan.active = true
      previous_plan = plan
    end
  end

  def date_plan_less_today?(plan_date)
    plan_date <= Date.today
  end

  def first_date_plan_greater?(index, plan, previous_plan)
    index != 0 && plan.start_time > previous_plan.start_time
  end

  def set_active_plan(plan, previous_plan)
    plan.active = true
    previous_plan.active = false
    previous_plan.finished = true
  end
end
