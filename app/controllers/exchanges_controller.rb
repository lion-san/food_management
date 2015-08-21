class ExchangesController < ApplicationController
  before_action :signed_in_user, only: [:create]
  def new
    @exchange = Exchange.new
    @item = Item.find(params[:id])
  end

  def create

     @exchange.item_id = params[:id]
     @exchange.buyer_id = @current_user.id

     @exchange.status = 0
     @exchange.appraisal = 0
     @exchange.comment = ""

     if @exchange.save
       redirect_to items_path
     else
       render 'new'
     end

  end

  private

    def exchange_params
      params.require(:exchange).permit(:item_id, :buyer_id)
    end


end
