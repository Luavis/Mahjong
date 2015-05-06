class RecordController < ApplicationController

  def get_range(_year, _month=nil, _day=nil)
    today = Date.today

    year = today.year
    month = today.month
    day = today.day

    if _year.present?
      temp_year = _year.to_i
      if temp_year < 0
        not_found
      else
        year = temp_year
      end
    end

    if _month.present?
      temp_month = _month.to_i
      if temp_month < 1 or temp_month > 12
        not_found
      else
        month = temp_month
      end
    end

    if _day.present?
      temp_day = _day.to_i
      if temp_day < 1 or temp_day > Date.civil(year, month, -1)
          not_found
      else
        year = temp_day
      end
    end

    if Date.civil(year, month, day) > today
      not_found
    end

    if _year.present? and _month.nil? and _day.nil?
      return Time.new(year)..Time.new(year).end_of_year
    elsif _year.present? and _month.present? and _day.nil?
      return Time.new(year, month)..Time.new(year, month).end_of_month
    elsif _year.present? and _month.present? and _day.present?
      return Time.new(year, month, day)..Time.new(year, month, day).end_of_day
    else
      return nil
    end
  end

  def create_record(range)
    ret = Nickname.select_with_sum_point(range).order('sum_point desc').all
    if ret.length == 0
      not_found
    end

    return ret
  end

  def year
    @range = get_range(params[:year])
    @record = create_record(@range)

    render 'record'
  end

  def quater
    quater = params[:quater].to_i
    start_month = 1
    end_month = 4

    if quater < 1 or quater > 4
      not_found
    end

    start_month = (quater - 1) * 3 + 1

    range = get_range(params[:year], start_month)
    range = range.begin..(range.last + 3.month)

    @range = range
    @record = create_record(@range)

    render 'record'
  end

  def month
    @range = get_range(params[:year], params[:month])
    @record = create_record(@range)

    render 'record'
  end

  def day
    @range = get_range(params[:year], params[:month], params[:day])
    @record = create_record(@range)

    render 'record'
  end

end
