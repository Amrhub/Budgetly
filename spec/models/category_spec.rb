require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Category' do
  before :each do
    User.create(id: 1, name: 'Test', email: 'test@test.com',
                password: 'test1234', role: 'user')
  end

  it 'should not create a category without a name' do
    category = Category.new(name: nil, user_id: 1, icon: fixture_file_upload(file_fixture('icon.png')))
    expect(category).to_not be_valid
  end

  it 'should not create a category with repeated name' do
    Category.create(name: 'Test', user_id: 1, icon: fixture_file_upload(file_fixture('icon.png')))
    category = Category.new(name: 'Test', user_id: 1, icon: fixture_file_upload(file_fixture('icon.png')))
    expect(category).to_not be_valid
  end

  it 'should not create a category without an icon' do
    category = Category.new(name: 'Test', user_id: 1, icon: nil)
    expect(category).to_not be_valid
  end

  it 'should create a category with a name and an icon' do
    category = Category.new(name: 'Test', user_id: 1, icon: fixture_file_upload(file_fixture('icon.png')))
    expect(category).to be_valid
  end
end