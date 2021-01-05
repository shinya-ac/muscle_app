class Category < ApplicationRecord
    has_many :memos #dependent問題をどうするか考える。→メモが削除されたらカテゴリーも削除される？ん？それはそれでまずくない？ちょっと考えてみる。
    validates :name, presence:true, length: { maximum: 20 }, uniqueness: true
end
