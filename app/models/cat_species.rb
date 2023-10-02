class CatSpecies < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '雑種' },
    { id: 2, name: 'アメリカンショートヘア' },
    { id: 3, name: 'エキゾチックショートヘア' },
    { id: 4, name: 'サイベリアン' },
    { id: 5, name: 'シャム' },
    { id: 6, name: 'スコティッシュフォールド' },
    { id: 7, name: 'ノルウェージャンフォレストキャット' },
    { id: 8, name: 'ブリティッシュショートヘア' },
    { id: 9, name: 'ペルシャ' },
    { id: 10, name: 'ベンガル' },
    { id: 11, name: 'マンチカン' },
    { id: 12, name: 'ミヌエット' },
    { id: 13, name: 'メインクーン' },
    { id: 14, name: 'ラグドール' }, 
    { id: 15, name: 'ロシアンブルー' },
    { id: 16, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :protections

  end