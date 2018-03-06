class Post < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :title, presence: true # Make sure the owner's name is present.
  belongs_to :user, :optional => true
  has_many :likes
  has_many :comments, :dependent => :destroy
  self.per_page = 5
end
