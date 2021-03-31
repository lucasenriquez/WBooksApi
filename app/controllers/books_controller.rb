class BooksController < ApiController
  include Wor::Paginate
  def index
    render_paginated Book
  end

  def show
    @book = Book.find(params[:id])
    render json: @book, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'not-found' }, status: :not_found
  end
end
