$(document).ready(function() {
   $('.field_with_errors').each(function() {
      if($(this).find('input').length || $(this).find('textarea').length) {
          $(this).append('<small class="error">Invalid entry</small>');
      }
   });
});