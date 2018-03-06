class Event < ActiveRecord::Base
    belongs_to :user
    has_many :invites
    validates :title, presence: true
    validates :location, presence: true
    validates :title, uniqueness: true
end
