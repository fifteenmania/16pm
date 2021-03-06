class Post < ApplicationRecord
    has_many :photos, as: :imageable, dependent: :destroy
    has_many :comments, dependent: :destroy
    belongs_to :user
end
