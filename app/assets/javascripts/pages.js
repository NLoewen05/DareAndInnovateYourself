// Pages Javascript

var ready = function(){
  $('.owl-carousel').owlCarousel({
    items: 1,
    margin: 20,
    URLhashListener: true
  });
  
  $(".disable-owl-swipe").on("touchstart mousedown", function(e) {
    // Prevent carousel swipe
    e.stopPropagation();
  })

  $('.message .close')
  .on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade')
    ;
  });

  $('.ui.dropdown').dropdown({
    action: 'select'
  });

  var mainSearch = $('#main_search');
  var queryVal = '';
  var categoryVal = ''

  mainSearch
    .search({
      apiSettings: {
        url: '/products/search?q={query}&cat={category}',
        beforeSend: function(settings){
          settings.urlData = {
            query: mainSearch.find('input[type="text"]').val(),
            category: $('#search_category').val()
          }

          return settings;
        },
        onResponse: function(response){
          var res = {
            results: []
          }

          $.each(response, function(index, item){
            res.results.push({
              title       : item.name,
              description : item.caption,
              url         : '/shop/' + item.shop_id + '/products/' + item.id
            });
          });

          return res;
        }
      },
      searchFields: ['title', 'description'],
      minCharacters: 3
    })
}

$(document).ready(ready);
$(document).on('turbolinks:load', ready);
