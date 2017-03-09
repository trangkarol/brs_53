$(document).ready(function(){
  $(".edit_review").hide();
  $(".click-edit").click(function(e){
    e.preventDefault();
    var cmt_id = $(this).attr("id");
    $("#edit_review_" + cmt_id).toggle(100);
  });
});
