require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '購入機能' do
    context '商品の購入ができるとき' do
      it 'ユーザーがログインした状態で、郵便番号、都道府県、市区町村、番地、電話番号、
          カード情報が正しく入力されているとき' do
        expect(@order_form).to be_valid
      end
    end

    context '商品の購入ができないとき' do
      it 'ユーザーが存在していないとき' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it '郵便番号が空のとき' do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンが存在しないとき' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code Input correctly')
      end
      it '都道府県が未選択のとき' do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Prefecture Select')
      end
      it '市区町村が空のとき' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空のとき' do
        @order_form.house_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空のとき' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンが含まれているとき' do
        @order_form.phone_number = '090-1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number Input only number')
      end
      it 'カード情報が正しく入力されていないとき' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
