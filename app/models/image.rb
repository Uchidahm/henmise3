class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :submit

  def self.create_images_by(image_params,submit)
  return false if image_params[:image].nil?

  Image.transaction do


    image_params[:image].each do |image|
      new_image = Image.new( image: image,submit_id: submit.id)
      return false unless new_image.save!
    end
  end

    true
  end
end
