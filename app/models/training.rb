class Training < ApplicationRecord
    with_options presence: true do
        validates :training_title
        validates :training_time
        validates :training_text
    end

    belongs_to :user
    has_many :comments
end
