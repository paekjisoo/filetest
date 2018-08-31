class Post < ApplicationRecord
	mount_uploader :attachment, AttachmentUploader
	validates :writer, presence: true
end
