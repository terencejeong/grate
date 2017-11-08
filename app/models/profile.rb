class Profile < ApplicationRecord


  belongs_to :user
  has_many :reviews
   include ImageUploader::Attachment.new(:avatar)

  geocoded_by :address
  has_many :reviews


  after_validation :geocode
end
