class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :content, presence:true
  belongs_to :user
  has_many  :comments, dependent: :destroy
  has_many  :post_tags
  has_many  :tags ,through: :post_tags
  mount_uploader :thumbnail, ThumbnailUploader


end
