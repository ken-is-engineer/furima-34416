require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'put an item' do
    context 'Success to put' do
      it 'Success to put when you input correctly' do
        expect(@item).to be_valid
      end
    end

    context 'Fail to put' do
      it 'Fail to put when image is blank' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'Fail to put when title is blank' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'Fail to put when detail is blank' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'Fail to put when price is blank' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'Fail to put when status is not chosen' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'Fail to put when fee is not chosen' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee must be other than 1")
      end
      it 'Fail to put when from is not chosen' do
        @item.from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("From must be other than 1")
      end
      it 'Fail to put when days is not chosen' do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 1")
      end
      it 'Fail to put when category is not chosen' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'Fail to put when price is less than 300' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'Fail to put when price is more than 9999999' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'Fail to put when price is used double-byte character' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
