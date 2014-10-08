Ctrl.define
  'c-twisty':
    ready: ->
      @autorun =>
          @api.isOpen()
          @api.updateState()

      Util.delay =>
          # NB: Allows twisty to load in "open" state without animating.
          @find().addClass 'is-loaded'


    api:
      ###
      Gets or sets whether the twitsy is open (true:facing-down)
      or closed (false:facing-right).
      ###
      isOpen: (value) -> @prop 'isOpen', value, default:false


      ###
      Updates the visual state of the control.
      ###
      updateState: ->
        if el = @find()
          el.toggleClass 'is-open', @api.isOpen()


