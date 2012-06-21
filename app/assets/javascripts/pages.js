
jQuery(document).ready(function($) {
  // Automatically display title and intro
  var title_ph = $('#page_title').attr("placeholder");
  var intro_ph = $('#page_intro').attr("placeholder");
  
  $('#page_title').keyup(function() {
    var value = $(this).val();
    if (value == "") {
      $('#page_title_display').text(title_ph);
    } else {
      $('#page_title_display').text(value);
    }
  }).keyup();
  
  $('#page_intro').keyup(function() {
    var value = $(this).val();
    if (value == "") {
      $('#page_intro_display').text(intro_ph);
    } else {
      $('#page_intro_display').text(value);
    }
  }).keyup();
  
  function appendOrDelete(name, section_name) {
    var trigger = "#" + name
    var target = trigger + "_holder"
    var p;
    if ($(trigger).is(':checked')) {
      p = $(target).detach()
      p.appendTo("#page_" + section_name);
      p.show()
    } else {
      $(target).hide()
    }
    return false;
  }
  
  function handleCheckboxChangeEvent(event) {
    appendOrDelete(event.data.name, event.data.section_name);
    event.preventDefault();
  }
  
  var sections = $('#page_components .row');
  for (var i=0; i < sections.length; i++) {
    var s_name = sections[i].id;
    var checkboxes = $(sections[i]).find('input[type="checkbox"]');
    for (var j=0; j < checkboxes.length; j++) {
      var cb_name = checkboxes[j].id;
      appendOrDelete(cb_name, s_name);
      $("#" + cb_name).change(
        {name: cb_name, section_name: s_name}, 
        handleCheckboxChangeEvent
      );
    };
  };
  
  $('#page_header').hover(
    function() {
      $('#page_header_edit').show();
    },
    function() {
      $('#page_header_edit').hide();
    }
  );
  
  $('#page_has_billboard_holder').hover(
    function() {
      $('#page_billboard_edit').show();
    },
    function() {
      $('#page_billboard_edit').hide();
    }
  );
  
  $('#page_has_image_holder').hover(
    function() {
      $('#page_image_edit').show();
    },
    function() {
      $('#page_image_edit').hide();
    }
  );
  
  $('#page_has_properties_holder').hover(
    function() {
      $('#page_properties_edit').show();
    },
    function() {
      $('#page_properties_edit').hide();
    }
  );
  
  $('#page_has_posters_holder').hover(
    function() {
      $('#page_posters_edit').show();
    },
    function() {
      $('#page_posters_edit').hide();
    }
  );
  
  $('#page_has_whiteboard_holder').hover(
    function() {
      $('#page_whiteboard_edit').show();
    },
    function() {
      $('#page_whiteboard_edit').hide();
    }
  );

});
