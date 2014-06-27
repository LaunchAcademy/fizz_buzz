class VotesController< ApplicationController
  def create
    @brewery = Brewery.find(params[:brewery_id])
    @review = Review.find(params[:review_id])
    @vote = Vote.find_or_initialize_by(
      user: current_user,
      review: @review
    )

<<<<<<< HEAD
    if @vote.update(vote_params)
=======
    if @vote.update!(vote_params)
>>>>>>> f8ce57ea96557b3a83ce45fd9ee2993b2b1cd255
      redirect_to brewery_path(@brewery)
    elsif @vote.save
      redirect_to brewery_path(@brewery)
    else
      render template: 'breweries/show'
    end
  end

  def vote_params
    params.require(:vote).permit(:score)
  end
end
