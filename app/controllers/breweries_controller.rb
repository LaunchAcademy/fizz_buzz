class BreweriesController < ApplicationController

  def index
    if params[:search]
      @breweries = Brewery.search(params[:search]).order('city').page(params[:page])
    else
      @breweries = Brewery.order('city').page(params[:page])
    end
  end

  def show
    @brewery = Brewery.find(params[:id])
    @review = Review.new
    @vote = Vote.new
  end

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def update
    @brewery = Brewery.find(params[:id])
    if current_user == @brewery.user && @brewery.update(brewery_params)
      flash[:notice] = "Brewery information updated"
      redirect_to brewery_path(@brewery)
    else
      render :edit
    end
  end

  private

  def brewery_params
    params.require(:brewery).permit(:name, :address, :city, :state, :zip,
      :hours, :phone_number, :url, :description, :user_id)
  end

  def authorize_brewer
    unless current_user.brewery.exist?
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
