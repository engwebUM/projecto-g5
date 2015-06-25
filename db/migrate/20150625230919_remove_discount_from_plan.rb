class RemoveDiscountFromPlan < ActiveRecord::Migration
  def change
    remove_column :plans, :discount, :integer
  end
end
