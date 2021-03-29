require 'rails_helper'

describe BookSuggestion, type: :model do
  it do
    should validate_presence_of(:user)
  end

  it do
    should validate_presence_of(:title)
  end

  it do
    should validate_presence_of(:author)
  end

  it do
    should validate_presence_of(:link)
  end

  subject(:book_suggestion) do
    build(:book_suggestion)
  end

  it 'is valid' do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'When the user is nil' do
      subject(:book_suggestion) do
        build(:book_suggestion, user: nil)
      end

      it 'is not valid' do
        is_expected.to be_invalid
      end
    end

    context 'When the title is nil' do
      subject(:book_suggestion) do
        build(:book_suggestion, title: nil)
      end

      it 'is not valid' do
        is_expected.to be_invalid
      end
    end

    context 'When the author is nil' do
      subject(:book_suggestion) do
        build(:book_suggestion, author: nil)
      end

      it 'is not valid' do
        is_expected.to be_invalid
      end
    end

    context 'When the link is nil' do
      subject(:book_suggestion) do
        build(:book_suggestion, link: nil)
      end
      it 'is not valid' do
        is_expected.to be_invalid
      end
    end
  end
end

