require 'rails_helper'

describe Rent, type: :model do
  it do
    should validate_presence_of(:user)
  end

  it do
    should validate_presence_of(:book)
  end

  subject(:rent) do
    build(:rent)
  end
  
  it 'is valid' do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'When the user is nil' do
      subject(:rent) do
        build(:rent, user: nil)
      end

      it 'is not valid' do
        is_expected.to be_invalid
      end
    end

    context 'When the book is nil' do
      subject(:rent) do
        build(:rent, book: nil)
      end

      it 'is not valid' do
        is_expected.to be_invalid
      end
    end
  end
end
