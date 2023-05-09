class DoctorAbility
  include CanCan::Ability
  
  def initialize(user)
    return unless user.is_a?(Doctor) && user.present?

    can :read, Doctor
  end
end
