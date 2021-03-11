class UsersController < ApplicationController
  def favorite_list
    @user = current_user
    @items = Item.where()
  end
  def show
    @user = current_user
  end
end
