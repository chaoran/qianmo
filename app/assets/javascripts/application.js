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
//= require jquery_ujs
//= require jquery.effects.highlight
//= require jquery.form
//= require jquery.remotipart
//= require jquery.Jcrop
//= require twitter/bootstrap
//= require cocoon
//= require private_pub
//= require rails.validations
//= require redactor-rails
//= require jquery.galleriffic
//= require jquery.history
//= require jquery.opacityrollover
//= require_tree .

$(document).ready(function(){
  /* PLUGIN: hoverable */
  $(".hoverable").live({
    mouseenter: function() {
      $(this).addClass("hover");
    },
    mouseleave: function() {
      $(this).removeClass("hover");
    }
  });
  
  /* PLUGIN: expandable */
  $(".expandable .action-expand").live("click", function(e){
    $(this).closest(".expandable").addClass("expanded");
    e.preventDefault();
  });
  
  $(".expandable .action-collapse").live("click", function(e){
    $(this).closest(".expandable").removeClass("expanded");
    e.preventDefault();
  });
  
  /* PLUGIN: flippable */
  $(".flippable .on-click").live("click", function(e) {
    var flippable = $(this).closest(".flippable")
    if (flippable.hasClass("flipped")) {
      flippable.removeClass("flipped")
    } else {
      flippable.addClass("flipped")
    }
    e.preventDefault()
  });
  
  $(".flippable .on-hover").live({
    mouseenter: function() {
      $(this).closest(".flippable").addClass("flipped");
    },
    mouseleave: function() {
      $(this).closest(".flippable").removeClass("flipped");
    }
  });
  
  $(".removable").live({
    mouseenter: function() {
      $(this).find(".remove").removeClass("invisible");
    },
    mouseleave: function() {
      $(this).find(".remove").addClass("invisible");
    }
  });
  
  $(".hover_button").live({
    mouseenter: function() {
      $(this).children().first().hide().next().show();
    },
    mouseleave: function() {
      $(this).children().first().show().next().hide();
    }
  });


  // Make client side validations use the same style as Twitter Bootstrap, http://bit.ly/Q6dHeD
  ClientSideValidations.formBuilders['SimpleForm::FormBuilder'] = {
    add: function(element, settings, message) {
      if (element.data('valid') !== false) {
        var wrapper = element.closest(settings.wrapper_tag);
        wrapper.parent().addClass(settings.wrapper_error_class);
        var errorElement = $('<' + settings.error_tag + ' class="' + settings.error_class + '">' + message + '</' + settings.error_tag + '>');
        wrapper.append(errorElement);
      } else {
        element.parent().find(settings.error_tag + '.' + settings.error_class).text(message);
      }
    },
    remove: function(element, settings) {
      var wrapper = element.closest(settings.wrapper_tag + '.' + settings.wrapper_error_class);
      wrapper.removeClass(settings.wrapper_error_class);
      var errorElement = wrapper.find(settings.error_tag + '.' + settings.error_class);
      errorElement.remove();
    }
  };
});


  