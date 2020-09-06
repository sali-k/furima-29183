require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password には英字と数字の両方を含めて,6文字以上で設定してください")
    end
  
    it 'emailが空だと登録できない' do
    end

    it 'passwordが空だと登録できない' do
    end

    it 'family_nameが空だと登録できない' do
    end

    it 'first_nameが空だと登録できない' do
    end

    it 'family_name_kanaが空だと登録できない' do
    end

    it 'first_name_kanaが空だと登録できない' do
    end

    # it 'passwordと確認passwordが一致していないと登録できない' do
    #end

    it 'passwordが6文字以上で登録できる' do
    end

    it 'passwordが6文字未満だと登録できない' do
    end
  end

  describe '苗字名前に関する制約（半角）' do
    it "family_nameを半角で入力した時登録できない" do
    end

    it "first_nameを半角で入力した時登録できない" do
    end
  end

  describe '苗字名前カナに関する制約（半角）' do
    it "family_name_kanaを半角で入力した時登録できない" do
    end

    it "first_name_kanaを半角で入力した時登録できない" do
    end
  end
end
