class VotesController< ApplicationController

  def create
    @brewery = Brewery.find(params[:brewery_id])
    @review = Review.find(params[:review_id])
    if Vote.where(user_id: current_user.id, review_id: @review.id).empty?
      @vote = Vote.new(vote_params)
      @vote.user = current_user
      @vote.review = @review
      if @vote.save!
        redirect_to brewery_path(@brewery)
      else
        render template: "breweries/show"
      end
    else
      @vote = Vote.where(user_id: current_user.id, review_id: @review.id).first
      if @vote.update(vote_params)
        redirect_to brewery_path(@brewery)
      else
        render template: "breweries/show"
      end
    end
  end

  def vote_params
    params.require(:vote).permit(:score)
  end


end
