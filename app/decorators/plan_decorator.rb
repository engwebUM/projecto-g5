class PlanDecorator < Draper::Decorator
  delegate_all

  def custom_format_date
    start_time.strftime("%d/%m/%Y")
  end
end
