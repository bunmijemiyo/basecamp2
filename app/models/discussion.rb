class Discussion < ApplicationRecord
    belongs_to :user
    has_many :messages, dependent: :destroy
    validates :discuss, presence: true, length: {minimum: 6, maximum: 300}

end