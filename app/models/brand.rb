class Brand < ActiveHash::Base
  self.data = [
    { id: 0, name: 'ブランド一覧' },
    { id: 1, name: 'Levis' },
    { id: 2, name: 'Lee' },
    { id: 3, name: 'EDWIN' },
    { id: 4, name: '桃太郎ジーンス' },
    { id: 5, name: 'JapanBuleJeans' },
    { id: 6, name: 'FULLCOUNT' },
    { id: 7, name: 'DENIME' },
    { id: 8, name: 'WAREHOUSE' },
    { id: 9, name: 'RRL' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
end