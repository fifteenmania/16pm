class Seminar < ApplicationRecord
    has_many :photos, as: :imageable, dependent: :destroy
    mount_uploader :attachment, AttachmentUploader
end
