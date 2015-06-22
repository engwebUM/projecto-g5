class AddStartDateToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :start_time, :date
  end
end
