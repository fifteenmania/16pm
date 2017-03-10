class SeminarComment < ApplicationRecord
    belongs_to :seminar
    belongs_to :user
end
