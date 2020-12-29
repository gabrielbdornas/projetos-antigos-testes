class User < ApplicationRecord

  has_one_attached :photo

  def photo_image_url
    if self.photo.attachment
      self.photo.attachment.service_url
    end
  end
end
