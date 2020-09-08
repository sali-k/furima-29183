require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('spec/test_image.png')
    end

    it "必要事項が入力されていれば出品できる" do
      expect(@item).to be_valid
    end

    it "imageが空では登録できない" do
      @item.name = nil
      @item.valid?
      binding.pry
      #expect(@item.errors.full_messages).to include("Nickname can't be blank")
    end

    it "nameが空では登録できない" do
    end

    it "nameが41文字以上だと出品できない" do
    end

    it "descriptionが空では登録できない" do
    end

    it "descriptionが1001文字以上だと出品できない" do
    end

    it "category_idが空では登録できない" do
    end

    it "condition_idが空では登録できない" do
    end

    it "postage_payer_idが空では登録できない" do
    end

    it "prefecture_idが空では登録できない" do
    end

    it "handing_time_idが空では登録できない" do
    end

    it "priceが空では登録できない" do
    end

    it "priceは半角数字でないと出品できない" do
    end

    it "priceが299円以下だと出品できない" do
    end

    it "priceが10000000円以上だと出品できない" do
    end

  end
end
