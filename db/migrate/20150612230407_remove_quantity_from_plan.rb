class RemoveQuantityFromPlan < ActiveRecord::Migration
  def change
    remove_column :plans, :quantity, :integer
  end
end
