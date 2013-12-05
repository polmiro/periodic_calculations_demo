class DemoController < ApplicationController
  def index
    @form = CalculationForm.new(form_params)

    @data = Purchase
      .where("price > 0")
      .periodic_calculation(
        @form.operation.to_sym,
        @form.target_column,
        @form.start_time.to_time,
        @form.end_time.to_time,
        @form.options
      )

    render :chart if request.xhr?
  end

  private

  def form_params
    params[:form] ? params[:form].permit! : {}
  end
end
