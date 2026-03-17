class BookSuggestionsController < ApiController
  before_action :authenticate_user!

  def create
    all_params = create_params.merge(user: current_user)
    @book_suggestion = BookSuggestion.new(all_params)
    return render json: @book_suggestion if @book_suggestion.save

    render json: @book_suggestion.errors
  end

  def destroy
    @book_suggestion = BookSuggestion.find(params[:id])
    authorize @book_suggestion
    @book_suggestion.destroy
    render json: { message: 'Book suggestion successfully deleted' }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Book suggestion not found' }, status: :not_found
  end

  private

  def create_params
    params.require(:book_suggestion).permit(:title, :author, :link, :editorial,
                                            :price, :publisher, :year)
  end
end
