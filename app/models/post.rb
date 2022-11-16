class Post < ApplicationRecord
  mount_uploader :thumbnail, ThumbnailUploader
  extend FriendlyId
  include PgSearch::Model
  multisearchable against: [:title]
  friendly_id :title, use: :slugged
  validates :title,:intro, :content, presence:true
  validates :intro, length: { maximum: 120 }
  belongs_to :user
  has_many  :comments, dependent: :destroy
  has_many  :post_tags
  has_many  :tags ,through: :post_tags
end

