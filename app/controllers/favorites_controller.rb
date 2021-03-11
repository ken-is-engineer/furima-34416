class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_exists?
  before_action :seller?

  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @favorite = current_user.favorites.create(item_id: params[:id])
    redirect_back(fallback_location: item_path(params[:id]))
  end

  def destroy
    @favorite = Favorite.find_by(item_id: params[:id], user_id: current_user.id)
    @favorite.destroy
    redirect_back(fallback_location: item_path(params[:id]))
  end

  private

  def item_exists?
    unless Item.exists?(params[:id])
      redirect_to root_path
    end
  end

  def seller?
    @item = Item.find(params[:id])
    if current_user == @item.user
      redirect_to root_path
    else
    end
  end
end
