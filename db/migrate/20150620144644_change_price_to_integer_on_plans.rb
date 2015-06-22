class ChangePriceToIntegerOnPlans < ActiveRecord::Migration
  def up
    change_column :plans, :price, :integer
  end

  def down
    change_column :plans, :price, :float
  end
end
