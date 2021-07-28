class Admin::LabelsController < ApplicationController
  def create
    @label = Label.new(label_params)
    @label.save
    redirect_to admin_genres_path
  end
  
  
  private
  def label_params
    params.require(:label).permit(:name)
  end
end
