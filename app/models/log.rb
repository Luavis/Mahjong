class Log < AbstractRecord

  enum wind_type: { east: 0, south: 1, west: 2, north: 3 }

  scope :from_this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }

  belongs_to :ranking, class_name: Ranking
  belongs_to :nickname, class_name: Nickname

  def self.in_time_range(range)
    where(created_at: range)
  end

end