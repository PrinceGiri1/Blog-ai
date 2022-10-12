class Message < ApplicationRecord
  has_many :notifications, as: :notifiable

  after_create :notify

  def notify
    self.notifications.create
  end
end
