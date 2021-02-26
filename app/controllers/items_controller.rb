class ItemsController < ApplicationController

  before_action :authenticate_user!, only:[:new, :create] #:show, :edit, :destroy]まだ使わない

  def index
    @items = Item.all.includes(:user).order(created_at: :desc)
    #@item = Item.find(params[:id])今後使う予定があると思ったので残しているだけです特に理解ていただかなくて結構です。実際の現場ではこのような個人的なメモは残すべきではないのでしょうが、勉強段階ですので残しております。
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :detail, :status_id, :fee_id, :from_id, :days_id, :category_id, :price).merge(user_id: current_user.id)
  end
end
