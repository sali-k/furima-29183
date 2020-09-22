require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入機能' do
    before do
      @user_seller = FactoryBot.create(:user)
      @user_buyer = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: @user_seller.id)
      @item.images.attach(fixture_file_upload('spec/test_image.png'))
      @item.save
      @purchaseaddress = FactoryBot.build(:purchase_address, user_id: @user_buyer.id, item_id: @item.id)
    end

    it '必要事項が入力されていれば購入できる' do
      expect(@purchaseaddress).to be_valid
      sleep(1)
    end

    it 'tokenが空では登録できない' do
      @purchaseaddress.token = nil
      @purchaseaddress.valid?
      expect(@purchaseaddress.errors.full_messages).to include("クレジットカード情報を入力してください")
      sleep(1)
    end

    it 'post_codeが空では登録できない' do
      @purchaseaddress.post_code = nil
      @purchaseaddress.valid?
      expect(@purchaseaddress.errors.full_messages).to include("郵便番号を入力してください")
      sleep(1)
    end

    it 'post_codeに「-」が含まれていないと登録できない' do
      @purchaseaddress.post_code = '1234567'
      @purchaseaddress.valid?
      expect(@purchaseaddress.errors.full_messages).to include("郵便番号は「-」を含めて入力してください")
      sleep(1)
    end

    it 'prefectures_idが0では登録できない' do
      @purchaseaddress.prefectures_id = 0
      @purchaseaddress.valid?
      expect(@purchaseaddress.errors.full_messages).to include("都道府県を選択してください")
      sleep(1)
    end

    it 'cityが空では登録できない' do
      @purchaseaddress.city = nil
      @purchaseaddress.valid?
      expect(@purchaseaddress.errors.full_messages).to include("市区町村を入力してください")
      sleep(1)
    end

    it 'home_numberが空では登録できない' do
      @purchaseaddress.home_number = nil
      @purchaseaddress.valid?
      expect(@purchaseaddress.errors.full_messages).to include("番地を入力してください")
      sleep(1)
    end

    it 'phone_numberが空では登録できない' do
      @purchaseaddress.phone_number = nil
      @purchaseaddress.valid?
      expect(@purchaseaddress.errors.full_messages).to include("電話番号を入力してください")
      sleep(1)
    end

    it 'phone_numberに「-」が含まれていると登録できない' do
      @purchaseaddress.phone_number = '090-1234-5678'
      @purchaseaddress.valid?
      expect(@purchaseaddress.errors.full_messages).to include("電話番号は「-」を除いて11桁以内で入力してください")
      sleep(1)
    end

    it 'phone_numberが12以上だと登録できない' do
      @purchaseaddress.phone_number = '090123456789'
      @purchaseaddress.valid?
      expect(@purchaseaddress.errors.full_messages).to include("電話番号は「-」を除いて11桁以内で入力してください")
      sleep(1)
    end
  end
end
