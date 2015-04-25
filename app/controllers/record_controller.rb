class RecordController < ApplicationController

  def month
    @month_record = Nickname.select_with_sum_point(Time.now.beginning_of_month..Time.now.end_of_month).order('sum_point desc').all
  end

end
