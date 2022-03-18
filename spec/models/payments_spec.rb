require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Category' do
    it 'should automatically update when a payment is created' do
      user = User.create(id: 1, name: 'Test', email: 'test@test.com', password: 'test1234', role: 'user')
      category = Category.create(name: 'Test', user_id: 1, icon: fixture_file_upload(file_fixture('icon.png')))
      invoice = Invoice.new(name: 'test invoice',user_id: 1, amount: 100)
      
      invoice.categories << category
      invoice.save
      payments = Payment.all.count
      
      expect(payments).to eq(1)
    end
end