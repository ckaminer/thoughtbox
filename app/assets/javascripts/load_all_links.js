$( document ).ready(function() {

  function prependLink(link){
    var id = link.id;
    var status = statusLookup(link);
      $("#table-body").prepend("<tr class='link " + status +  "' data-id='" + id + "' id='link-" + id + "'" + "data-status=" + status + ">" +
        "<td class='link-url'>" + link.url + "</td>"  +
        "<td class='link-title'>" + link.title + "</td>" +
        "<td><button class='btn btn-default' id='toggle-status-button'>" + buttonText(link) + "</button></td>" +
        "<td><a class='btn btn-default' id='edit-button' href='/links/" + id + "/edit'>Edit</a></td>" +
      "</tr>" );
  }

  $.ajax({
    url: "/api/v1/links",
    verb: "GET",
    dataType: "JSON",
    success: function(links){
      $("#table-body").html("");
      $(links).each(function(index, link){
        prependLink(link);
      });
    },
  });
});

function statusLookup(link) {
  var status = link.read ? "Read" : "Unread";
  return status;
}

function buttonText(link) {
  var text = link.read ? "Mark as Unread" : "Mark as Read";
  return text;
}
