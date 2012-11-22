# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('.notification_condition_select select').live 'change', (event) ->
    if $(this).val() == 'min_power'
      $(this).parents('.control-group').siblings('.notification_level').fadeIn(700)
    else
      $(this).parents('.control-group').siblings('.notification_level').fadeOut(700)


