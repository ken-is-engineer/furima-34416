class PurchasesController < ApplicationController
  def index
    @purchase = Form.new
    @item = Item.find(params[:id])
  end

  def create
    @purchase = Form.new(purchase_params)
    @item = Item.find(params[:id])
    if @purchase.valid?
      @purchase.save
      Payjp.api_key = "sk_test_c02ca54114fc7fd69254b96e"  # PAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      redirect_to root_path
    else
      @item = Item.find(params[:id])
      render :index
    end
  end

  private

  def purchase_params
    params.permit(:post_code, :prefecture_id, :city, :address_line, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:id], token: params[:token])
  end
end
