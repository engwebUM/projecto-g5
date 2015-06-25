class Plan < ActiveRecord::Base
  attr_accessor :active, :finished

  def active
    @active || false
  end

  def finished
    @finished || false
  end

  has_many :participants, dependent: :destroy

  scope :by_start_time, -> { order(start_time: :asc) }

  accepts_nested_attributes_for :participants
  validates :name, presence: true
  validates :price, presence: true
  validates_numericality_of :price, greater_than: 0
  validates :start_time, date: true

  def self.search(search)
    if search
      where('name like ?', "%#{search}%").order('name')
    else
      all.order('name')
    end
  end
end
