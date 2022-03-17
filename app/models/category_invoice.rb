class CategoryInvoice < ApplicationRecord
  belongs_to :category
  belongs_to :invoice
end
