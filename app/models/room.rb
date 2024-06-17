class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :facilityname, presence: true
  validates :facilityintroduction, presence: true
  validates :address, presence: true
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 1 }

  mount_uploader :facilitypic, FacilitypicUploader

  def self.search(keyword)
    where(["facilityname like? OR facilityintroduction like?", "%#{keyword}%", "%#{keyword}%"])
  end

  def self.search_by_area(keyword)
    where(["address like?", "%#{keyword}%"])
  end
end
