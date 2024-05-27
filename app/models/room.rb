class Room < ApplicationRecord
  mount_uploader :facilitypic, FacilitypicUploader
  def self.search(keyword)
    where(["facilityname like? OR facilityintroduction like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
