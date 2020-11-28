require 'rails_helper'

RSpec.describe PurchaceAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchace_address = FactoryBot.build(:purchace_address)
    end

    it '全ての情報が正しく記載されていると保存できる' do
      expect(@purchace_address).to be_valid
    end

    it 'tokenが空だと保存できない' do
      @purchace_address.token = nil
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空だと保存できない' do
      @purchace_address.post_code = nil
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("Post code can't be blank")
    end

    it '郵便番号がハイフンを含んでいないと保存できない' do
      @purchace_address.post_code = '1234567'
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it 'prefecture_idが1だと保存できない' do
      @purchace_address.prefecture_id = 1
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it '市区町村が空だと保存できない' do
      @purchace_address.city = nil
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空だと保存できない' do
      @purchace_address.house_number = nil
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("House number can't be blank")
    end

    it '建物名は空でも保存できる' do
      @purchace_address.building_name = nil
      expect(@purchace_address).to be_valid
    end

    it '電話番号が空だと保存できない' do
      @purchace_address.phone_number = nil
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("Phone number can't be blank")
    end

  end
end
