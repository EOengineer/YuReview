class Admin::MoviesController < ApplicationController

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie
      flash[:now] = "movie successfully added"
    else
      render 'new'
      flash[:now] = 'there are some errors.'
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :year)
  end
end
