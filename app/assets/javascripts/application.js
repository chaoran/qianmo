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
//= require jquery.form
//= require jquery.remotipart
//= require jquery.Jcrop
//= require twitter/bootstrap
//= require cocoon
//= require private_pub
//= require rails.validations
//= require redactor-rails
//= require_tree .

$(document).ready(function(){
  $(".has_hidden_buttons").live({
    mouseenter: function() {
      $(this).find("hidden_button").removeClass("hidden");
    },
    mouseleave: function() {
      $(this).find("hidden_button").addClass("hidden");
    }
  });
  
  $(".hoverable").live({
    mouseenter: function() {
      $(this).addClass("hover");
      $(this).find(".show-on-hover").removeClass('invisible')
    },
    mouseleave: function() {
      $(this).removeClass("hover");
      $(this).find(".show-on-hover").addClass("invisible")
    }
  })
  
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
  
  $(".flip-on-hover").live({
    mouseenter: function() {
      $(this).addClass("hidden").next().removeClass("hidden");
    },
    mouseleave: function() {
      $(this).addClass("hidden").prev().removeClass("hidden");
    }
  });
  
  $(".flipdown-on-click").live("click", function() {
    $(this).hide().next().show();
  });
  
  $(".flipup-on-click").live("click", function() {
    $(this).hide().prev().show();
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


  