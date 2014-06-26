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

  def destroy
    @brewery = Brewery.find(params[:brewery_id])
    @review = Review.find(params[:id])
    if @review.user == current_user && @review.destroy
      flash[:notice] = "Review successfully deleted"
      redirect_to brewery_path(@brewery)
    else
      flash.now[:notice] = "Review has not been deleted"
      render template: 'breweries/show'
    end
  end

  def edit
    @review = Review.find(params[:id])
    @brewery = Brewery.find(params[:brewery_id])
  end

  def update
    @brewery = Brewery.find(params[:brewery_id])
    @review = Review.find(params[:id])

    if current_user == @review.user && @review.update(review_params)
      flash[:notice] = "Review successfully updated"
      redirect_to brewery_path(@review.brewery)
    else
      render :edit
    end
  end

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end

end
