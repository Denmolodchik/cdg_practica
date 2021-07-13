class Post < ActiveRecord::Base
    has_many :comments
    include ImageUploader::Attachment(:image)
    validates :title, presence: true, length: { maximum: 100 }
    validates :image, presence: true
end