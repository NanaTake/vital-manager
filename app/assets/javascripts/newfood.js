$(document).on('turbolinks:load', function(){

  $('#new_food').on('submit', function(e){
    e.preventDefault();
    var formdata = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({  
      url: url,
      type: 'POST',
      data: formdata,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(){
      alert('保存が完了しました');
      $('#new_food')[0].reset();
    })
    .fail(function(){
      alert('エラーが発生したため保存できませんでした');
    })
    .always(function(){
      $('.form_newfood__form-for__item__submit').prop('disabled', false);
    })
  })
  
});