require 'rails_helper'

RSpec.describe BookSuggestionController, type: :controller do

  describe 'POST #create' do
    context 'When creating a book suggestion' do
      let!(:book_suggestion) { build(:book_suggestion) }

      subject do
        post :create
      end

      it 'responds with the rent json' do
        expected = book_suggestion.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end
      
      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'When a guest creates a book suggestion' do
      let!(:book_suggestion) { build(:book_suggestion, user: nil) }

      subject do
        post :create
      end

      it 'responds with the rent json' do
        expected = book_suggestion.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end
      
      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
