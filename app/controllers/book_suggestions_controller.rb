class BookSuggestionsController < ApiController
  def create
    all_params = create_params.merge(user: current_user)
    @book_suggestion = BookSuggestion.new(all_params)
    return render json: @book_suggestion if @book_suggestion.save

    render json: @book_suggestion.errors
  end

  private

  def create_params
    params.require(:book_suggestion).permit(:title, :author, :link, :editorial,
                                            :price, :publisher, :year)
  end
end
