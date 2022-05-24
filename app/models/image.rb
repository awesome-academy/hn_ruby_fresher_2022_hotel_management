class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  validates :image,
            content_type: {in: Settings.models.images_format,
                           message: I18n.t(".invalid_format")},
            size: {less_than: Settings.models.image_size.megabytes,
                   message: I18n.t(".invalid_size")}

  has_one_attached :image

  def display_image
    image.variant resize_to_limit: Settings.models.room
  end
end
