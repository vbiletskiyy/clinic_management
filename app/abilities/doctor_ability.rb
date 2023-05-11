class DoctorAbility
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user

    if user.is_a? Patient
      can :show, Doctor
      can :index, Doctor
    elsif user.is_a? Doctor
      can :show, Doctor, id: user.id
    end
  end
end
