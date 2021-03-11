class ItemsController < ApplicationController
  impressionist actions: [:show]
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  before_action :item_exists?, only:[:show, :edit, :update, :destroy]
  before_action :seller?, only:[:edit, :update, :destroy]
  before_action :item_on_sale?, only:[:edit, :update, :destroy]

  def index
    @items = Item.all.includes(:user).order(created_at: :desc)
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
    #PV数をカウントするための記述
    #impressionist(@item, nil, unique: [:session_hash])
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

  def destroy
    @item.destroy
    redirect_to root_path
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

  def seller?
    unless current_user == @item.user
      redirect_to root_path
    end
  end
  
  def item_on_sale?
    if Purchase.exists?(item_id: params[:id])
      redirect_to root_path
    else
    end
  end
end
