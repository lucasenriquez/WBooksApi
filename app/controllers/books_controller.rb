class BooksController < ApiController
  include Wor::Paginate
  def index
    @books = Book.all
    render_paginated Kaminari.paginate_array(@books).page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
    render json: @book, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'not-found' }, status: :not_found
  end
end
