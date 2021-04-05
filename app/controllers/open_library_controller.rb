class OpenLibraryController < ApiController
  respond_to :json

  def book_info
    book = OpenLibraryService.call(params[:bibkeys])
    render json: book
  end
end
