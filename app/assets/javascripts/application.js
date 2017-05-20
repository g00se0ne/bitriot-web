// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $('.burger-menu').click(function(){
    if ($(this).hasClass('active')) {
      $(this).removeClass('active');
      $('body').removeClass('nav-open');
    } else {
      $(this).addClass('active');
      $('body').addClass('nav-open');
    }
  });

  $(window).resize(function(){
    $('.burger-menu').removeClass('active');
    $('body').removeClass('nav-open');
  });

  setTimeout(function() {
    $('#flash').hide('slow');
  }, 5000);

  $('.quotes').slick({
    autoplay: true,
    arrows: true,
    autoplaySpeed: 6000
  });

  $('.custom-selector').on('click', 'li', function(){
    if ($(this).hasClass('selected')) {
      $(this).removeClass('selected');
    } else {
      $(this).addClass('selected');
    }

    if ($(this).parents('.custom-selector').hasClass('single')) {
      $(this).siblings().removeClass('selected');
    }

    var values = $(this).parents('ul').find('li.selected').map(function(id, elem){
      return $(elem).text();
    }).get();

    // alert($($(this).attr('rel')));

    $($(this).parents('.custom-selector').attr('rel')).val(values);
  });
});
