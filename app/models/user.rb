class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments
  validates :first_name, :last_name, :about, :email, presence:true
  validates :email, uniqueness:true
  mount_uploader :avatar, AvatarUploader


  def full_name
    self.first_name + ' ' + self.last_name
  end
end
