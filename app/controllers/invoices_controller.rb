class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /invoices or /invoices.json
  def index
    @category = current_user.categories.find_by(name: params[:category_name])
    @invoices = @category.invoices.order(created_at: :desc)
  end

  # GET /invoices/1 or /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @payment = Payment.new
    @categories = current_user.categories
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices or /invoices.json
  def create
    @invoice = Invoice.new(name: invoice_params[:name], amount: invoice_params[:amount], user: current_user)

    respond_to do |format|
      if @invoice.save
        @category = Category.find(invoice_params[:category_id])
        @invoice.categories << @category
        format.html { redirect_to category_invoices_url(@category.name), notice: "Invoice was successfully created." }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1 or /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(name: invoice_params[:name], amount: invoice_params[:amount], user: current_user)
        format.html { redirect_to invoice_url(@invoice), notice: "Invoice was successfully updated." }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1 or /invoices/1.json
  def destroy
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url, notice: "Invoice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invoice_params
      params.require(:invoice).permit(:name, :amount, :category_id)
    end

end
