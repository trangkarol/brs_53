$('#like-click').on('click', function(event){
  event.preventDefault();
  like_status = $(this).attr('data-like-status');
  book_id = $(this).attr('data-book-id');
  user_id = $(this).attr('data-user-id');
  favorite_id = $(this).attr('data-favorite-id');
  if (like_status == 'true') {
    type = 'post';
    url = '/favorites?book_id=' + book_id + '&user_id=' + user_id;
    text = 'Dislike';
    like_status = 'false';
  }else{
    type = 'delete';
    url = '/favorites/' + favorite_id;
    text = 'Like';
    like_status = 'true';
  }
  $.ajax({
    url : url,
    type : type,
    dataType: 'json',
    context: this,
    success : function (responses){
      if (like_status == 'false') {
        if (responses.like_success){
          $(this).text(text);
          $(this).attr({'data-like-status': 'like_status',
            'data-favorite-id': responses.favorite_id
          });
        } else {
          alert('<%= I18n.t("view.like.not_success") %>');
        }
      }else{
        if (responses.dislike_success){
          $(this).text(text);
          $(this).attr('data-like-status', like_status);
        }else {
          alert('I18n.t("view.like.not_success")');
        }
      }
    }
  });
});
