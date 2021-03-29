class RentsController < ApiController
  respond_to :json
  before_action :authenticate_user!
  after_action :send_mail, only: [:create], if: -> { @book }

  def index
    @rents = current_user.rents
    return render json: { error: 'The user has no rents' }, status: :not_found if @rents.empty?

    authorize @rents
    render json: @rents
  end

  def create
    @book = Book.find(params[:rent][:book_id])
    @rent = Rent.create(user: current_user, book: @book,
                        from: params[:rent][:from], to: params[:rent][:to])
    render json: @rent
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'The book you specified was not found' },
           status: :unprocessable_entity
  end

  def send_mail
    user = current_user
    title = @book[:title]
    @from = @rent[:from]
    @to = @rent[:to]
    RentEmailWorker.perform_async(user[:email], user[:fist_name], title, @to, user[:locale])
  end
end
