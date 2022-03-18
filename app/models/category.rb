class Category < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy
  has_many :invoices, through: :payments, dependent: :destroy
  has_one_attached :icon

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :icon, presence: true
end
