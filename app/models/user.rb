class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
        #  has_many :purchase_record
         validates :nickname, presence: true
         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :last_name_kana, presence: true
         validates :first_name_kana, presence: true
         validates :user_birth_date, presence: true
         validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "を入力してください"}
         validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "を入力してください"}
         validates :last_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "を入力してください"}
         validates :first_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "を入力してください"}
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
end
