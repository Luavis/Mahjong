class Ranking < AbstractRecord

  enum is_half: { east: 1, half: 2, whole: 3 }

  scope :from_this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }

  has_many :logs, class_name: Log, foreign_key: "ranking_id"

  has_one :log_1, class_name: Log

  has_one :log_2, class_name: Log

  has_one :log_3, class_name: Log

  has_one :log_4, class_name: Log

end
