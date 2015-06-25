class Participant < ActiveRecord::Base
  belongs_to :plan
  after_initialize :set_default_values, if: [:new_record?]

  def set_default_values
    self.checkin ||= 0
    self.kit ||= 0
    self.paid ||= 0
    self.credentials ||= 0
  end

  CHECK_IN_NAME = 'Checkin done?'
  validates :name, presence: true
  validates :email,
    format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/i },
    presence: true,
    uniqueness: true
  validates :twitter,
    format: { with: URI.regexp(%w(http https)) },
    allow_blank: true
  validates :github,
    format: { with: URI.regexp(%w(http https)) },
    allow_blank: true
  validates :plan_id, presence: true

  def self.search(search)
    if search
      where('email like ?', "%#{search}%").order('name')
    else
      all.order('name')
    end
  end
end
