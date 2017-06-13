/*获取客户姓别*/
$(document).ready(function(){
  var txt = $('.c_name').html();
  txt = txt.charAt(0);
  $('.pic').html(txt)
});
