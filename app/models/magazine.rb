class Magazine < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  belongs_to :user
  has_many :order_items

  default_scope { where(active: true) }
end
