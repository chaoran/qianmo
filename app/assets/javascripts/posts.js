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
        if ($(this).attr('placeholder').match(/^[@#].+/)) {
          $(this).val($(this).attr('placeholder') + ' ');
        }
      }
      form.find(".post-wordcount").text($(this).val().length);
      form.find(".post-actions").show();
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
    }
  });
    
  $(".post-actions .action-comment").live("click", function(event) {
    var expandable = $(this).closest(".expandable")
    if (expandable.hasClass("expanded") == false) {
      expandable.find(".expand-on-click").trigger('click')
      expandable.find(".action-expand").trigger('click')
    }
    var comments = $(this).closest(".post-content").next();
    var fake_input = expandable.find(".fake-input");
    if (fake_input.is(":visible")) {
      fake_input.trigger('focus');      
    } else {
      expandable.find('.new-comment #post_text').focus();
    }
    event.preventDefault();
    event.stopPropagation();
  });
  
  $(".post-actions span a").live("click", function(event) {
    event.preventDefault();
  });
  
  $(".post-actions .action-repost").live("click", function(event) {
    event.stopPropagation();
  });
  
  /* new implementation */
  $(".new-post .input").live("focus", function () {
    $(this).closest('.new-post').addClass('focus')
  });
  
  $(".new-post .input").live("blur", function () {
    $(this).closest('.new-post').removeClass('focus')
  });
  
  $(".new-post .input").live("keyup", function () {
    var new_post = $(this).closest('.new-post');
    var length = $(this).val().length;
    new_post.find(".word-count .count").text(length) // update word-count value
    if (length > parseInt(new_post.find(".word-count .max-count").text())) {
      new_post.find(".word-count").addClass("red");  // make color red
      new_post.removeClass("ready")
    } else {
      new_post.find(".word-count").removeClass("red");
      if (length == 0) {
        new_post.removeClass("ready")
      } else {
        new_post.addClass("ready")
      }
    }
  });

});