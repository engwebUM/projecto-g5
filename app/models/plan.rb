class Plan < ActiveRecord::Base
	after_initialize :set_default_discount, if: [:new_record?]

  def set_default_discount
    self.discount ||= 0
  end
	has_many :participants
	validates :name, presence: true
	validates :price, presence: true
	validates_numericality_of :price, :greater_than => 0
	validates :start_time, date: true
end
