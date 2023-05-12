class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :authenticatable, :validatable, :authentication_keys => [:phone_number]
  validates :phone_number, uniqueness: true
  validates :name, presence: true
  
  def email_changed?
    false
  end

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
