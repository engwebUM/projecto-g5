class Participant < ActiveRecord::Base
	belongs_to :plan
	CHECK_IN_NAME="Checkin done?"
  validates :name, presence: true
  validates :email, 
            format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/i },
            presence: true, 
            uniqueness: true
  validates :twitter, 
            format: { with: URI::regexp(%w(http https)) },
            :allow_blank => true
  validates :github, 
            format: { with: URI::regexp(%w(http https)) },
            :allow_blank => true
end
