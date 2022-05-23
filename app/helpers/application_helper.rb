module ApplicationHelper
  include Pagy::Frontend
  def full_title page_title
    base_title = t ".title"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def image_first room
    image_tag room.images.first&.display_image if room.images.first
  end
end
