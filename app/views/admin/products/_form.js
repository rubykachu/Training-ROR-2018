$(document).ready(function(){
  $('.bfh-datepicker').on('change.bfhdatepicker', function(){
    var $this = $(this),
        value = $this.val();
    $this.next('input[type=hidden], .fake-datepicker').val(value)
  }).change();
});
