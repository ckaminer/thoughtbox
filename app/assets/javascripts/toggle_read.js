$( document ).ready(function() {
  $("html").on('click', "#toggle-status-button", function(){
    var tableRow = this.closest('tr');
    var id = $(tableRow).data('id');
    $.ajax({
      method: "PATCH",
      url: "/api/v1/links/" + id,
      data: { id: id, read: "toggle" },
      dataType: "JSON",
      success: function(link){
        var row = $("#link-" + link.id);
        var button = $("#link-" + link.id + " #toggle-status-button");
        row.toggleClass("Read");
        button.text(buttonText(link));
      },
      error: function(){
        alert("Links unable to load, please refresh to try again");
      }
    });
  });
  function buttonText(link) {
    if (link.read === true) {
      return "Mark as Unread";
    } else {
      return "Mark as Read";
    }
  }
});
