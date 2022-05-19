class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  validates :image

  has_one_attached :image, content_type: {in: Settings.model.images_format,
                                          message: I18n.t(".invalid_format")},
                           size:  {less_than: Settings.image_size.megabytes,
                                  message: I18n.t(".invalid_size")}
end
