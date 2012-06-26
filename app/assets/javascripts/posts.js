jQuery(document).ready(function($) {
  var has_value = false;
  
  $(".post-input").focus(function () {
      $(this).attr('rows', '4');
      if (!has_value) {
        $(this).val($(this).attr('placeholder') + ' ');
      }
      $(".post-form .post-wordcount").text($(this).val().length);
      $(".post-form .post-actions").show();
      $(".post-form .post-header em").show();
  });
  
  function buttonInvalid() {
    $(".post-form input[type='submit']").attr("disabled", "disabled");
    $(".post-form input[type='submit']").removeClass("btn-success");
  }
  
  $(".post-input").keyup(function (){
    var value = $.trim($(this).val());
    $(".post-form .post-wordcount").text(value.length);
    
    if (value.length > 0 && value != $(this).attr('placeholder')) {
      has_value = true;
      if (value.length > 140) {
        $(".post-form .post-header em").addClass("red");
        buttonInvalid();
      } else {
        $(".post-form .post-header em").removeClass("red");
        $(".post-form input[type='submit']").removeAttr("disabled");
        $(".post-form input[type='submit']").addClass("btn-success");
      }
    } else {
      has_value = false;
      buttonInvalid();
    }
  });
  
  $(".post-form input[type='submit']").click(function (event) {
    has_value = false;
    $('.post-input').trigger('blur');
    event.stopPropagation();
  });

  $(".post-input").blur(function () {
    if (!has_value) {
      $(".post-input").attr('rows', '1');
      $(".post-form .post-actions").hide();
      setTimeout(function(){
        $(".post-input").val("");
        buttonInvalid();
      },100);
    }
  });
  
  $(".stream-post").live({
    mouseenter: function() {
      if ($(this).find(".post-comments-holder").is(":visible") == false) {
        $(this).addClass("stream-post-hover");
        $(this).find(".action-delete").removeClass("white").addClass("smoke");
        $(this).find(".post-actions ul").show();
      }
    },
    mouseleave: function() {
      if ($(this).find(".post-comments-holder").is(":visible") == false) {
        $(this).removeClass("stream-post-hover");
        $(this).find(".action-delete").removeClass("smoke").addClass("white");
        $(this).find(".post-actions ul").hide();
      }
    }
  });
  
  $(".post-holder").live("click", function(event) {
    var comments = $(this).next();
    if (comments.is(":visible")) {
      comments.slideUp("fast");
      $(this).find(".action-expand").show().next().hide();
    } else {
      comments.slideDown("fast");
      $(this).find(".action-expand").hide().next().show();
      $(this).parent().removeClass("stream-post-hover");
      $(this).find(".action-delete").removeClass("smoke").addClass("white");
    }
    event.preventDefault();
  });
    
  $(".post-actions .action-comment").live("click", function(event) {
    var comments = $(this).closest(".post-holder").next();
    var fake_input = $(this).closest(".stream-post").find("#fake-input");
    if (comments.is(":visible")) {
      fake_input.trigger('focus');
    } else {
      $(this).closest(".post-holder").trigger('click');
      setTimeout(function(){
        fake_input.trigger('focus');
      },200);
    };
    event.preventDefault();
    event.stopPropagation();
  });

});