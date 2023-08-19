class StoresController < ApplicationController

def index
	@stores = Store.all
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

  private

  def store_params
    params.require(:store).permit(:name, :location)
  end
end
