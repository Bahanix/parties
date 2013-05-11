$ ->
  $("input.datepicker").each (i) ->
    $(this).datepicker
      altField: $(this).next()