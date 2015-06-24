class ItemsController < ApplicationController
  before_action :signed_in_user
  def new
  end

  def index
      @items = Item.all
  end

  def show
     @select_item = Item.find(params[:id])
  end
end
