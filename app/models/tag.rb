class Tag < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:name]
  has_many :post_tags
  has_many :post, through: :post_tags
  validates :name, presence:true
  validates :name, uniqueness:true


  def in_use?
    post_tag = PostTag.find_by(tag_id: self.id)
    post_tag.present?
  end

end
