class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :email
      t.boolean :checkin

      t.timestamps null: false
    end
  end
end
