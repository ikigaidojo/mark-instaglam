class Post < ApplicationRecord
  belongs_to :member, optional: true #optional true even means if there's no association it will save the record
  validates :caption, :presence => true

  attachment :posted_image
end
