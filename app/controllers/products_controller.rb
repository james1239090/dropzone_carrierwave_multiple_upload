class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @photo = @product.build_photo
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end


  private
  def product_params
    if params.dig(:product,:photo_attributes,:images)
      params[:product][:photo_attributes][:images] = params[:product][:photo_attributes][:images].values
    end
    params.require(:product).permit(:name,photo_attributes:[:id,{ images:[] }])
  end
end
