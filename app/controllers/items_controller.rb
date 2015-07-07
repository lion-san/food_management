class ItemsController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]

  def new
    @item = Item.new
  end

  def index
      @items = Item.all
  end

  def show
     @select_item = Item.find(params[:id])
  end
end
