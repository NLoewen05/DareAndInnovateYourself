// Pages Javascript

var ready = function(){
  $('.ui.dropdown').dropdown({
    action: 'select'
  });

}

$(document).ready(ready);
$(document).on('turbolinks:load', ready);
