//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require moment
//= require moment/zh-cn
//= require bootstrap-datetimepicker
//= require unobtrusive_flash
//= require unobtrusive_flash_ui
//= require_tree ./admin

UnobtrusiveFlash.flashOptions['timeout'] = 4000; // milliseconds

$( document ).on('turbolinks:load', function() {
  /* enable datetimepicker */
  $('.date-time-picker').datetimepicker({format: 'YYYY-MM-DD hh:mm'});
  $('.date-picker').datetimepicker({format: 'YYYY-MM-DD'});
})
