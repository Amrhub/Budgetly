json.extract! category_invoice, :id, :category_id, :invoice_id, :created_at, :updated_at
json.url category_invoice_url(category_invoice, format: :json)
