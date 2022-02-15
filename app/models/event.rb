class Event < ApplicationRecord

    has_many :users
    belongs_to :category
    has_many :comments
    validates :name, :description, :event_date, presence: true

end
