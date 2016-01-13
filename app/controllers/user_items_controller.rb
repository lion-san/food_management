require 'RMagick'

class UserItemsController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :create, :thumbnail]


  def new

    @item = UserItem.new
    @item.stocks.build
    @item.stocks.first.price = nil

    if not get_purchase_date.nil? then
      @item.stocks.first.purchase_date = get_purchase_date
    end

  end

  def create
     @item = UserItem.new(user_item_params)

     @item.user_id = @current_user.id

     @item.stocks.first.user_id = @item.user_id

     if @item.stocks.first.price.nil?
       @item.stocks.first.price = 0
     end

     if @item.stocks.first.quantity.nil?
       @item.stocks.first.quantity = 1 
     end


     #For StockTest
     @item.stocks.first.item_location_id = 1

     #thumbnail
     if not params[:user_item][:thumbnail].nil?
       ori_image = params[:user_item][:thumbnail].read

       @item.thumbnail = resize_image( ori_image, 400, 266 )
       @item.thumbnail_content_type = params[:user_item][:thumbnail].content_type
       @item.use_thumbnail = true
     end

     #For multi quantity
     stock = @item.stocks.first

     if stock.quantity > 1
       for i in 2..stock.quantity  do
         s = Stock.new(
                      user_id:stock.user_id, item_id:stock.item_id,
                      item_status_id:stock.item_status_id,
                      item_location_id:stock.item_location_id,
                      price:stock.price, quantity:stock.quantity,
                      purchase_date:stock.purchase_date,
                      best_before_date:stock.best_before_date)
         @item.stocks << s

       end
     end


     if @item.save
       set_purchase_date( @item.stocks.first.purchase_date )

       redirect_to stocks_path

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

    def user_item_params
      params.require(:user_item).permit(:user_id, :name, :category_id, :item_detail,
                                        :thumbnail_content_type,
                                        :standard_best_before_date,
                                        stocks_attributes:[
                                          :user_id, :item_id, :item_status_id,
                                          :item_location_id,
                                          :price, :quantity,
                                          :purchase_date, :best_before_date]
                                       )
    end

    def resize_image(image, x, y)
      image_magick = Magick::Image.from_blob(image).shift
      #image_magick = image_magick.auto_orient
      #image_magick = image_magick.resize_to_fit(x, y)
      image_magick = image_magick.resize_to_fill(x, y)

      return image_magick.to_blob
    end

end
