class PatientAbility
  include CanCan::Ability
  
  def initialize(user)
    return unless user.is_a?(Patient) && user.present?

    can :read, Patient
  end
end
