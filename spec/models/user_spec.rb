require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Password can't be blank")
      end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
  another_user = FactoryBot.build(:user)
  another_user.email = @user.email
  another_user.valid?
  expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
  @user.valid?
  expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
  @user.password_confirmation = '00000'
  @user.valid?
  expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
  @user.password_confirmation = @user.password
  @user.valid?
  expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end

    it 'passwordが英字のみの場合登録できない' do
      @user.password = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが数字のみの場合登録できない' do
      @user.password = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordに全角文字が含む場合登録できない' do
      @user.password = 'PASSWORD'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'last_nameが空の場合登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'last_nameが半角文字が含まれている場合登録できない' do
      @user.last_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'first_nameが空の場合登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'first_nameが半角文字が含まれている場合登録できない' do
      @user.first_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'last_name_kanaが空の場合登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'last_name_kanaがカタカナ以外の文字が含まれている場合登録できない' do
      @user.last_name_kana = 'カタカナ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'first_name_kanaが空の場合登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'first_name_kanaがカタカナ以外の文字が含まれている場合登録できない' do
      @user.first_name_kana = 'カタカナ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'user_birth_dateが空の場合登録できない' do
      @user.user_birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
  end
end
end