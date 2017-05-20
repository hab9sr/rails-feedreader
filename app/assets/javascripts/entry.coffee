# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  # highlight the "all" category link
  $("#category-filter li:first").addClass("active")

  # highlight each category link when clicked
  # (and un-highlight the others)
  $("#category-filter li").click ->
    $('#category-filter li').removeClass('active')
    $(this).addClass('active')
