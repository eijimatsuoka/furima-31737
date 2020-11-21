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
        it "nameが40文字以下で登録できる" do
          @item.name = "aaaaaaa"
          expect(@item).to be_valid
        end
        it "descriptionが1000文字以下であれば登録できる" do
          @item.description = "aaaaaaa"
          expect(@item).to be_valid
        end
      end
      
      context '商品出品がうまくいかないとき' do
        it 'nameが空だと保存できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'descriptionが空だと保存できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'category_idが1だと保存できない' do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it 'condition_idが1だと保存できない' do
          @item.condition_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition must be other than 1")
        end
        it 'postage_idが1だと保存できない' do
          @item.postage_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage must be other than 1")
        end
        it 'prefecture_idが1だと保存できない' do
          @item.prefecture_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
        end
        it 'handling_time_idが1だと保存できない' do
          @item.handling_time_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Handling time must be other than 1")
        end
        it 'priceが空だと保存できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが半角数字以外だと保存できない' do
          @item.price = '１１１１'
          @item.valid?
          expect(@item.errors.full_messages).to include()
        end
        it 'priceが300~9999999の間以外だと保存できない' do
          @item.price = '200'
          @item.valid?
          expect(@item.errors.full_messages).to include()
        end
      end
    end
  end
end

