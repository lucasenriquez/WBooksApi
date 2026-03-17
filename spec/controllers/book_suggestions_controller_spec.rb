require 'rails_helper'

RSpec.describe BookSuggestionsController, type: :controller do

  describe 'POST #create' do
    context 'When creating a book suggestion' do
      let!(:book_suggestion) { build(:book_suggestion) }

      subject do
        post :create
      end

      it 'responds with the book suggestion json' do
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

      it 'responds with the book suggestion json' do
        expected = book_suggestion.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end
      
      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'When the title is nil' do
      let!(:book_suggestion) { build(:book_suggestion, title: nil) }

      subject do
        post :create
      end

      it 'responds with error' do
        expected = book_suggestion.errors.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end
    end

    context 'When the author is nil' do
      let!(:book_suggestion) { build(:book_suggestion, author: nil) }

      subject do
        post :create
      end

      it 'responds with error' do
        expected = book_suggestion.errors.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end
    end

    context 'When the link is nil' do
      let!(:book_suggestion) { build(:book_suggestion, link: nil) }

      it 'responds with error' do
        expected = book_suggestion.errors.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end
    end
  end

  describe 'DELETE #destroy' do
    include_context 'Authenticated User'

    context 'When the user deletes their own book suggestion' do
      let!(:book_suggestion) { create(:book_suggestion, user: user) }

      before do
        delete :destroy, params: { id: book_suggestion.id }
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end

      it 'deletes the book suggestion' do
        expect(BookSuggestion.find_by(id: book_suggestion.id)).to be_nil
      end

      it 'responds with a success message' do
        body = JSON.parse(response.body)
        expect(body['message']).to eq('Book suggestion successfully deleted')
      end
    end

    context 'When the book suggestion does not exist' do
      before do
        delete :destroy, params: { id: -1 }
      end

      it 'responds with 404 status' do
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'When a user tries to delete another users book suggestion' do
      let!(:other_user) { create(:user) }
      let!(:book_suggestion) { create(:book_suggestion, user: other_user) }

      it 'does not delete the book suggestion' do
        delete :destroy, params: { id: book_suggestion.id }
        expect(BookSuggestion.find_by(id: book_suggestion.id)).to be_present
      end
    end
  end
end
