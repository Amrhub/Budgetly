class Invoice < ApplicationRecord
  belongs_to :user
  has_many :category_invoices, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }

end
