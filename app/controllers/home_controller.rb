class HomeController < ApplicationController
  def index
    start_time = 10.days.ago
    end_time = 10.days.from_now
    options = { :cumulative => true }

    @data = Purchase
      .where("price > 0")
      .periodic_sum(:price, start_time, end_time, options)
  end
end
