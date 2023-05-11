class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :authenticatable, :validatable, :authentication_keys => [:phone_number]
  validate :validate_phone_number
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

  private

  def validate_phone_number
    errors.add(:phone_number, 'is invalid') unless Phonelib.parse(phone_number).valid?
  end
end
