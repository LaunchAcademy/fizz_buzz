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
  end

  def new
    @brewery = Brewery.new
  end

  def create
    @brewery = Brewery.new(brewery_params)
    if @brewery.save
      flash[:notice] = "Brewery successfully added"
      redirect_to @brewery
    else
      render :new
    end
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
      render :edit
    end
  end

  def destroy
    @brewery = Brewery.find(params[:id])
    if @brewery.destroy
      flash[:notice] = "Brewery successfully deleted"
      redirect_to breweries_path
    else
      render :show
    end
  end

  private

  def brewery_params
    params.require(:brewery).permit(:name, :address, :city, :state, :zip, :hours, :phone_number, :url, :description, :user_id)
  end
end
