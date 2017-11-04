class Item < ApplicationRecord
  belongs_to :user
    include ImageUploader::Attachment.new(:image)
end
