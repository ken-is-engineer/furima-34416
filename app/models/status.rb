class Status < ActiveHash::Base
  self.data = [
   { id: 1, name: '--選択してください--' },
   { id: 2, name: '新品未使用・未開封' },
   { id: 3, name: '中古（非常に良好）' },
   { id: 4, name: '中古（良好）' },
   { id: 5, name: '中古（やや傷あり）' },
   { id: 6, name: '中古（傷多し）' },
   { id: 7, name: 'ジャンク品' },
   { id: 8, name: '使用不可能' }
 ]

 include ActiveHash::Associations
 has_many :items

end