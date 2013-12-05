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
end
