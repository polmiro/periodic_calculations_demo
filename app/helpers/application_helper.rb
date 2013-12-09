module ApplicationHelper
  BASE_TIME = Time.at(1386562437)

  def plot_series(data, opts={})
    data = data.inject({}) do |h,(k,v)|
      # Parse date from utc into current time zone
      h[k.to_i] = v
      h
    end

    "[" + data.map do |time, v|
      [time, v]
    end.sort.map {|p| "[#{p[0] * 1000}, #{p[1]}]" }.join(", ") + "]"
  end

  def menu_class(label)
    active = case label
    when 'demo'
      controller_name == 'demo'
    when 'data'
      controller_name == 'purchases'
    end

    active ? 'active' : ''
  end

  def map_calculation_name(name)
    case name
    when :max
      :maximum
    when :min
      :minimum
    when :avg
      :average
    when :count
      :count
    when :sum
      :sum
    end
  end

  def examples
    # hard-code dates
    [
      ["Number of purchases per day during the month of november 2013", root_path(:form => { :operation => :count, :start_time => BASE_TIME - 1.month, :end_time => BASE_TIME})],
      ["Number of purchases acumulated per week during the month of november 2013", root_path(:form => { :operation => :count, :interval_unit => :week, :start_time => BASE_TIME - 1.month, :end_time => BASE_TIME, :cumulative => true})],
      ["Average spent per purchase per week during the last three months", root_path(:form => { :operation => :avg, :start_time => BASE_TIME - 3.months, :end_time => BASE_TIME})],
      ["Total amount spent in purchases acummulated over time in intervals of month last year", root_path(:form => { :operation => :sum, :interval_unit => :month, :start_time => BASE_TIME - 1.year, :end_time => BASE_TIME, :cumulative => true})],
      ["Minimum discount per purchase each day during the past week", root_path(:form => { :operation => :min, :target_column => :discount, :interval_unit => :day, :start_time => BASE_TIME - 1.week, :end_time => BASE_TIME })]
    ]

  end
end
