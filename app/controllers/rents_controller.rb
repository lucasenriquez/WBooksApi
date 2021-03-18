class RentsController < ApplicationController
  respond_to :json
  before_action :authenticate_user!

  def index
    rent = current_user.rents
    if rent == []
      render json: { error: 'The user has no rents' }, status: :not_found
    else
      render json: rent
    end
  end

  def create
    book = Book.find(params[:rent][:book_id])
    render json: Rent.create(user: current_user, book: book,
                             from: params[:rent][:from], to: params[:rent][:to])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'The book you specified was not found' },
           status: :unprocessable_entity
  end
end
