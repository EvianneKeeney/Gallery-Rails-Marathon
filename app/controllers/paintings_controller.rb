class PaintingsController < ApplicationController

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @painting = Painting.new
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @painting = Painting.new(painting_params)
    @painting.gallery = @gallery
    if @painting.save
      flash[:notice] = "Painting added!"
      redirect_to gallery_path(@gallery)
    else
      flash[:notice] = @painting.errors.full_messages
      render :new
    end
  end

  def painting_params
    params.require(:painting).permit(:title, :artists)
  end
end
