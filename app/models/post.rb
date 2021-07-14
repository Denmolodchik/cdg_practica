class Post < ActiveRecord::Base
    belongs_to :users
    has_many :likes
    has_many :comments
    include ImageUploader::Attachment(:image)
    validates :title, presence: true, length: { maximum: 100 }
    validates :image, presence: true
end