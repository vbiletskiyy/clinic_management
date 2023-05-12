module UserHelper
  def patient?(user = current_user)
    user.is_a?(Patient)
  end

  def doctor?(user = current_user)
    user.is_a?(Doctor)
  end
end
