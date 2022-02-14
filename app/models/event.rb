class Event < ApplicationRecord

    has_many :users
    has_many :categories

    validates :name, :description, :event_date, presence: true

end
