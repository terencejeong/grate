class Profile < ApplicationRecord


  belongs_to :user
  has_many :reviews
   include ImageUploader::Attachment.new(:avatar)

     geocoded_by :address

     after_validation :geocode
end
