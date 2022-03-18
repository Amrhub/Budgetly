module CategoriesHelper
  def category_payments(category)
    total_amount = category.invoices.sum(:amount)
    return 0 if total_amount.zero?

    "$#{total_amount}"
  end
end
