class BooksController < ApplicationController
  # before_action :authenticate_user!
  def index
    @books = Book.all
    render json: Kaminari.paginate_array(@books).page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
    render json: @book, ok: 200
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'not-found' }.to_json, not_found: 404
  end
end
