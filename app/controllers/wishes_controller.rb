class WishesController < ApplicationController

  before_action :signed_in_user, only: [:edit, :update, :create, :thumbnail]

  def index

    @wishes = Wish.where( user_id: current_user.id, 
                             delete_status: 0 )
  end

  def edit_all
      @wishes = Wish.where( user_id: current_user.id, 
                             delete_status: 0 )
  end

  def update
    @wishes = wishes_edit_params.map do |id, wish_param|
      wish = Wish.find(id)
      wish.update_attributes(wish_param)
      wish
    end
    redirect_to wishes_edit_all_path
  end


  def new
    @item = UserItem.new
    @item.wishes.build
    @item.wishes.first.price = nil
  end

  def create
     @item = UserItem.new(wish_params)

     @item.user_id = @current_user.id

     @item.wishes.first.user_id = @item.user_id
     if @item.wishes.first.price.nil?
       @item.wishes.first.price = 0
     end
     
     #thumbnail
     if not params[:user_item][:thumbnail].nil?
       ori_image = params[:user_item][:thumbnail].read

       @item.thumbnail = resize_image( ori_image, 400, 266 )
       @item.thumbnail_content_type = params[:user_item][:thumbnail].content_type
       @item.use_thumbnail = true
     end

     if @item.save

       redirect_to wishes_edit_all_path

     else
       render 'new'
     end

  end

  def thumbnail
    @item = UserItem.find(params[:id])
    if not @item.thumbnail.nil?
      send_data(@item.thumbnail, type: @item.thumbnail_content_type, disposition: :inline)
    end
  end


  private

    def wish_params
      params.require(:user_item).permit(:user_id, :name, :category_id, :item_detail,
                                        :thumbnail_content_type,
                                        :standard_best_before_date,
                                        wishes_attributes:[
                                          :user_id, :item_id, :memo, :price]
                                       )
    end

    def resize_image(image, x, y)
      image_magick = Magick::Image.from_blob(image).shift
      #image_magick = image_magick.auto_orient
      #image_magick = image_magick.resize_to_fit(x, y)
      image_magick = image_magick.resize_to_fill(x, y)

      return image_magick.to_blob
    end

    def wishes_edit_params
      params.permit(wishes: [:memo, :delete_status])[:wishes]
    end

end
