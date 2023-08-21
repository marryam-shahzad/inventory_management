class StoresController < ApplicationController
   before_action :set_store, only: [:show, :edit, :update, :destroy]

def index
	# @stores = Store.all
  @stores = Store.paginate(page: params[:page], per_page: 20)
end
  def new
    @store = Store.new
  end

  def show
  	@store = Store.find(params[:id])
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to stores_path
    else
      render :new
    end
  end

   def update
    if @store.update(store_params)
      redirect_to stores_path, notice: 'Store was successfully updated.'
    else
      render :edit
    end
  end

def destroy
  @store = Store.find(params[:id])

  # Delete associated product_stores first
  @store.product_stores.destroy_all

  @store.destroy
  redirect_to stores_path, notice: 'Store was successfully deleted.'
end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :location)
  end
end
