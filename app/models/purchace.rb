class Purchace < ApplicationRecord
  has_one :address
  belongs_to :user
  bwlongs_to :item
end
