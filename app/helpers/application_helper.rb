module ApplicationHelper
  include Pagy::Frontend

  def success?(result)
    result && !result.errors.present?
  end
end
