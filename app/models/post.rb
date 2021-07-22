class Post < ActiveRecord::Base
    include ImageUploader::Attachment(:image)
    belongs_to :user
    has_many :likes
    has_many :comments
    validates :title, presence: true, length: { maximum: 100 }
    validates :image, presence: true
end