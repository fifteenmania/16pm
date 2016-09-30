class Seminar < ApplicationRecord
    has_many :photos, as: :imageable, dependent: :destroy
end
