jQuery(document).ready(function($) {
  var comment_input = $(".new-comment .comment-body input[type='text']");
  var comment_submit = $(".new-comment .comment-actions input[type='submit']");
  var comment_form = $(".new-comment form");
  
  $(".comment .comment-actions .action-reply").live("click", function(event) {
    var form = $(this).closest(".comments").find(".new-comment form")
    form.show()
    form.prev().hide();
    var name = $(this).closest(".comment").find(".comment-header a").text();
    form.find("input[type='text']").val("@" + $.trim(name) + " ");
    event.preventDefault();
  });
  
  $(".new-comment #fake-input").live("focus", function () {
    $(this).hide();
    var form = $(this).next();
    form.show();
    form.find("input[type='text']").focus();
  });
  
  comment_input.live("keyup", function() {
    var value = $.trim($(this).val());    
    if (value.length > 0 && value != $(this).attr('placeholder')) {
      comment_submit.addClass("btn-primary").removeAttr("disabled");
    } else {
      comment_submit.removeClass("btn-primary").attr("disabled", "disabled");
    }
  });
  
  comment_input.live("focus", function () {
    var value = $.trim($(this).val());    
    if (value.length == 0 || value == $(this).attr('placeholder')) {
      $(this).val($(this).attr("placeholder") + " ");
    }
  });
  
  comment_input.live("blur", function () {
    var value = $.trim($(this).val());    
    if (value.length == 0 || value == $(this).attr('placeholder')) {
      $(this).closest("form").hide().prev().show();
    }
  });
});


