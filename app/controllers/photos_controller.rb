class PhotosController < ApplicationController
  before_action :find_product, only:[:create,:destroy]
  def create
    add_more_images(photo_params[:images])
    flash[:error] = "Failed uploading images" unless @product.save
    redirect_to :back
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @product.save
    redirect_to :back
  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def photo_params
    if params.dig(:photo,:images)
      params[:photo][:images] = params[:photo][:images].values
    end
    params.require(:photo).permit({ images:[] })
  end

  def remove_image_at_index(index)
    remain_images = @product.photo.images # copy the array
    deleted_image = remain_images.delete_at(index) # delete the target image
    deleted_image.try(:remove!) # delete image from S3
    @product.photo.images = remain_images # re-assign back

    if remain_images.length == 0
      @product.photo.remove_images = true
    end
  end

  def add_more_images(new_images)
    images = @product.photo.images
    images += new_images
    @product.photo.images = images
  end

end
