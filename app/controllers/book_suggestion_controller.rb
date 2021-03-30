class BookSuggestionController < ApiController
  def create
    @book_suggestion = BookSuggestion.create(title: params[:book_suggestion][:title],
                                             author: params[:book_suggestion][:author],
                                             link: params[:book_suggestion][:link],
                                             user: current_user || nil)
    render json: @book_suggestion
  end
end
