require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    describe '商品出品' do
      context '商品出品がうまくいくとき' do
        it 'imageとuser、nameとdescriptionとcategory、conditionとpostage、prefectureとhandling_time、priceが存在すれば登録できる' do
          expect(@item).to be_valid
        end
      end

      context '商品出品がうまくいかないとき' do
        it 'imageが空だと保存できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('画像を入力してください')
        end
        it 'nameが空だと保存できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include('商品名を入力してください')
        end
        it 'descriptionが空だと保存できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include('商品の説明を入力してください')
        end
        it 'category_idが1だと保存できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
        end
        it 'condition_idが1だと保存できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('商品の状態は1以外の値にしてください')
        end
        it 'postage_idが1だと保存できない' do
          @item.postage_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('配送料の負担は1以外の値にしてください')
        end
        it 'prefecture_idが1だと保存できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('発送元の地域は1以外の値にしてください')
        end
        it 'handling_time_idが1だと保存できない' do
          @item.handling_time_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('発送までの日数は1以外の値にしてください')
        end
        it 'priceが空だと保存できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include('販売価格を入力してください')
        end
        it 'priceが半角数字以外だと保存できない' do
          @item.price = '１１１１'
          @item.valid?
          expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
        end
        it 'priceが300以下だと保存できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('販売価格は299より大きい値にしてください')
        end
        it 'priceが10000000以上だと保存できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('販売価格は10000000より小さい値にしてください')
        end
      end
    end
  end
end
