$( document ).ready(function() {

  function prependIdea(idea){
    var id = idea.id;
    var status = statusLookup(idea);
      $("#table-body").prepend("<tr class='link " + status +  "' data-id='" + id + "' id='link-" + id + "'" + "data-status=" + status + ">" +
        "<td class='link-url'>" + idea.url + "</td>"  +
        "<td class='link-title'>" + idea.title + "</td>" +
        "<td><button class='btn btn-default' id='toggle-status-button'>" + buttonText(idea) + "</button></td>" +
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
        prependIdea(link);
      });
    },
  });
});

function statusLookup(idea) {
  if (idea.read === true) {
    return "Read";
  } else {
    return "Unread";
  }
}

function buttonText(link) {
  if (link.read === true) {
    return "Mark as Unread";
  } else {
    return "Mark as Read";
  }
}
