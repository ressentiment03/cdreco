class Admin::LabelsController < ApplicationController
  def create
    @label = Label.new(label_params)
    @label.save
    redirect_to admin_genres_path
  end
  
  def edit
    @label = Label.find(params[:id])
  end
  
  def update
    @label = Label.find(params[:id])
    @label.update(label_params)
    redirect_to admin_genres_path
  end
  
  
  private
  def label_params
    params.require(:label).permit(:name)
  end
end
