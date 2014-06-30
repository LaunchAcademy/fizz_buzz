class Admin::ReviewsController < ApplicationController
  def destroy
    @brewery = Brewery.find(params[:brewery_id])
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = "Review successfully deleted"
      redirect_to admin_brewery_path(@brewery)
    else
      flash.now[:notice] = "Review has not been deleted"
      render template: 'admin/breweries/show'
    end
  end

  def edit
    @review = Review.find(params[:id])
    @brewery = Brewery.find(params[:brewery_id])
  end

  def update
    @brewery = Brewery.find(params[:brewery_id])
    @review = Review.find(params[:id])

    if @review.update(review_params)
      flash[:notice] = "Review successfully updated"
      redirect_to admin_brewery_path(@review.brewery)
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end
end
