FADE_DURATION = 0.3


###
Creates and starts a new spinner.
@param el: The element to position the spinner around.
@returns the new spinner (call 'stop' to stop spinning).

See: http://fgnass.github.com/spin.js/
###
Util.spinner = (el, options = {}) ->
  return unless el?.length > 0
  defaults =
    lines:      12          # The number of lines to draw
    length:     4           # The length of each line
    width:      2           # The line thickness
    radius:     5           # The radius of the inner circle
    color:      '#000'      # #rgb or #rrggbb
    speed:      1           # Rounds per second
    trail:      60          # Afterglow percentage
    shadow:     false       # Whether to render a shadow
    hwaccel:    false       # Whether to use hardware acceleration
    className:  'spinner'   # The CSS class to assign to the spinner
    zIndex:     2e9         # The z-index (defaults to 2000000000)
    top:        'auto'      # Top position relative to parent in px
    left:       'auto'      # Left position relative to parent in px

  options = Object.merge defaults, options
  new Spinner(defaults).spin el[0]




# ----------------------------------------------------------------------

Ctrl.define
  'c-spinner':
    ready: ->
      @autorun =>
        el = @find()
        elInner = @find('.c-inner')
        if isSpinning = @api.isSpinning()
          args =
            lines:  @api.lines()
            length: @api.length()
            width:  @api.width()
            radius: @api.radius()
            speed:  @api.speed()
            color:  @api.color()

          elInner.empty()
          @spinner = Util.spinner(elInner, args)

          el.toggle(true)
          Deps.afterFlush => el.addClass('c-showing') # Fade-in.

        else
          stop = =>
                @spinner?.stop()
                elInner.empty()
                el.toggle(false)
          el.removeClass('c-showing') # Fade-out.
          if @isCreated
            Util.delay (FADE_DURATION * 1000), => stop()
          else
            stop()



    destroyed: -> @spinner?.stop()


    api:
      isSpinning: (value) -> @prop 'spinning', value, default:@defaultValue('isSpinning', true)
      start: -> @api.isSpinning(true)
      stop: ->  @api.isSpinning(false)
      toggle: -> @api.isSpinning( not @api.isSpinning() )
      color: (value) ->
        if value isnt undefined
          value = '#000' if value is 'black'
          value = '#fff' if value is 'white'
        @prop 'color', value, default:@defaultValue('color', '#000')

      lines:  (value) -> @prop 'lines', value, default:@defaultValue('lines', 12)
      length: (value) -> @prop 'length', value, default:@defaultValue('length', 4)
      width:  (value) -> @prop 'width', value, default:@defaultValue('width', 2)
      radius: (value) -> @prop 'radius', value, default:@defaultValue('radius', 5)
      speed:  (value) -> @prop 'speed', value, default:@defaultValue('speed', 1)

    helpers:
      cssClass: -> @defaultValue('cssClass')


