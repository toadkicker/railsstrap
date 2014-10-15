jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()


#  # comment this out if you want to add the animation to an element. You may need to handle events for them to work correctly.
#  # This is just a generic example, your mileage will vary depending on what you're trying to do.
#  $("[data-animation]") ->
#    e.preventDefault()
#    if $(this).data("animation")?
#      $(this).next().removeClass($(this).data("easein")).addClass "animated " + $(this).data("easein")
#    else
#      $(this).next().addClass "animated " + _easeIn
#    return