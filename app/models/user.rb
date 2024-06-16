class User < ApplicationRecord
  mount_uploader :profilepic, ProfilepicUploader
  has_many :rooms
  has_many :reservations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  with_options on: :account_registration do
    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :password, confirmation: true
  end
  # validates :name, :email, :password, :password_confirmation, presence: { message: 'を入力して下さい。' }
end
