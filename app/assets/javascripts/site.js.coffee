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

$(document).ready ->
  $("#creationBtn").click ->
    $("#creation").show()
    $("#fall").hide()
    $("#redemption").hide()
    $("#restoration").hide()
    $("#creationBtn").addClass "image-button-selected"
    $("#creationBtn").removeClass "image-button"
    $("#fallBtn").addClass "image-button"
    $("#fallBtn").removeClass "image-button-selected"
    $("#redemptionBtn").addClass "image-button"
    $("#redemptionBtn").removeClass "image-button-selected"
    $("#restorationBtn").addClass "image-button"
    $("#restorationBtn").removeClass "image-button-selected"

  $("#fallBtn").click ->
    $("#creation").hide()
    $("#fall").show()
    $("#redemption").hide()
    $("#restoration").hide()
    $("#creationBtn").addClass "image-button"
    $("#creationBtn").removeClass "image-button-selected"
    $("#fallBtn").addClass "image-button-selected"
    $("#fallBtn").removeClass "image-button"
    $("#redemptionBtn").addClass "image-button"
    $("#redemptionBtn").removeClass "image-button-selected"
    $("#restorationBtn").addClass "image-button"
    $("#restorationBtn").removeClass "image-button-selected"

  $("#redemptionBtn").click ->
    $("#creation").hide()
    $("#fall").hide()
    $("#redemption").show()
    $("#restoration").hide()
    $("#creationBtn").addClass "image-button"
    $("#creationBtn").removeClass "image-button-selected"
    $("#fallBtn").addClass "image-button"
    $("#fallBtn").removeClass "image-button-selected"
    $("#redemptionBtn").addClass "image-button-selected"
    $("#redemptionBtn").removeClass "image-button"
    $("#restorationBtn").addClass "image-button"
    $("#restorationBtn").removeClass "image-button-selected"

  $("#restorationBtn").click ->
    $("#creation").hide()
    $("#fall").hide()
    $("#redemption").hide()
    $("#restoration").show()
    $("#creationBtn").addClass "image-button"
    $("#creationBtn").removeClass "image-button-selected"
    $("#fallBtn").addClass "image-button"
    $("#fallBtn").removeClass "image-button-selected"
    $("#redemptionBtn").addClass "image-button"
    $("#redemptionBtn").removeClass "image-button-selected"
    $("#restorationBtn").addClass "image-button-selected"
    $("#restorationBtn").removeClass "image-button"
