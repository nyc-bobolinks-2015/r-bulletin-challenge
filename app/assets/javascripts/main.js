$(document).ready(function(){
  $(".like-button").on("click", function(event){
    event.preventDefault();
    var element = $(event.target);

    $.ajax({
      method: "get",
      url: element.attr("href")
    }).done(function(response){
      element.parent().parent().parent().html(response);
    }).fail(function(error){
      console.log(error);
    });

  });

  $("#conversation-form").on("submit", function(event){
    event.preventDefault();
    var element = $(event.target);

    $.ajax({
      method: "post"
      url: element.attr("action"),
      data: element.serialize()
    }).done(function(response){
      console.log(response);
    }).fail(function(error){
      console.log(error);
    });

  });
});
