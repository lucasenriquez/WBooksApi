class BooksController < ApiController
  def index
    @books = Book.all
    render json: Kaminari.paginate_array(@books).page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
    render json: @book, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'not-found' }, status: :not_found
  end
end
