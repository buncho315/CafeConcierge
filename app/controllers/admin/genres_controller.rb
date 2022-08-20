class Admin::GenresController < ApplicationController

  def index
   @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new
  end

  def update
  end

end
