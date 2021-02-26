class ItemsController < ApplicationController

  before_action :authenticate_user! only:[:new, :create, :show, :edit, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
    #@item = Item.find(params[:id])この実装段階では使わない
    @items.includes(:user)
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

  private
  def item_params
    params.require(:item).permit(:image, :title, :detail, :status_id, :fee_id, :from_id, :days_id, :category_id, :price).merge(user_id: current_user.id)
  end
end
