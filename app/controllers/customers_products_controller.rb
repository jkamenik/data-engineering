class CustomersProductsController < ApplicationController
  before_action :set_customers_product, only: [:show, :edit, :update, :destroy]

  # GET /customers_products
  def index
    @customers_products = CustomersProduct.all
  end

  # GET /customers_products/1
  def show
  end

  # GET /customers_products/new
  def new
    @customers_product = CustomersProduct.new
  end

  # GET /customers_products/1/edit
  def edit
  end

  # POST /customers_products
  def create
    @customers_product = CustomersProduct.new(customers_product_params)

    if @customers_product.save
      redirect_to @customers_product, notice: 'Customers product was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /customers_products/1
  def update
    if @customers_product.update(customers_product_params)
      redirect_to @customers_product, notice: 'Customers product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /customers_products/1
  def destroy
    @customers_product.destroy
    redirect_to customers_products_url, notice: 'Customers product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customers_product
      @customers_product = CustomersProduct.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def customers_product_params
      params.require(:customers_product).permit(:customer_id, :product_id, :quantity, :purchase_price)
    end
end
