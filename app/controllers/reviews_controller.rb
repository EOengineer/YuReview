class ReviewsController < ApplicationController

  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)

    if @review.save
      flash[:success] = "Review successfully added."
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to movie_path(@movie)
      flash[:success] = "Review successfully updated."
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :summary, :body, :rating, :user_id, :movie_id)
  end
end
