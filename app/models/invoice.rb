class Invoice < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy
  has_many :categories, through: :payments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
