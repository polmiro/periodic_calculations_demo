chartElemId = "#chart_placeholder"
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

initializeChart = (elemId) ->
  $.plot($(elemId), window.chartData, chartOptions)

$(document).ready ->
  initializeChart(chartElemId)

$(document).on 'pjax:send', ->
  $('#chart_loading').fadeIn()

$(document).on 'pjax:complete', ->
  $('#chart_loading').fadeOut()

$(document).on 'pjax:success', ->
  initializeChart(chartElemId)

$(document).on 'change', '#new_form', ->
  $(this).closest('form').submit()