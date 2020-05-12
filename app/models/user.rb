class User < ApplicationRecord

  has_many :submits, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :likes, dependent: :destroy
  belongs_to :avator
  has_many :liked_submits, through: :likes, source: :submit, dependent: :destroy

  has_many :avator_users, dependent: :destroy
  has_many :avators, through: :avator_users, dependent: :destroy

  # accepts_nested_attributes_for :avator_users,allow_destroy: true
  # accepts_nested_attributes_for :likes,allow_destroy: true

  def already_liked?(submit)
    self.likes.exists?(submit_id: submit.id)
  end

  def total_likes
    i = 0
    self.submits.each do |n|
      i += n.likes.count
    end
    i
  end

  #いいね総数に応じてアバターがデータベースに保存されるためのメソッド。
  def create_avator
    total = self.total_likes
    if total == 1 && !(AvatorUser.exists?(user: self.id,avator:4))
      AvatorUser.create(user: self, avator: Avator.find(4))
    elsif total == 2 && !(AvatorUser.exists?(user: self.id,avator:5))
      AvatorUser.create(user: self, avator: Avator.find(5))
    elsif total == 3 && !(AvatorUser.exists?(user: self.id,avator:6))
      AvatorUser.create(user: self, avator: Avator.find(6))
    elsif total == 4 && !(AvatorUser.exists?(user: self.id,avator:7))
      AvatorUser.create(user: self, avator: Avator.find(7))
    elsif total == 5 && !(AvatorUser.exists?(user: self.id,avator:8))
      AvatorUser.create(user: self, avator: Avator.find(8))
    elsif total == 7 && !(AvatorUser.exists?(user: self.id,avator:9))
      AvatorUser.create(user: self, avator: Avator.find(9))
    elsif total == 10 && !(AvatorUser.exists?(user: self.id,avator:10))
      AvatorUser.create(user: self, avator: Avator.find(10))
    elsif total == 13 && !(AvatorUser.exists?(user: self.id,avator:11))
      AvatorUser.create(user: self, avator: Avator.find(11))
    elsif total == 16 && !(AvatorUser.exists?(user: self.id,avator:12))
      AvatorUser.create(user: self, avator: Avator.find(12))
    elsif total == 20 && !(AvatorUser.exists?(user: self.id,avator:13))
      AvatorUser.create(user: self, avator: Avator.find(13))
    elsif total == 24 && !(AvatorUser.exists?(user: self.id,avator:14))
      AvatorUser.create(user: self, avator: Avator.find(14))
    elsif total == 30 && !(AvatorUser.exists?(user: self.id,avator:15))
      AvatorUser.create(user: self, avator: Avator.find(15))
    elsif total == 36 && !(AvatorUser.exists?(user: self.id,avator:16))
      AvatorUser.create(user: self, avator: Avator.find(16))
    elsif total == 42 && !(AvatorUser.exists?(user: self.id,avator:17))
      AvatorUser.create(user: self, avator: Avator.find(17))
    elsif total == 50 && !(AvatorUser.exists?(user: self.id,avator:18))
      AvatorUser.create(user: self, avator: Avator.find(18))
    elsif total == 58 && !(AvatorUser.exists?(user: self.id,avator:19))
      AvatorUser.create(user: self, avator: Avator.find(19))
    elsif total == 70 && !(AvatorUser.exists?(user: self.id,avator:20))
      AvatorUser.create(user: self, avator: Avator.find(20))
    elsif total == 82 && !(AvatorUser.exists?(user: self.id,avator:21))
      AvatorUser.create(user: self, avator: Avator.find(21))
    elsif total == 94 && !(AvatorUser.exists?(user: self.id,avator:22))
      AvatorUser.create(user: self, avator: Avator.find(22))
    elsif total == 106 && !(AvatorUser.exists?(user: self.id,avator:23))
      AvatorUser.create(user: self, avator: Avator.find(23))

    end
  end

  def self.find_for_oauth(auth)
      user = User.where(uid: auth.uid, provider: auth.provider).first

      unless user
        user = User.create(
          uid:      auth.uid,
          provider: auth.provider,
          email:    auth.info.email,
          name:  auth.info.name,
          password: Devise.friendly_token[0, 20],
          image:  auth.info.image
        )
      end

      user
    end

end
