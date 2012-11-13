// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

function tag_add(id, name) {
  $('#tags').val($('#tags').val() + ',' + id);
  $('#used_tags').append('<a class="btn" id="tagged_"' + id + '">' + name + '</a>');
  $('#tag_' + id).hide();
}

function tag_drop(id, name) {
  $('#tags').val($('#tags').val() + ',' + id);
  $('#tag_' + id).show();
}

$(document).ready(function(){
  $("a[rel=popover]").popover();
  $(".tooltip").tooltip();
  $("a[rel=tooltip]").tooltip();
  $('.datepicker').datepicker();

  $('input[type=file]').change(function() {
    $('.prettyfile').val($(this).val());
  });

  $('#uses_facebook').change(function() { $('#settings_facebook').toggle('slow'); });
  $('#uses_twitter').change(function() { $('#settings_twitter').toggle('slow'); });
  $('#uses_ads').change(function() { $('#settings_ads').toggle('slow'); });
  $('#uses_ga').change(function() { $('#settings_ga').toggle('slow'); });


  $('.carousel').carousel({interval: 360000});

});
