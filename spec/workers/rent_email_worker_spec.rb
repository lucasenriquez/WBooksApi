require 'rails_helper' 
require 'sidekiq/testing'
Sidekiq::Testing.fake!
RSpec.describe RentEmailWorker, type: :worker do
    let(:user) { build(:user, email: "lucas.enriquez@widergy.com") }
    let(:book) { build(:book)}
    describe 'testing worker' do
      it 'works' do
        RentEmailWorker.perform_async(user[:email], user[:first_name], book[:title])
      end
    end
end