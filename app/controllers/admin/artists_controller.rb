class Admin::ArtistsController < ApplicationController
  def create
    @artist = Artist.new(artist_params)
    @artist.save
    redirect_to admin_genres_path
  end
  
  private
  def artist_params
    params.require(:artist).permit(:name)
  end
end
