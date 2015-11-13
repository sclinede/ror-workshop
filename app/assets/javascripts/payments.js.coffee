$(document).on "page:change", ->
  $('#payments').DataTable
    pagingType: 'full_numbers'
    responsive: true
    order: []
    search:
      smart: false
