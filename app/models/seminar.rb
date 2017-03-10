class Seminar < ApplicationRecord
    has_many :photos, as: :imageable, dependent: :destroy
    mount_uploader :attachment, AttachmentUploader
    has_many :seminar_comments, dependent: :destroy
    belongs_to :user
end
