require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '' do
    context '商品出品がうまくいくとき' do
      it 'imageとuser、descriptionとcategory、conditionとpostage、prefectureとhandling_time、priceが存在すれば登録できる' do
        expect(@user).to be_valid
      end