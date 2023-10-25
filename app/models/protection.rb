class Protection < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :foster_protections
  has_many :fosters, through: :foster_protections
  belongs_to :user

  belongs_to :prefecture
  belongs_to :gender
  belongs_to :cat_species
  
  has_one_attached :image

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :image
    validates :title
    validates :prefecture_id
    validates :age
    validates :gender_id
    validates :cat_species_id
    validates :character
  end

  #ジャンルの選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 0, message: "must be other than 0" } do
    validates :prefecture_id
    validates :gender_id
    validates :cat_species_id 
  end
end
