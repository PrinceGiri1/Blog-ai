class Comment < ApplicationRecord
  belongs_to :post
  has_many :notifications, as: :notifiable
  after_create :notify

  def notify
    self.notifications.create
  end
end
