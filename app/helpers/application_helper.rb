module ApplicationHelper
  include Pagy::Frontend

  def success?(result)
    result && !result.errors.present?
  end

  def avatar_image_tag(avatar, size: "305x450", default: "default_doctor_avatar")
    if avatar.attached?
      image_tag(avatar, size: size, class: "rounded")
    else
      image_tag(default, size: size)
    end
  end
end
