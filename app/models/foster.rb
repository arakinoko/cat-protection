class Foster < ApplicationRecord
  has_many :foster_protections
  has_many :protections, through: :foster_protections
  belongs_to :user
  has_one :address
end
