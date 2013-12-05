$(document).on 'change', '#new_calculation_form', ->
  $(this).closest('form').submit()

$(document).ready ->
  chartElem = $("#chartPlaceholder")

  if chartElem.size() > 0
    chartOptions =
      yaxis:
        min: 0,
        tickDecimals: 0
      xaxis:
        mode: "time",
      series:
        lines:
          show: true
        points:
          show: true
      colors: ["#00689e"]
      grid:
        borderWidth: 1
        borderColor: "#e3e3e3"
        backgroundColor: "#fff"
        hoverable: true
        mouseActiveRadius: 50

    $.plot(chartElem, window.chartData, chartOptions)