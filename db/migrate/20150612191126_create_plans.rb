class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :quantity
      t.integer :discount

      t.timestamps null: false
    end
  end
end
