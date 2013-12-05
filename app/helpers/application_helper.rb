module ApplicationHelper
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
end
