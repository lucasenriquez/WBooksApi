class BooksController < ApplicationController
  def index
    @books = Book.all
    render json: Kaminari.paginate_array(@books).page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end
end
