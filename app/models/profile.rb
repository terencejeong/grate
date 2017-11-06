class Profile < ApplicationRecord
  belongs_to :user
  has_many :reviews
   include ImageUploader::Attachment.new(:avatar)
end
