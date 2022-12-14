module AplicationHelper
  include Rails.application.routes.url_helpers
  WATERMARK_IMAGE = Pathname.new(Rails.root.join('lib', 'assets', 'images', 'logo.png'))

  def transform_image(image, dimension)
    rails_representation_url(image.variant(resize_to_limit: [dimension, nil], composite:[WATERMARK_IMAGE, over: {x:0, y:0, premultiplied: false}]), only_path: false)
  end
end