class ReviewsController < ApplicationController

  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:success] = "Review successfully added."
      redirect_to movie_path(@review.movie)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :summary, :body, :rating, :user_id, :movie_id)
  end
end
