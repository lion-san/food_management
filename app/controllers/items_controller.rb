class ItemsController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :create, :thumbnail, :picture1, :picture2, :picture3, :picture4]

  def new
    @item = Item.new
  end

  def index
      @items = Item.all
  end

  def show
     @item = Item.find(params[:id])
  end

  def create
     @item = Item.new(item_params)

     @item.user_id = @current_user.id
     @item.category_id = 1
     @item.item_status_id = 1
     @item.exchange_method_id = 1
     @item.exchange_date = Date.today

     if not params[:item][:picture1].nil?
       @item.picture1 = params[:item][:picture1].read
       @item.picture1_content_type = params[:item][:picture1].content_type

       @item.thumbnail = @item.picture1
     end

     if not params[:item][:picture2].nil?
       @item.picture2 = params[:item][:picture2].read
       @item.picture2_content_type = params[:item][:picture2].content_type
     end

     if not params[:item][:picture3].nil?
       @item.picture3 = params[:item][:picture3].read
       @item.picture3_content_type = params[:item][:picture3].content_type
     end

     if not params[:item][:picture4].nil?
       @item.picture4 = params[:item][:picture4].read
       @item.picture4_content_type = params[:item][:picture4].content_type
     end


     if @item.save

       redirect_to items_path

     else
       render 'new'
     end


  end

  def thumbnail
    @item = Item.find(params[:id])
    if not @item.thumbnail.nil?
      send_data(@item.thumbnail, type: @item.picture1_content_type, disposition: :inline)
    end
  end

  def picture1
    @item = Item.find(params[:id])
    if not @item.picture1.nil?
      send_data(@item.picture1, type: @item.picture1_content_type, disposition: :inline)
    end
  end

  def picture2
    @item = Item.find(params[:id])
    if not @item.picture2.nil?
      send_data(@item.picture2, type: @item.picture2_content_type, disposition: :inline)
    end
  end

  def picture3
    @item = Item.find(params[:id])
    if not @item.picture3.nil?
      send_data(@item.picture3, type: @item.picture3_content_type, disposition: :inline)
    end
  end

  def picture4
    @item = Item.find(params[:id])
    if not @item.picture4.nil?
      send_data(@item.picture4, type: @item.picture4_content_type, disposition: :inline)
    end
  end

  private

    def item_params
      params.require(:item).permit(:user_id, :name, :price, :item_detail, :category_id,
                                  :item_status_id, :exchange_method_id, :exchange_date)
    end

end
