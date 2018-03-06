class Invite < ActiveRecord::Base
    belongs_to :user
    belongs_to :event
    
    validates :user_id, uniqueness: { scope: :event_id, message: "has already been invited to this event." }
    validates :user_id, presence: true
    validates :event_id, presence: true
end
