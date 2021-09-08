class Item < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  belongs_to :label
  has_many :discs, dependent: :destroy
  attachment :image
  has_many :cart_items
end
