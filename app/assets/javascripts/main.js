$(document).ready(function(){
  $('.new_message').on('submit', function(event) {
    event.preventDefault();
    $.ajax({
      method: $(event.target).attr('method'),
      url: $(event.target).attr('action'),
      data: $(event.target).serialize()

    }).done(function(response){
      $('#all-messages').prepend(response)
    }).fail(function(error){
      console.log(error)
    })
  });

  $('#start-convo-link').on('click', function(event){
    event.preventDefault();

    $.ajax({
      method: 'get',
      url: $(event.target).attr('href')
    }).done(function(response){
      $('#convo-form-link')
    }).fail(function(error){
      console.log(error);
    })
  })
});
