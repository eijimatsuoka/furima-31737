require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it '全ての情報が正しく記載されていると保存できる' do
      expect(@purchase_address).to be_valid
    end

    it 'tokenが空だと保存できない' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("クレジットカード情報を入力してください")
    end

    it '郵便番号が空だと保存できない' do
      @purchase_address.post_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
    end

    it '郵便番号がハイフンを含んでいないと保存できない' do
      @purchase_address.post_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("郵便番号は不正な値です")
    end

    it 'prefecture_idが1だと保存できない' do
      @purchase_address.prefecture_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("都道府県は1以外の値にしてください")
    end

    it 'prefecture_idが空だと保存できない' do
      @purchase_address.prefecture_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("都道府県を入力してください", "都道府県は数値で入力してください")
    end

    it '市区町村が空だと保存できない' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
    end

    it '番地が空だと保存できない' do
      @purchase_address.house_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
    end

    it '建物名は空でも保存できる' do
      @purchase_address.building_name = nil
      expect(@purchase_address).to be_valid
    end

    it '電話番号が空だと保存できない' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
    end

    it '電話番号が12桁以上だと保存できない' do
      @purchase_address.phone_number = 111111111111
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
    end

  end
end
