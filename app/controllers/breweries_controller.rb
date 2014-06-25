class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.order('city')
  end

  def show
    @brewery = Brewery.find(params[:id])
  end

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def update
    @brewery = Brewery.find(params[:id])
    if @brewery.update(brewery_params)
      flash[:notice] = "Brewery information updated"
      redirect_to brewery_path(@brewery)
    else
      render template: 'breweries/edit'
    end
  end

  private

  def brewery_params
    params.require(:brewery).permit(:name, :address, :city, :state, :zip, :hours, :phone_number, :url, :description)
  end
end
