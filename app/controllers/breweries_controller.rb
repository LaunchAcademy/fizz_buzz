class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.order('city')
  end

  def show
    @brewery = Brewery.find(params[:id])
  end
end
