class Protection < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :forster


  belongs_to :gender
  belongs_to :cat_species
  
  has_one_attached :image

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :image
    validates :title
    validates :age
    validates :gender_id
    validates :cat_species_id
    validates :character
  end

  #ジャンルの選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 0, message: "must be other than 0" } do
    validates :gender_id
    validates :cat_species_id 
  end
end
