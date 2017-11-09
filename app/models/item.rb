class Item < ApplicationRecord
  belongs_to :user
    include ImageUploader::Attachment.new(:image)

    def self.search(search)
      where("name ILIKE ? OR category ILIKE ?", "%#{search}%", "%#{search}%") 
    end
end
