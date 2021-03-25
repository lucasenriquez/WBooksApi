class RentsController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  after_action :send_mail, only: [:create]

  def index
    rents = current_user.rents
    return render json: { error: 'The user has no rents' }, status: :not_found if rents.empty?

    render json: rents
  end

  def create
    @book = Book.find(params[:rent][:book_id])
    @rent = Rent.create(user: current_user, book: @book,
                        from: params[:rent][:from], to: params[:rent][:to])
    @from = @rent[:from]
    @to = @rent[:to]
    render json: @rent
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'The book you specified was not found' },
           status: :unprocessable_entity
  end

  def send_mail
    user = current_user
    title = @book[:title] if @book
    RentEmailWorker.perform_async(user[:email], user[:fist_name], title, @from, @to) if @book
  end
end
