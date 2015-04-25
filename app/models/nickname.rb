class Nickname < AbstractRecord

  validates :nickname, presence: true
  validates :kml_id, numericality: { greater_than_or_equal_to: 0 }
  validates :standard_point, numericality: { greadter_than_or_equal_to: 0 }

  has_many :logs, class: Log
  has_many :rankings, class: Ranking, through: :logs

end
