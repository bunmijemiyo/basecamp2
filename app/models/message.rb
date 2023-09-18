class Message < ApplicationRecord
    belongs_to :discussion
    validates :comment, presence: true, length: {minimum: 2, maximum: 150}

end

