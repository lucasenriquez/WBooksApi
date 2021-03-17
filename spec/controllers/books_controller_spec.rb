require 'rails_helper'
require './spec/shared_context.rb'

RSpec.describe BooksController, type: :controller do
  describe 'GET #index' do
    context 'When fetching all the books' do
      let!(:books) { create_list(:book, 5) }

      it 'responses with the books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When fetching a book' do
      let!(:book) { create(:book) }

      before do
        get :show, params: { id: book.id }
      end

      it 'responses with the book json' do
        expected = book.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'When a book does not exists' do
    
    let!(:book) { create(:book, id: 1) }

    before do
      get :show, params: { id: 5 }
    end

    rescue ActiveRecord::RecordNotFound
      it 'responds with 404 status' do
        expect(response).to have_http_status(:error)
      end
    end
  end
end
