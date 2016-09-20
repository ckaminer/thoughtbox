$( document ).ready(function() {
  $("#search-bar").on("keyup", function (){
    var currentSearch = this.value.toLowerCase();
    $('.link').each(function (_index, link) {
      $link = $(link);
      if ( $link.children(".link-title, .link-url").text().toLowerCase().indexOf(currentSearch) !== -1 ) {
        $link.show();
      }
      else {
        $link.hide();
      }
    });
  });
});
