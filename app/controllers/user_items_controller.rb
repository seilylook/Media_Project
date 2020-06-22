class UserItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    item_ids = current_user.user_items.pluck(:item_id)
    @user_items = Item.where(id: item_ids)
  end

  def create
    UserItem.find_or_create_by!(item_id: params[:item_id], user_id: current_user.id)
    redirect_to items_path
  end

  def destroy
    UserItem.find(params[:id]).destroy
    redirect_to items_path
  end
end
