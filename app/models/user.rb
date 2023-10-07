class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :protections
  has_many :forsters

  with_options presence: true do
  validates :nickname
  validates :last_name,
             format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.', allow_blank: true }
  validates :first_name,
            format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.', allow_blank: true }
  validates :last_name_kana,
            format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.', allow_blank: true }
  validates :first_name_kana,
            format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.', allow_blank: true }
  validates :birth_date
  end
end
