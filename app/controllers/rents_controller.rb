class RentsController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  after_action :sendmail, only: [:create]

  def index
    rents = current_user.rents
    return render json: { error: 'The user has no rents' }, status: :not_found if rents.empty?

    render json: rents
  end

  def create
    @book = Book.find(params[:rent][:book_id])
    render json: Rent.create(user: current_user, book: @book,
                             from: params[:rent][:from], to: params[:rent][:to])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'The book you specified was not found' },
           status: :unprocessable_entity
  end

  def sendmail
    EmailWorker.perform_async(current_user[:email], current_user[:fist_name], @book[:title])
  end
end
