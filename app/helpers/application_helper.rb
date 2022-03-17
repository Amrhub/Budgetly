module ApplicationHelper
  def resize_avatar
    current_user.avatar.variant(resize_to_limit: [50,50]).processed
  end

  def brand_name
    "Budgetly"
  end
end