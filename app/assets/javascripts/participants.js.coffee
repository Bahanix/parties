$pid = $('#participant_id')
$formItems = $('.form-items')
$formParticipants = $('.form-participants')
$items = $('.items')
$item = $('.item')
$item.prop('disabled', true);
$participants = $('.participants')
$participant = $('.participant')
$participant.tooltip()
current = 0
$participants.on 'click', '.participant', ->
  $item.prop('disabled', false);
  $this = current = $(this)
  $pid.val($this.data('id'))
  $participants.find('.participant').removeClass('selected')
  $this.addClass('selected')
  $items.find('.item').prop('checked', false)
  for item in $this.data('items')
    $('#items_' + item).prop('checked', true)

$items.on 'click', '.item', ->
  $this = $(this)
  if current
    items = current.data('items')
    if $this.prop('checked')
      items.push $this.data('id')
    else
      items = items.filter (id) -> id isnt $this.data('id')
    current.data('items', items)
    $formItems.submit()
