class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]


	def index
	  if params[:search].present?
	      @products = Product.paginate(page: params[:page], per_page: 20).where("name LIKE ?", "%#{params[:search]}%")
	    else
	      # @products = Product.all
	      @products = Product.paginate(page: params[:page], per_page: 20)
	    end
	end

	def show
		@product = Product.find(params[:id])
	end
	def new
	   @product = Product.new
	   @stores = Store.all
	end

  # def create
  #   @product = Product.new(product_params)
  #   if @product.save
  #     redirect_to products_path
  #   else
  #     @stores = Store.all
  #     render :new
  #   end
  # end

  # def create
  #   @product = Product.new(product_params)
  #   if @product.save
  #     store_ids_with_prices = params[:product][:store_ids].reject { |_, v| v.empty? }
  #     store_ids_with_prices.each do |store_id, price|
  #       ProductStore.create(product: @product, store_id: store_id, price: price)
  #     end
  #     redirect_to products_path
  #   else
  #     @stores = Store.all
  #     render :new
  #   end
  # end


  #  def create
  #   @product = Product.new(product_params)
  #   if @product.save
  #     store_ids_with_prices = params[:product][:store_ids].reject { |_, v| v[:price].empty? }
  #     store_ids_with_prices.each do |store_id, store_data|
  #       ProductStore.create(product: @product, store_id: store_id, price: store_data[:price])
  #     end
  #     redirect_to products_path
  #   else
  #     @stores = Store.all
  #     render :new
  #   end
  # end


 # def create
 # 	Rails.logger.info("Params: #{params.inspect}")
 #  	Rails.logger.info("Product Params: #{product_params.inspect}")
 #    @product = Product.new(product_params)
 #    if @product.save
 #      store_ids_with_prices = params[:product][:product_stores_attributes].select { |_, v| v[:price].present? }
 #      store_ids_with_prices.each do |store_id, store_data|
 #      	puts "Store ID: #{store_id}, Price: #{store_data[:price]}"
 #        Price.create(product: @product, store_id: store_id, price: store_data[:price])
 #      end
 #      redirect_to products_path
 #    else
 #      @stores = Store.all
 #      render :new
 #    end
 #  end

	 def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      @stores = Store.all
      render :new
    end
  end


  def edit
    @product = Product.find(params[:id])
    @stores = Store.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end






 def destroy
  @product = Product.find(params[:id])

  # Delete associated records first
  @product.product_stores.destroy_all

  # Then delete the product
  @product.destroy

  redirect_to products_path, notice: 'Product was successfully deleted.'
end


  private

  def set_product
    @product = Product.find(params[:id])
  end


  private

  def product_params
    params.require(:product).permit(:name, :description, :image, store_ids: [])
    # params.require(:product).permit(:name, :description, store_ids: [:price])
    # params.require(:product).permit(:name, :description, store_ids: {})
    # params.require(:product).permit(:name, :description, product_stores_attributes: [:store_id, :price])
    # params.require(:product).permit(:name, :description, :store_id, prices_attributes: [:store_id, :amount])
  end
end
