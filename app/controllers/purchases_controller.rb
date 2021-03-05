class PurchasesController < ApplicationController

  before_action :authenticate_user!
  before_action :item_exists?
  before_action :item_on_sale?
  before_action :seller?

  def index
    @purchase = Form.new
  end

  def create
    @purchase = Form.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      pay_jp_send
      redirect_to root_path
    else
      @item = Item.find(params[:id])
      render :index
    end
  end

  private

  def purchase_params
    params.require(:form).permit(:post_code, :prefecture_id, :city, :address_line, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:id], token: params[:token])
  end

  def item_exists?
    if Item.exists?(params[:id])
      @item = Item.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def item_on_sale?
    if Purchase.exists?(item_id: params[:id])
      redirect_to root_path
    else
    end
  end

  def seller?
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def pay_jp_send
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
