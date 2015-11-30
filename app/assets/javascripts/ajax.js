$(document).ready(function() {
  $("#add_conversation").on("click",function(event){
    event.preventDefault();

    $.ajax({
      method:"get",
      url:$(event.target).attr("href")
    }).done(function(result){
      $("#new_conversation_form_div").hide();
      $("#top_new_conversation_form").append(result);
    }).fail(function(error){
      console.log(error);
    });
  });

  $("#top_new_conversation_form").on("submit","#new_conversation_form",function(event){
    event.preventDefault();

    $.ajax({
      method:"post",
      url:$(event.target).attr("action"),
      data:$(event.target).serialize()
    }).done(function(result){
      $("#new_conversation_form").remove();
      $("#new_conversation_form_div").show();
      $("#conversation_list").prepend(result);
    }).fail(function(error){
      console.log(error);
    });
  });

  $("#add_message").on("click",function(event){
    event.preventDefault();

    $.ajax({
      method:"get",
      url:$(event.target).attr("href")
    }).done(function(result){
      $("#new-message").hide();
      $("#new-messages-form").append(result);
    }).fail(function(error){
      console.log(error);
    });
  })

  $("new-messages-form").on("submit", "#new-message", function(event){
    event.preventDefault();

    $.ajax({
      method: "post",
      url:$(event.target).attr("action"),
      data:$(event.target).serialize()
    }).done(function(result){
      $("#new-messages-form").remove();
      $("#add_message").show();
      $("#messages-list").prepend(result);
    }).fail(function(error){
      console.log(error);
    });
  })

});
