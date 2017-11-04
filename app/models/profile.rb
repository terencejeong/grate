class Profile < ApplicationRecord
  belongs_to :user
   include ImageUploader::Attachment.new(:avatar)
end
