Ctrl.define
  'c-twisty':
    ready: ->
      @autorun =>
        @api.opacity()
        @api.isOpen()
        @api.updateState()

      Util.delay =>
          # NB: Allows twisty to load in "open" state without animating.
          @find().addClass 'is-loaded'


    api:
      opacity: (value) -> @prop 'opacity', value, default:@defaultValue('opacity', 50) / 100
      isOpen: (value) -> @prop 'isOpen', value, default:false

      updateState: ->
        if el = @find()
          el.css 'opacity', @api.opacity()
          el.toggleClass 'is-open', @api.isOpen()


