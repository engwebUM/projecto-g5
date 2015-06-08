class Participant < ActiveRecord::Base
	CHECK_IN_NAME="Checkin done?"
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
