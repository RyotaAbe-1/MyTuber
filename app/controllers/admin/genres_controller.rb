class Admin::GenresController < ApplicationController
  def new
    @genres = Genre.where(application_status: false)
    @genre = Genre.new
  end
end
