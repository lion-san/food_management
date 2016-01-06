class StocksController < ApplicationController
  before_action :signed_in_user



  def index
      @stocks = Stock.where( user_id: current_user.id, 
                               delete_status: 0 )
  end

  def index_all
      @stocks = Stock.where( user_id: current_user.id )
  end


  def edit_all
      @stocks = Stock.where( user_id: current_user.id, 
                               delete_status: 0 )
  end

  def update
    @stocks = stocks_params.map do |id, stock_param|
      stock = Stock.find(id)
      stock.update_attributes(stock_param)
      stock
    end
    #respond_with(@stocks, location: stocks_edit_all_path)
    redirect_to stocks_edit_all_path
  end


  #Delete
  def destroy
    @stock = Stock.find( params[:id] )
    @stock.delete_status = 1
    @stock.save
    #@stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_edit_all_path }
      format.json { head :no_content }
    end
  end

  private
    def stocks_params
      params.permit(stocks: [:item_status_id])[:stocks]
    end

end
