$(document).ready(function(){
  $('#new-message').on("submit", "form", function(event){
    event.preventDefault();
    var element = $(event.target);
    $.ajax({
      method: "post",
      url: element.attr("action"),
      data: element.serialize()
    }).done(function(response){
      $('#message-list').append(response);
    }).fail(function(error){
      console.log(error);
    });
  });
});
