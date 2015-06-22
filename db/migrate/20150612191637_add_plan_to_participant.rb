class AddPlanToParticipant < ActiveRecord::Migration
  def change
    add_reference :participants, :plan, index: true
    add_foreign_key :participants, :plans
  end
end
