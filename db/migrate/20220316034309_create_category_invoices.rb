class CreateCategoryInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :category_invoices do |t|
      t.references :category, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
