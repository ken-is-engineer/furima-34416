require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'user sign-up' do
    context 'Success to register' do
      it 'Success to register when you input correctly' do
        expect(@user).to be_valid
      end
    end

    context 'Fail to register' do
      it 'Fail to register when nickname is blank' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'Fail to register when email is blank' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'Fail to register when password is blank' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'Fail to register when password_confirmation is blank (doesnt match password)' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'Fail to register when first_name is blank' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'Fail to register when last_name is blank' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'Fail to register when first_kana is blank' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it 'Fail to register when last_kana is blank' do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it 'Fail to register when birthday is blank' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'Fail to register when password is less than 6 words' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'Fail to register when email has already been used' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'Fail to register when first_name is other than Japanese' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'Fail to register when last_name is other than Japanese' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'Fail to register when first_kana is other than Japanese' do
        @user.first_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana is invalid")
      end

      it 'Fail to register when last_kana is other than Japanese' do
        @user.last_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana is invalid")
      end

      it 'Fail to register when email is without "@" ' do
        @user.email = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'Fail to register when password is only alphabet' do
        @user.password = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'Fail to register when password is only number' do
        @user.password = "111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'Fail to register when password is used double-byte character' do
        @user.password = "ｋ１１１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
    end
  end
end