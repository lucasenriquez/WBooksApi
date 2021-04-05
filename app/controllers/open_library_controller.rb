class OpenLibraryController < ApiController
  include AsyncRequest::ApplicationHelper
  respond_to :json

  def book_info
    id = execute_async(OpenLibraryService, params[:bibkeys])
    render json: { id: id, url: async_request.job_url(id) }, status: 202
  end
end
