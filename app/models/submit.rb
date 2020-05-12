class Submit < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :tags, dependent: :destroy
  # accepts_nested_attributes_for :tags, dependent: :destroy
  # accepts_nested_attributes_for :images, dependent: :destroy
  # accepts_nested_attributes_for :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user, dependent: :destroy
  after_validation :geocode

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Submit.where(['name LIKE ?', "%#{search}%"])
    else
      Submit.all #全て表示。
    end
  end

  private
   def geocode
     uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=AIzaSyDoht4ANB4eIveBmly94TbKNv4E6Ll61vw")
     res = HTTP.get(uri).to_s
     response = JSON.parse(res)
     self.latitude = response["results"][0]["geometry"]["location"]["lat"]
     self.longitude = response["results"][0]["geometry"]["location"]["lng"]
   end
end
