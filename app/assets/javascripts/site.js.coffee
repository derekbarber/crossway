# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  # Target your .container, .wrapper, .post, etc.
  $(".video-container").fitVids()

  #Homepage Slider
  options =
    nextButton: false
    prevButton: false
    pagination: true
    animateStartingFrameIn: true
    autoPlay: true
    autoPlayDelay: 3000
    preloader: true

  mySequence = $("#sequence").sequence(options).data("sequence")

  return

#$(window).load ->
#  $("img.caption").captionjs
#    mode: "animated",
#    debug_mode: false
#  return
