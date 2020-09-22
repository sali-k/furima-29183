require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '必須入力項目の内容が存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it 'emailに@が含まれていないと登録できない' do
      @user.email = 'kkk.gmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは@を含むアドレスを入力してください")
    end

    it '重複したemailが存在する場合は登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it 'passwordが空では登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'family_nameが空では登録できない' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字を入力してください")
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end

    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字カナを入力してください")
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名前カナを入力してください")
    end

    it 'passwordと確認passwordが一致していないと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'passwordが、英字と数字の両方を含めて6文字以上で登録できる' do
      @user.password = 'a12345'
      @user.password_confirmation = 'a12345'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it 'passwordが数字のみだと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて、6文字以上で設定してください")
    end

    it 'birth_dateが空では登録できない' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end

    it 'family_nameを半角で入力すると登録できない' do
      @user.family_name = 'ｱﾍﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字は全角で入力してください")
    end

    it 'first_nameを半角で入力すると登録できない' do
      @user.first_name = 'ｹｲｽｹ'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は全角で入力してください")
    end

    it 'family_name_kanaを半角で入力すると登録できない' do
      @user.family_name_kana = 'ｱﾍﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字カナは全角カナで入力してください")
    end

    it 'first_name_kanaを半角で入力すると登録できない' do
      @user.first_name_kana = 'ｹｲｽｹ'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前カナは全角カナで入力してください")
    end
  end
end
