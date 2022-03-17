require "test_helper"

class CategoryInvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_invoice = category_invoices(:one)
  end

  test "should get index" do
    get category_invoices_url
    assert_response :success
  end

  test "should get new" do
    get new_category_invoice_url
    assert_response :success
  end

  test "should create category_invoice" do
    assert_difference("CategoryInvoice.count") do
      post category_invoices_url, params: { category_invoice: { category_id: @category_invoice.category_id, invoice_id: @category_invoice.invoice_id } }
    end

    assert_redirected_to category_invoice_url(CategoryInvoice.last)
  end

  test "should show category_invoice" do
    get category_invoice_url(@category_invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_invoice_url(@category_invoice)
    assert_response :success
  end

  test "should update category_invoice" do
    patch category_invoice_url(@category_invoice), params: { category_invoice: { category_id: @category_invoice.category_id, invoice_id: @category_invoice.invoice_id } }
    assert_redirected_to category_invoice_url(@category_invoice)
  end

  test "should destroy category_invoice" do
    assert_difference("CategoryInvoice.count", -1) do
      delete category_invoice_url(@category_invoice)
    end

    assert_redirected_to category_invoices_url
  end
end
