class Customer < ApplicationRecord
  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    [ "email", "full_name", "id", "notes", "phone" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "image_attachment", "image_blob" ]
  end

  def image_thumbnail
    image.variant(resize_to_limit: [ 100, 100 ])
  end
end
