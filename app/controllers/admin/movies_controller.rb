class Admin::MoviesController < ApplicationController
  before_action :admin_authenticate

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
      flash[:now] = 'there are errors.'
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      redirect_to @movie
      flash[:now] = "movie successfully updated"
    else
      render 'edit'
      flash[:now] = "there are errors."
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :year)
  end
end
