class Category < ActiveHash::Base
  self.data = [
   { id: 1, name: '--選択してください--' },
   { id: 2, name: '衣類' },
   { id: 3, name: '家具' },
   { id: 4, name: '雑貨' },
   { id: 5, name: 'ゲーム機・PC機器類' },
   { id: 6, name: '食料品' },
   { id: 7, name: 'スポーツ用品' },
   { id: 8, name: 'キッチン用品' },
   { id: 9, name: 'レジャー用品' },
   { id: 10, name: '芸術作品' },
   { id: 11, name: 'その他' }
 ]

 include ActiveHash::Associations
 has_many :items

end