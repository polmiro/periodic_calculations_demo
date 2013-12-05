class HomeController < ApplicationController
  def index
    @form = CalculationForm.new(form_params)

    @data = Purchase
      .where("price > 0")
      .periodic_calculation(
        @form.operation.to_sym,
        @form.target_column,
        @form.start_time,
        @form.end_time,
        @form.options
      )
  end

  private

  def form_params
    params[:calculation_form] ? params[:calculation_form].permit! : {}
  end
end
