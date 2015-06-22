$(function() {
  $.validator.addMethod(
    "customDate",
    function(value, element) {
        return value.match(/^\d\d?\/\d\d?\/\d\d\d\d$/);
    },
    "Please enter a date in the format dd/mm/yyyy."
  );
  $("form").validate({
    rules: {
      "plan[name]": {required: true},
      "plan[price]": {required: true},
      "plan[start_time]": {
        required: true,
        customDate: true
      }
    }
  });
});

$(function() {
  var datepickerId = "#plan_start_time";
  $(datepickerId).datepicker({ 
    dateFormat: 'dd/mm/yy',
    onClose: function() {
      $("form").validate().element(datepickerId);
  } 
  });
  $(datepickerId).datepicker("setDate", $(datepickerId).val());
  $(datepickerId).datepicker("option", "showAnim", "drop");
});