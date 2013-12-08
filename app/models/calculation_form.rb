class CalculationForm
  include Virtus.model

  attribute :operation, Symbol, default: :count
  attribute :interval_unit, Symbol
  attribute :target_column, String, default: :price
  attribute :timestamp_column, String
  attribute :start_time, Date, default: lambda { |form, attribute| 10.days.ago.to_date }
  attribute :end_time, Date, default: lambda { |form, attribute| 10.days.from_now.to_date }
  attribute :cumulative, Boolean

  def options
    opts = {
      :interval_unit => interval_unit,
      :cumulative => cumulative,
      :timestamp_column => timestamp_column
    }

    opts.reject do |key, value|
      value.blank?
    end
  end

  def display_options
    opts = options.dup

    opts.delete(:interval_unit) if opts[:interval_unit].to_s == 'day'
    opts.delete(:timestamp_column) if opts[:timestamp_column].to_s == 'created_at'
    opts.delete(:cumulative) unless opts[:cumulative]

    opts
  end
end