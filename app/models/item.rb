class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :handling_time

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price,  format: {with: /\A[0-9]+\z/}, numericality: { only_integer: true,greater_than: 300, less_than: 10000000}
    validates :image
  end
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :postage_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :handling_time_id, numericality: { other_than: 1 }

end
