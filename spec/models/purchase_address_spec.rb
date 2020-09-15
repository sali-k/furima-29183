require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入機能' do
    before do
      @user_seller = FactoryBot.create(:user)
      @user_buyer = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: @user_seller.id)
      @item.image = fixture_file_upload('spec/test_image.png')
      @item.save
      @purchaseaddress = FactoryBot.build(:purchase_address, user_id: @user_buyer.id, item_id: @item.id)
    end

    it "必要事項が入力されていれば購入できる" do
      expect(@purchaseaddress).to be_valid
    end

    it "tokenが空では登録できない" do
      sleep(1)
    end

    it "post_codeが空では登録できない" do
      sleep(1)
    end

    it "post_codeに「-」が含まれていないと登録できない" do
      sleep(1)
    end

    it "post_codeが8文字以上だと登録できない" do
      sleep(1)
    end

    it "prefectures_idが空では登録できない" do
      sleep(1)
    end

    it "cityが空では登録できない" do
      sleep(1)
    end

    it "home_numberが空では登録できない" do
      sleep(1)
    end

    it "phone_numberが空では登録できない" do
      sleep(1)
    end

    it "phone_numberに「-」が含まれていると登録できない" do
      sleep(1)
    end

    it "phone_numberが12以上だと登録できない" do
      sleep(1)
    end
  end
end
