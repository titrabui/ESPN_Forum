class User < ApplicationRecord
  has_many :messages
  has_many :comments

  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :remember_me, :avatar, :avatar_cache, :remove_avatar

  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  private

  def avatar_size_validation
    errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  end
end
