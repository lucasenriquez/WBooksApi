class OpenLibraryController < ApiController
  respond_to :json

  def book_info
    book = OpenLibraryWorker.perform_async(params[:bibkeys])
    render json: book
  end
end
