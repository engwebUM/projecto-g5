class AddDetailsToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :kit, :boolean
    add_column :participants, :twitter, :string
    add_column :participants, :github, :string
    add_column :participants, :company, :string
    add_column :participants, :paid, :boolean
    add_column :participants, :credentials, :boolean
  end
end
