class ApplicationController < ActionController::API
  include Knock::Authenticable

  def transform_image(image, dimension)
    rails_representation_url(image.variant(resize_to_limit: [dimension, nil]), only_path: false)
  end
end
