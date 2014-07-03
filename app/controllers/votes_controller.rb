class VotesController< ApplicationController
  def create
    @brewery = Brewery.find(params[:brewery_id])
    @review = Review.find(params[:review_id])
    @vote = Vote.find_or_initialize_by(
      user: current_user,
      review: @review
    )
    if !current_user
      flash[:notice] = "You must be signed in to do that."
      render template: "breweries/show"
    elsif @vote.update!(vote_params)
      @review.update_rank
      redirect_to brewery_path(@brewery)
    elsif @vote.save
      @review.update_rank
      redirect_to brewery_path(@brewery)
    else
      @brewery = Brewery.find(params[:brewery_id])
      render template: 'breweries/show'
    end
  end

  def vote_params
    params.require(:vote).permit(:score)
  end
end
