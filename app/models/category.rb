class Category < ApplicationRecord
  belongs_to :user

  enum category: [:music, :visual_arts, :film, :fashion]

end
