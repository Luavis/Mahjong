class Nickname < AbstractRecord

  validates :nickname, presence: true
  validates :kml_id, numericality: { greater_than_or_equal_to: 0 }
  validates :standard_point, numericality: { greadter_than_or_equal_to: 0 }

  has_many :logs, class: Log
  has_many :rankings, class: Ranking, through: :logs

  def self.select_with_sum_point(cond = nil)
    
    cond_query = ""
    unless cond.nil? or cond.class != Range
      if (cond.first.class == Time or Date) and (cond.last.class == Time or Date)
        cond_query = "where #{Log.table_name}.created_at between '#{cond.first.to_s(:db)}' and '#{cond.last.to_s(:db)}'"
      end
    end

    self.select("#{self.table_name}.*, (mh_log.sum_point) as sum_point, (mh_log.log_count - (mh_log.half_log_count / 2.0)) as log_count")
            .joins("left join (select *, count(#{Log.table_name}.id) as log_count,
                    (select count(id) from #{Ranking.table_name} where #{Ranking.table_name}.is_half = 1 and #{Log.table_name}.ranking_id = id) as half_log_count,
                    case when ranking.is_half > 1 then (sum(point) + (2 - grade) * 10000) else (sum(point) + (2 - grade) * 5000) end
                    as sum_point from #{Log.table_name}
                    left join #{Ranking.table_name} as ranking on #{Log.table_name}.ranking_id = ranking.id
                    #{cond_query} group by nickname_id)
                    as mh_log on mh_log.nickname_id = #{self.table_name}.id").where('sum_point IS NOT NULL')
  end

  def as
  end
end
