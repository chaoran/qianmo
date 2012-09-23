jQuery(document).ready(function($) {
  var comment_input = $(".new-comment .comment-holder .inputs #post_text");
  
  $(".comment .post-actions .action-comment").live("click", function(event) {
    var new_comment = $(this).closest(".post-comments").find(".new-comment");
    var form = new_comment.find("form");
    var name = $(this).closest(".comment").find("a.header").text();
    form.find("#post_text").val("@" + $.trim(name) + " ");
    
    event.preventDefault();
  });
  
  $(".new-comment .fake-input").live("focus", function () {
    $(this).closest('.new-comment').addClass("ready");
    $(this).next().find("#post_text").focus();
  });
  
  comment_input.live("keyup", function() {
    var value = $.trim($(this).val());   
    var button = $(this).parent().next().find("input[type='submit']") 
    if (value.length > 0 && value != $(this).attr('placeholder')) {
      button.addClass("btn-primary").removeAttr("disabled");
    } else {
      button.removeClass("btn-primary").attr("disabled", "disabled");
    }
  });
  
  comment_input.live("focus", function () {
    var value = $.trim($(this).val());    
    if (value.length == 0 || value == $(this).attr('placeholder')) {
      if ($(this).attr("placeholder")) {
        $(this).val($(this).attr("placeholder") + " ");
      }
    }
  });
  
  comment_input.live("blur", function () {
    var value = $.trim($(this).val());    
    if (value.length == 0 || value == $(this).attr('placeholder')) {
      $(this).closest(".new-comment").removeClass("ready");
    }
  });
});


