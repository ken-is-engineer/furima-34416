class ItemsController < ApplicationController
  def index
    
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.create(item_params)
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
