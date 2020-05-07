function filterView() {
  $('.list-group-item').on('click', function(e){
    e.preventDefault()
    $(this).siblings('.list-group-item').removeClass('active')
    $(this).toggleClass('active')
  })
}
