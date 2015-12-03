$(document).ready(function(){

 $("#new-conversation-form").on("submit", "form", function(event){
  event.preventDefault();

  var element = $(event.target)
  $.ajax({
    method: "post",
    url: element.attr("action"),
    data: element.serialize()
  }).done(function(response){
    debugger
    $("#conversation-list").prepend(response);

  }).fail(function(error){
    console.log(error)
  });

  });

 $("#new-message-form").on("submit", "form", function(event){
  event.preventDefault();

  var element = $(event.target)
  $.ajax({
    method: "post",
    url: element.attr("action"),
    data: element.serialize()
  }).done(function(response){
    
    $("#conversation").prepend(response);

  }).fail(function(error){
    console.log(error)
  });

  });


});