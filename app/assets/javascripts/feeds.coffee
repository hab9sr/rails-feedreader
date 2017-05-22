# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  if (window.location.pathname != "/feeds/new")
    return

  $("#feed_category_id").change ->
    category = $("#feed_category_id option:selected").text()
    if (category == "Twitter")
      $("#feed_url_label").text("Twitter handle")
    else
      $("#feed_url_label").text("URL")
