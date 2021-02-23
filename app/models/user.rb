class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, {with: PASSWORD_REGEX, message: 'Include both letters and numbers'}

  validates :nickname, presence: true, uniqueness: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: 'Full-widh katakana characters' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :birthday, presence: true

  has_many :items
end
