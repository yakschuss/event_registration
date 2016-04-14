//Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/



$(document).ready(function(){
 var form = document.getElementsByClassName('ticket-form')
  $('.ticket-form-add').off().on('click', function(){
    $('form').clone().appendTo('.ticket-type-group');

  });
})
