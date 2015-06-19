class Plan < ActiveRecord::Base
	attr_accessor :active
	after_initialize :set_default_discount, if: [:new_record?]

	def active
    @active || false
  end

  def set_default_discount
    self.discount ||= 0
  end

	has_many :participants

	scope :by_start_time, -> { order(start_time: :asc) }

	accepts_nested_attributes_for :participants
	validates :name, presence: true
	validates :price, presence: true
	validates_numericality_of :price, :greater_than => 0
	validates :start_time, date: true
end
