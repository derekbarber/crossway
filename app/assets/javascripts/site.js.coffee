# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  # Target your .container, .wrapper, .post, etc.
  $(".video-container").fitVids()
  return

#$(window).load ->
#  $("img.caption").captionjs
#    mode: "animated",
#    debug_mode: false
#  return
