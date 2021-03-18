require 'rails_helper'
require './spec/shared_context.rb'

RSpec.describe RentsController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all the rents' do
      let!(:user)  { create(:user) }
      let!(:rents) { create(:rent, user: user) }

      it 'responds with the rents json' do
        expected = user.rents.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'When a rent does not exist' do
      let!(:user) { create(:user) }

      before do
        get :index
      end

      it 'responds with 404 status' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET #create' do
    context 'When creating a rent' do
      let!(:rent) { create(:rent) }

      it 'responds with the rent json' do
        expected = rent.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'When a book does not exist' do
      let!(:book) { create(:book, id: 1) }

      before do
        post :create, params: { rent: {book_id: 5} }
      end

      it 'responds with 422 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
