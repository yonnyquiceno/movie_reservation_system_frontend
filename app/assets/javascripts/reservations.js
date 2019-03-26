$(document).on('turbolinks:load', function() {
  $('[data-behavior~=new_reservation_btn]').on('click', function (event) {
    $('[data-behavior~=movie_id_hidden_input]').val(event.target.dataset.movieId)
  });
})