class User < ActiveRecord::Base
  enum role: [:guest, :admin]
  after_initialize :set_default_role, if: [:new_record?]

  def set_default_role
    self.role ||= :guest
  end

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
end
