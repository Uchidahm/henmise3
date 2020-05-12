class Avator < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :avator_users, dependent: :destroy
  has_one :user, dependent: :destroy
  # accepts_nested_attributes_for :avator_users, dependent: :destroy
  has_many :users, through: :avator_users, dependent: :destroy
end
