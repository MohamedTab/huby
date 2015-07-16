class ReviewsController < ApplicationController

    def create
      @review = Review.new(review_params)
      @review.save
    redirect_to restaurants_path
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to restaurants_path
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :comment, :restaurant_id, :title)
  end
end
