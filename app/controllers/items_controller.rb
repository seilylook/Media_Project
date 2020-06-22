class ItemsController < ApplicationController
  before_action :load_object, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!, only: [:new, :edit]

  def show
    @comment = Comment.new
    @comments = @item.comments.all
  end

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to items_path
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  def update
    @item.update(item_params)
    redirect_to items_path
  end

  private
    def load_object
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :desc, :image, :price, :user_id)
    end
end
