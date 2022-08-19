class Admin::GenresController < ApplicationController
  
  def index
   @genre = Genre.all
  end

  def create
    @genre = Genre.all
  end

  def update
  end

end
