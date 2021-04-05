class OpenLibraryController < ApiController
    respond_to :json

    def book_info
      book = AsyncRequest::Job.create_and_enqueue(OpenLibraryService, params[:bibkeys])
      #book = async_request.OpenLibraryService.call(params[:bibkeys])
      render json: book, status: :ok
    end
end
