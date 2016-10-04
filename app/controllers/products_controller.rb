class ProductsController < ApplicationController

  def index
    @all_products_by_vendor = Product.where(vendor_id: params[:vendor_id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def Update
    @product = Product.find(params[:id])

  if @product.update(task_params)
    # saved successfully
    redirect_to product_path
  else
    # did not save
    render :edit
  end
  end

  private

  def task_params
    params.require(:product).permit(:name)
  end

end
