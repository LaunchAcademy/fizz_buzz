class ReviewsController < ApplicationController

  def create
    @brewery = Brewery.find(params[:brewery_id])

    p = review_params
    p[:brewery_id] = @brewery.id
    p[:user_id] = current_user.id
    @review = Review.new(p)

    if @review.save
      flash[:notice] = "Review successfully added"
      redirect_to brewery_path(@brewery)
    else
      render template: 'breweries/show'
    end
  end

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end

end
