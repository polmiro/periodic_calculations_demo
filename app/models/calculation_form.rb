class CalculationForm
  include Virtus.model
  include ActiveModel::Conversion
  extend ActiveModel::Naming

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
end