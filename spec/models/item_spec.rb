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
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空では登録できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "nameが41文字以上だと出品できない" do
      @item.name = 'a' * 41
      @item.valid?
      expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
    end

    it "descriptionが空では登録できない" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "descriptionが1001文字以上だと出品できない" do
      @item.description= 'a' * 1001
      @item.valid?
      expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
    end

    it "category_idが空では登録できない" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "condition_idが空では登録できない" do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it "postage_payer_idが空では登録できない" do
      @item.postage_payer_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage payer can't be blank")
    end

    it "prefecture_idが空では登録できない" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "handing_time_idが空では登録できない" do
      @item.handing_time_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Handing time can't be blank")
    end

    it "priceが空では登録できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceは半角数字でないと出品できない" do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "priceが299円以下だと出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "priceが10000000円以上だと出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  end
end
