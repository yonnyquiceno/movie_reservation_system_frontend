$(document).on('turbolinks:load', function () {
  $("input[type='text'].daterange:not(.single_date)").daterangepicker({
    locale: {
      format: 'YYYY/MM/DD'
    },
    cancelLabel: 'Clear',
    showDropdowns: true,
    autoUpdateInput: true,
  }).on('apply.daterangepicker', function(event, picker) {
    if (event.target.dataset.autosubmit) {
      event.target.closest('form').submit()
    }
  });

  $("input[type='text'].daterange.single_date").daterangepicker({
    locale: {
      format: 'YYYY/MM/DD'
    },
    cancelLabel: 'Clear',
    showDropdowns: true,
    singleDatePicker: true
  }).on('apply.daterangepicker', function(event, picker) {
    if (event.target.dataset.autosubmit) {
      event.target.closest('form').submit()
    }
  });

  $('input[class="daterange"]').on('cancel.daterangepicker', function(event){
    $(this).val(' ');
    if (event.target.dataset.autosubmit) {
      event.target.closest('form').submit()
    }
  });
});