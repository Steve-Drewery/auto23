class Listing < ApplicationRecord
  # A listing needs a user to create it in order for it to exist. Each listing created also has a category, description, condition and picture related to each specific listing.
  belongs_to :user
  belongs_to :category
  has_rich_text :description
  has_one_attached :picture
  has_many :comments
  validates :title, :description, :condition, :price, :picture, presence: true

  enum condition: {
    needs_rebuilding: 1,
    a_bit_hows_it_going: 2,
    used: 3,
    brand_new: 4
  }
end
