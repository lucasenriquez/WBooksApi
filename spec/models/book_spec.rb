require 'rails_helper'

describe Book, type: :model do
  it do
    should validate_presence_of(:title)
  end

  it do
    should validate_presence_of(:genre)
  end

  it do
    should validate_presence_of(:author)
  end

  it do
    should validate_presence_of(:image)
  end

  it do
    should validate_presence_of(:year)
  end

  it do
    should validate_presence_of(:publisher)
  end

  subject(:book) do
    build(:book)
  end

  it 'is valid' do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'When the genre is nil' do
      subject(:book) do
        build(:book, genre: nil)
      end

      it 'is not valid' do
        is_expected.to be_invalid
      end
    end

    context 'When the author is nil' do
      subject(:book) do
        build(:book, author: nil)
      end

      it 'is not valid' do
        is_expected.to be_invalid
      end
    end

    context 'When the image is nil' do
      subject(:book) do
        build(:book, image: nil)
      end
      it 'is not valid' do
        is_expected.to be_invalid
      end
    end
    
    context 'When the title is nil' do
      subject(:book) do
        build(:book, title: nil)
      end

      it 'is not valid' do
        is_expected.to be_invalid
      end
    end

    subject(:book) do
      build(:book, publisher: nil)
    end
    context 'When the publisher is nil' do

      it 'is not valid' do
        is_expected.to be_invalid
      end
    end
    
    context 'When the year is nil' do
      subject(:book) do
        build(:book, year: nil)
      end

      it 'is not valid' do
        is_expected.to be_invalid
      end
    end
  end
end
