class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to new_admin_item_path
  end
  
  def show
    @item = Item.find(params[:id])
    @disc = Disc.new
    @discs = @item.discs
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to edit_admin_item_path
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active, :genre_id, :artist_id, :label_id, :publish_date)
  end
end
