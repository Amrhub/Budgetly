module ApplicationHelper
  def resize_avatar
    current_user.avatar.variant(resize_to_limit: [50,50]).processed
  end

  def brand_name
    "Budgetly"
  end

  def requires_navigation?
    return false if request.path == "/categories"
    return false if request.path == "/"
    return false if request.path.include?('users')
    true
  end

  def get_navigation_path
    return :back if request.path == "/invoices/new"
    categories_path
  end
end