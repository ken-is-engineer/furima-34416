require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:form , user_id: @user.id, item_id: @item.id)
  end

  describe 'purchase an item' do
    context 'Success to purchase' do
      it 'Success to purchase when you input correctly' do
        expect(@purchase).to be_valid
      end

      it 'Success to purchase when you input correctly (building is blank)' do
        @purchase.building = ''
        expect(@purchase).to be_valid
      end
    end

    context 'Fail to purchase' do
      it 'Fail to purchase when token is blank' do
        @purchase.token = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'Fail to purchase when post_code is blank' do
        @purchase.post_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'Fail to purchase when postal_code doesnt include hyphen' do
        @purchase.post_code = '1111111'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'Fail to purchase when prefecture is not chosen' do
        @purchase.prefecture_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'Fail to purchase when city is blank' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'Fail to purchase when address_line is blank' do
        @purchase.address_line = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address line can't be blank")
      end
      it 'Fail to purchase when phone_number is blank' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'Fail to purchase when phone_number is not number' do
        @purchase.phone_number = '000-9999-88'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end
      it 'Fail to purchase when phone_number is more than 11 words' do
        @purchase.phone_number = '000111122223'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
