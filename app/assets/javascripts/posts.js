jQuery(document).ready(function($) {
  function has_value(input) {
    var value = $.trim(input.val());
    if (value.length != 0) {
      if (input.attr('placeholder') == undefined || value != input.attr('placeholder')) {
        return true;
      }
    }
    return false;
  }
  
  $(".post-input").live("focus", function () {
      $(this).attr('rows', '4');
      var value = $.trim($(this).val());
      var form = $(this).closest("form");
      
      if (has_value($(this))) {
        buttonValid(form.find("input[type='submit']"));
      } else {
        if ($(this).attr('placeholder') != undefined) {
          $(this).val($(this).attr('placeholder') + ' ');
        }
      }
      form.find(".post-wordcount").text($(this).val().length);
      form.find(".post-actions").show();
      form.find(".post-header em").show();
  });
  
  function buttonInvalid(button) {
    button.attr("disabled", "disabled");
    button.removeClass("btn-primary");
  }
  
  function buttonValid(button) {
    button.removeAttr("disabled");
    button.addClass("btn-primary");
  }
  
  $(".post-input").live("keyup", function (){
    var value = $.trim($(this).val());
    var form = $(this).closest("form");
    form.find(".post-wordcount").text(value.length);
    
    if (has_value($(this))) {
      if (value.length > 140) {
        form.find(".post-header em").addClass("red");
        buttonInvalid(form.find("input[type='submit']"));
      } else {
        form.find(".post-header em").removeClass("red");
        buttonValid(form.find("input[type='submit']"));
      }
    } else {
      buttonInvalid(form.find("input[type='submit']"));
    }
  });
  
  $(".new-post input[type='submit']").live("click", function (event) {
    $('.post-input').trigger('blur');
    event.stopPropagation();
  });

  $(".post-input").live("blur", function () {
    if (has_value($(this)) == false) {
      $(this).attr('rows', '1');
      var form = $(this).closest("form")
      form.find(".post-actions").hide();
      $(this).val("");
      form.find(".post-header em").hide();
    }
  });
  
  $(".post-content").live("click", function(event) {
    var comments = $(this).next();
    if (comments.is(":visible")) {
      comments.slideUp("fast");
      $(this).find(".action-expand").show().next().hide();
      $(this).parent().addClass("hoverable")
    } else {
      comments.slideDown("fast");
      $(this).find(".action-expand").hide().next().show();
      $(this).parent().removeClass("hoverable").removeClass("hover")
    }
  });
    
  $(".post-actions .action-comment").live("click", function(event) {
    var comments = $(this).closest(".post-content").next();
    var fake_input = $(this).closest(".post").find(".fake-input");
    if (comments.is(":visible")) {
      if (fake_input.is(":visible")) {
        fake_input.trigger('focus');      
      } else {
        $(this).closest(".post").find('.new-comment #post_text').focus();
      }
    } else {
      $(this).closest(".post-content").trigger('click');
      if (fake_input.is(":visible")) {
        setTimeout(function(){
          fake_input.trigger('focus');
        },200);
      }
    };
    event.preventDefault();
    event.stopPropagation();
  });
  
  $(".post-actions span a").live("click", function(event) {
    event.preventDefault();
  });
  
  $(".post-actions .action-repost").live("click", function(event) {
    event.stopPropagation();
  });

});