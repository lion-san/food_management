class ItemsController < ApplicationController
  def new
  end

  def index
      @items = Item.all
  end

  def show
     @select_item = Item.find(params[:id])
  end
end
