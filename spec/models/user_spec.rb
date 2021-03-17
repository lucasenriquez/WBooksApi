require 'rails_helper'

describe User, type: :model do
  it do
    should validate_presence_of(:first_name)
  end

  it do
    should validate_presence_of(:last_name)
  end

  subject(:user) do
    build(:user)
  end
  
  it 'is valid' do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'When the first_name is nil' do
      subject(:user) do
        build(:user, first_name: nil)
      end

      it 'is not valid' do
        is_expected.to be_invalid
      end
    end

    context 'When the last_name is nil' do
      subject(:user) do
        build(:user, last_name: nil)
      end

      it 'is not valid' do
        is_expected.to be_invalid
      end
    end
  end
end
