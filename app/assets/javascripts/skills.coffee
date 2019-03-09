# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener "turbolinks:load", () ->
  $(".progress_bar").each () ->
    progress_value = parseInt($(this).attr("value"))
    $(this).progressbar(
      "value": progress_value
    )
