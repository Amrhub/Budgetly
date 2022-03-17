class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :invoices
  has_one_attached :icon

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :icon, presence: true
end
