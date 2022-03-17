class Category < ApplicationRecord
  belongs_to :user
  has_many :category_invoices, dependent: :destroy
  has_one_attached :icon

  validates :name, presence: true
end
