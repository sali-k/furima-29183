require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.images.attach(fixture_file_upload('spec/test_image.png'))
    end

    it '必要事項が入力されていれば出品できる' do
      expect(@item).to be_valid
    end

    it 'imagesが空では登録できない' do
      @item.images = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('画像を入力してください')
    end

    it 'nameが空では登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('商品名を入力してください')
    end

    it 'nameが41文字以上だと出品できない' do
      @item.name = 'a' * 41
      @item.valid?
      expect(@item.errors.full_messages).to include('商品名は40文字以内で入力してください')
    end

    it 'descriptionが空では登録できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の説明を入力してください')
    end

    it 'descriptionが1001文字以上だと出品できない' do
      @item.description = 'a' * 1001
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の説明は1000文字以内で入力してください')
    end

    it 'category_idが0では登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
    end

    it 'condition_idが0では登録できない' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態を選択してください')
    end

    it 'postage_payer_idが0では登録できない' do
      @item.postage_payer_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
    end

    it 'prefecture_idが0では登録できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
    end

    it 'handing_time_idが0では登録できない' do
      @item.handing_time_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
    end

    it 'priceが空では登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('価格を入力してください')
    end

    it 'priceは半角数字でないと出品できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は数値で入力してください')
    end

    it 'priceが299円以下だと出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
    end

    it 'priceが10000000円以上だと出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
    end
  end
end
