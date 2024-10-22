class Customer < ApplicationRecord
  has_one_attached :image

  validates :full_name, presence: { message: 'Full name is required' }
  validates :notes, length: { maximum: 200, too_long: 'Notes cannot exceed 200 characters' }

  scope :search, -> (query) { where("lower(full_name) LIKE ?", "%#{query.downcase}%") }

  def image_thumbnail
    image.variant(resize_to_limit: [100, 100])
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[email full_name id notes phone]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[image_attachment image_blob]
  end
end
