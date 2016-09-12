$(document).ready(function () {
  var $links = $('.link');

  $('#link_filter_status').on('change', function () {
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
