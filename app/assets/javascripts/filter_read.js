$(document).ready(function () {
  $('#link_filter_status').on('change', function () {
    $links = $(".link");
    var currentSelection = this.value;
    var validLinks = $("." + currentSelection);
    $links.each(function(index, link) {
      $link = $(link);
      if ($.inArray(link, validLinks) > -1 || currentSelection === "All") {
        $link.show();
      } else {
        $link.hide();
      }
    });
  });
});
