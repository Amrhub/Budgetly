require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Invoice' do
  before :each do
    User.create(id: 1, name: 'Test', email: 'test@test.com',
                password: 'test1234', role: 'user')
  end

  it 'should not create a new invoice when missing invoice name' do
    invoice = Invoice.new(amount: 100, user_id: 1)
    expect(invoice).to_not be_valid
  end

  it 'should not create a new invoice when missing invoice amount' do
    invoice = Invoice.new(name: 'Test', user_id: 1)
    expect(invoice).to_not be_valid
  end

  it 'should create invoice successfully when all required fields are filled' do
    invoice = Invoice.new(name: 'Test', amount: 100, user_id: 1)
    expect(invoice).to be_valid
  end
end
