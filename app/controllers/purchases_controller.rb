class PurchasesController < ApplicationController
  def index
    @purchase = Form.new
    @item = Item.find(params[:id])
  end

  def create
    @purchase = Form.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      @item = Item.find(params[:id])
      render :index
    end
  end

  private

  def purchase_params
    params.permit(:post_code, :prefecture_id, :city, :address_line, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:id]) #, token: params[:token]))
  end
end
