
function toggleReadStatus(id, direction) {
  $.ajax({
    method: "PATCH",
    url: "/api/v1/links/" + id,
    data: { id: id, read: direction},
    success: function(){
      console.log("something");
      if (direction === true) {
        $("#read-" + id).hide();
        $("#unread-" + id).show();
      } else {
        $("#unread-" + id).hide();
        $("#read-" + id).show();
      }
    }
  });
}
