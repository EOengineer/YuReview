class ReviewsController < ApplicationController
  before_action :build_parent_movie

  def index
    @reviews = @movie.reviews.all
  end

  def new
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:success] = "Review successfully added."
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])

    redirect_to signout_path unless @review.user_id == @current_user.id
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to movie_path(@movie)
      flash[:success] = "Review successfully updated."
    else
      render 'new'
    end
  end

  private

  def build_parent_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:title, :summary, :body, :rating, :user_id, :movie_id)
  end
end
