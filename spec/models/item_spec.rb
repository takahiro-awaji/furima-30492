require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '出品画像、商品名、商品の説明、商品の詳細（カテゴリー・商品の状態）、配送について（
      配送料の負担・発送元の地域・発送までの日数）、販売価格がすべて入力されているとき' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it '出品画像が空のとき' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空のとき' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空のとき' do
        @item.item_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it '商品の詳細（カテゴリー）が未選択のとき' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it '商品の詳細（商品の状態）が未選択のとき' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status Select')
      end
      it '配送について（配送料の負担）が未選択のとき' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge Select')
      end
      it '配送について（発送元の地域）が未選択のとき' do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area Select')
      end
      it '配送について（発送までの日数）が未選択のとき' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship Select')
      end
      it '販売価格が空のとき' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格の入力が半角数字以外のとき' do
        @item.price = '４０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '販売価格の入力が299円以下だったとき' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '販売価格の入力が10,000,000円以上だったとき' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
