class ItemsController < ApplicationController

  before_action :authenticate_user!, only:[:new, :create, :show, :edit, :update] #:destroy]まだ使わない
  before_action :item_exists?, only:[:show, :edit, :update]

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

  end

  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :detail, :status_id, :fee_id, :from_id, :days_id, :category_id, :price).merge(user_id: current_user.id)
  end

  def item_exists?
    if Item.exists?(params[:id])
      @item = Item.find(params[:id])
    else
      redirect_to root_path      
    end
  end
end
