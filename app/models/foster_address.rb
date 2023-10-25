class FosterAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building_name, :phone_number, :user_id, :protection_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)', allow_blank: true }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid', allow_blank: true }
    validates :user_id
    validates :protection_id
  end

  def save
    foster = Foster.create(user_id: user_id, protection_id: protection_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block,
                  building_name: building_name, phone_number: phone_number, foster_id: foster.id)
  end
end