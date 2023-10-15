require 'rails_helper'

RSpec.describe Protection, type: :model do
  before do
    @protection = FactoryBot.build(:protection)
  end

  describe '商品情報の保存' do
    context '保護猫情報が保存できる場合' do
      it 'すべての入力事項が存在すれば保存される' do
        expect(@protection).to be_valid
      end
    end
    context '保護猫情報が保存できない場合' do
      it '商品画像がないと保存できない' do
        @protection.image = nil
        @protection.valid?
        expect(@protection.errors.full_messages).to include("Image can't be blank")
      end
      it '猫の特徴が空欄だと公開できない' do
        @protection.title = ''
        @protection.valid?
        expect(@protection.errors.full_messages).to include("Title can't be blank")
      end
      it '年齢（推定）が空欄だと公開できない' do
        @protection.age = ''
        @protection.valid?
        expect(@protection.errors.full_messages).to include("Age can't be blank")
      end
      it '性別が「---」だと公開できない' do
        @protection.gender_id = 0
        @protection.valid?
        expect(@protection.errors.full_messages).to include('Gender must be other than 0')
      end
      it '種類の状態が「---」だと公開できない' do
        @protection.cat_species_id = 0
        @protection.valid?
        expect(@protection.errors.full_messages).to include('Cat species must be other than 0')
      end
      it '性格が空欄だと公開できない' do
        @protection.character = ''
        @protection.valid?
        expect(@protection.errors.full_messages).to include("Character can't be blank")
      end
      it 'ユーザー登録している人でないと出品できない' do
        @protection.user = nil
        @protection.valid?
        expect(@protection.errors.full_messages).to include('User must exist')
      end
    end
  end
end
