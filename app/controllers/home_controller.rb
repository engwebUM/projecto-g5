class HomeController < ApplicationController
  def index
    @participant = Participant.new
    @plans = check_active_plans
  end

  def check_active_plans
  	check_condition = true
    Plan.by_start_time.all.each do |plan|
    	if (plan.start_time >= Date.today && check_condition)
    		plan.active = true
    		check_condition = false
    	end
    end
  end

  def tickets
  end
end
