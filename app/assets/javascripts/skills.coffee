# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
draw_progressbar = (progressbar_div) ->
  value = parseInt($(progressbar_div).attr "value")
  $(progressbar_div).progressbar { value }

document.addEventListener "turbolinks:load", () ->
  draw_progressbar progressbar_div for progressbar_div in $(".progress_bar")
