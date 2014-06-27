class VotesController< ApplicationController

  def create
    @brewery = Brewery.find(params[:brewery_id])
    @review = Review.find(params[:review_id])
    @vote = Vote.find_or_initialize_by(user_id: current_user.id, review_id: @review.id)

    if @vote.update!(vote_params)
      redirect_to brewery_path(@brewery)
    elsif @vote.save
      redirect_to brewery_path(@brewery)
    else
      render template: "breweries/show"
    end
  end

  def vote_params
    params.require(:vote).permit(:score)
  end
end
