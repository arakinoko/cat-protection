class Gender < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '♂オス' },
    { id: 2, name: '♀メス' },
    { id: 3, name: '不明' }
  ]

  include ActiveHash::Associations
  has_many :protections

  end