var descendingLinks = false;

function toggleDescending(){
  if (!descendingLinks){
    descendingLinks = true;
    return "descending";
  }
  else {
    descendingLinks = false;
    return "ascending";
  }
}

$( document ).ready(function() {
  function descendingSort(direction){
    var $links = $('.link');
    var sorted = _.sortBy($links, function(link) {
      return link.querySelector(".link-title").innerText.toLowerCase();
    });
    if (direction === "descending") {
      displayInOrder(sorted);
    } else {
      displayInOrder(sorted.reverse());
    }
  }

  function displayInOrder(sortedLinks){
    sortedTitles = sortedLinks.map(function(link, index){
      $("#table-body").append($(link));
      console.log("link appended");
    });
  }

  $("html").on('click', '#title-header', function(event){
    event.preventDefault();
    $("#table-body").val("");
    var order = toggleDescending();
    descendingSort(order);
  });
});
