require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "必要事項が入力されていれば出品できる" do
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
