require "application_system_test_case"

class CategoryInvoicesTest < ApplicationSystemTestCase
  setup do
    @category_invoice = category_invoices(:one)
  end

  test "visiting the index" do
    visit category_invoices_url
    assert_selector "h1", text: "Category invoices"
  end

  test "should create category invoice" do
    visit category_invoices_url
    click_on "New category invoice"

    fill_in "Category", with: @category_invoice.category_id
    fill_in "Invoice", with: @category_invoice.invoice_id
    click_on "Create Category invoice"

    assert_text "Category invoice was successfully created"
    click_on "Back"
  end

  test "should update Category invoice" do
    visit category_invoice_url(@category_invoice)
    click_on "Edit this category invoice", match: :first

    fill_in "Category", with: @category_invoice.category_id
    fill_in "Invoice", with: @category_invoice.invoice_id
    click_on "Update Category invoice"

    assert_text "Category invoice was successfully updated"
    click_on "Back"
  end

  test "should destroy Category invoice" do
    visit category_invoice_url(@category_invoice)
    click_on "Destroy this category invoice", match: :first

    assert_text "Category invoice was successfully destroyed"
  end
end
