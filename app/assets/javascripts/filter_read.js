$(document).ready(function () {

  $('#link_filter_status').on('change', function () {
    var $links = $('.link');
    var currentSelection = this.value;
    $links.each(function(index, link) {
      $link = $(link);
      if ($link.data('status') === currentSelection) {
        $link.show();
      } else if (currentSelection === "All"){
        $link.show();
      } else {
        $link.hide();
      }
    });
  });

});
