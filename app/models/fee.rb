class Fee < ActiveHash::Base
  self.data = [
   { id: 1, name: '--選択してください--' },
   { id: 2, name: '出品者負担（送料込み）' },
   { id: 3, name: '購入者負担（着払い）' }
  ]

 include ActiveHash::Associations
 has_many :items

end