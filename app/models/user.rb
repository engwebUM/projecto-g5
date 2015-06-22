class User < ActiveRecord::Base
  enum role: [:guest, :admin]
  after_initialize :set_default_role, if: [:new_record?]

  def set_default_role
    self.role ||= :guest
  end

  devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end
