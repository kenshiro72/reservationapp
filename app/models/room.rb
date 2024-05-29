class Room < ApplicationRecord
  mount_uploader :facilitypic, FacilitypicUploader
  def self.search(keyword)
    where(["facilityname like? OR facilityintroduction like?", "%#{keyword}%", "%#{keyword}%"])
  end

  def self.search_by_area(keyword)
    where(["address like?", "%#{keyword}%"])
  end
end
