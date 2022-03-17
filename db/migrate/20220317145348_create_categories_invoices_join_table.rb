class CreateCategoriesInvoicesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :invoices do |t|
      t.index :category_id
      t.index :invoice_id
    end
  end
end
