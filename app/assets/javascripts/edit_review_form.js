$(document).ready(function(){
  $('.edit_review').hide();
  $(".click-edit").click(function(e){
    e.preventDefault();
    var cmt_id = $(this).attr("id");
    $("#edit_review_" + cmt_id).toggle(100);
  });
});
$(document).ready(function(){
  $('.new_comment').hide();
  $('.click-reply').click(function(f){
    f.preventDefault();
    var review_id = $(this).attr('id');
    $('#new_comment_' + review_id).toggle(100);
  });
});
$(document).ready(function(){
  $('.reply-box').hide();
  $('.click-show').click(function(f){
    f.preventDefault();
    var review_id = $(this).attr('id');
    $('#reply-box-' + review_id).toggle(100);
  });
});
$(document).ready(function(){
  $('.edit_comment').hide();
  $('.click-edit-comment').click(function(e){
    e.preventDefault();
    var cmt_id = $(this).attr('id');
    $('#edit_comment_' + cmt_id).toggle(100);
  });
});
$(document).ready(function(){
  $('#new_mark').hide();
  $('#mark-click').click(function(e){
    e.preventDefault();
    $('#new_mark').toggle(100);
  });
});
$(document).ready(function(){
  $('.edit_mark').hide();
  $('.change_mark').click(function(e){
    e.preventDefault();
    var mark_id = $(this).attr('id');
    $('#edit_mark_' + mark_id).toggle(100);
  });
});
