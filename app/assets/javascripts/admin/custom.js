$(document).ready(function(){
  $(".submenu > a").click(function(e) {
    e.preventDefault();
    var $li = $(this).parent("li");
    var $ul = $(this).next("ul");

    if($li.hasClass("open")) {
      $ul.slideUp(350);
      $li.removeClass("open");
    } else {
      $(".nav > li > ul").slideUp(350);
      $(".nav > li").removeClass("open");
      $ul.slideDown(350);
      $li.addClass("open");
    }
  });

  $('.bfh-datepicker').on('change.bfhdatepicker', function(){
    var $this = $(this),
        value = $this.val();
    $this.next('input[type=hidden], .fake-datepicker').val(value)
  }).change();
});
