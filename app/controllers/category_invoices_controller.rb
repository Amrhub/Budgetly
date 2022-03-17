class CategoryInvoicesController < ApplicationController
  before_action :set_category_invoice, only: %i[ show edit update destroy ]

  # GET /category_invoices or /category_invoices.json
  def index
    @category_invoices = CategoryInvoice.all
  end

  # GET /category_invoices/1 or /category_invoices/1.json
  def show
  end

  # GET /category_invoices/new
  def new
    @category_invoice = CategoryInvoice.new
  end

  # GET /category_invoices/1/edit
  def edit
  end

  # POST /category_invoices or /category_invoices.json
  def create
    @category_invoice = CategoryInvoice.new(category_invoice_params)

    respond_to do |format|
      if @category_invoice.save
        format.html { redirect_to category_invoice_url(@category_invoice), notice: "Category invoice was successfully created." }
        format.json { render :show, status: :created, location: @category_invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_invoices/1 or /category_invoices/1.json
  def update
    respond_to do |format|
      if @category_invoice.update(category_invoice_params)
        format.html { redirect_to category_invoice_url(@category_invoice), notice: "Category invoice was successfully updated." }
        format.json { render :show, status: :ok, location: @category_invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_invoices/1 or /category_invoices/1.json
  def destroy
    @category_invoice.destroy

    respond_to do |format|
      format.html { redirect_to category_invoices_url, notice: "Category invoice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_invoice
      @category_invoice = CategoryInvoice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_invoice_params
      params.require(:category_invoice).permit(:category_id, :invoice_id)
    end
end
