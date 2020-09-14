require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '商品購入機能' do
    before do
      @Purchase = FactoryBot.build(:purchase)
      #@item.image = fixture_file_upload('spec/test_image.png')
    end

    it "必要事項が入力されていれば購入できる" do
      #expect(@purchase).to be_valid
    end

    it "tokenが空では登録できない" do
    end

    it "post_codeが空では登録できない" do
    end

    it "post_codeに「-」が含まれていないと登録できない" do
    end

    it "post_codeが8文字以上だと登録できない" do
    end

    it "prefectures_idが空では登録できない" do
    end

    it "cityが空では登録できない" do
    end

    it "home_numberが空では登録できない" do
    end

    it "phone_numberが空では登録できない" do
    end

    it "phone_numberに「-」が含まれていると登録できない" do
    end

    it "phone_numberが12以上だと登録できない" do
    end
  end
end
