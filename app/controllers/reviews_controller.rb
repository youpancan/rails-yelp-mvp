class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [ :new, :create ]

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      # another way
      # redirect_to '/restaurants/restaurant/@restaurant'
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show', status: 422
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
