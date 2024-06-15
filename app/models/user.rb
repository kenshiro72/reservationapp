class User < ApplicationRecord
  mount_uploader :profilepic, ProfilepicUploader
  has_many :rooms
  has_many :reservations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name,                presence: true,
            length: { maximum: 50 }

  validates :email,               presence: true,
            uniqueness: true

  validates :password,            presence: true
end
