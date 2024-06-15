class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :people_number, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validate :check_out_date_cannot_be_before_check_in_date
  validate :check_in_date_cannot_be_today


  def check_out_date_cannot_be_before_check_in_date
    if !check_out_date.nil? && !check_in_date.nil? && check_out_date < check_in_date
      errors.add(:check_out_date, 'はチェックイン日以降の日付で選択してください。')
    end
  end

  def check_in_date_cannot_be_today
    if !check_in_date.nil? && check_in_date < Date.today
      errors.add(:check_in_date, 'は本日以降の日付で選択してください。')
    end
  end
end
