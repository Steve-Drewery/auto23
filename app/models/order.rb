class Order < ApplicationRecord
  # Each order needs a listing in order to exist.
  # Furthermore, in order for each individual to pay or recieve payment, the order needs a buyer and seller id.
  belongs_to :listing
  belongs_to :buyer, foreign_key: "buyer_id", class_name: "User"
  belongs_to :seller, foreign_key: "seller_id", class_name: "User"
end
