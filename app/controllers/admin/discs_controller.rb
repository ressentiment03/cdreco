class Admin::DiscsController < ApplicationController
    def create
        @disc = Disc.new(disc_params)
        @disc.save
        @item = @disc.item_id
        redirect_to admin_item_path(@item)
    end
    
    private
    def disc_params
        params.require(:disc).permit(:item_id, :sort)
    end
end
