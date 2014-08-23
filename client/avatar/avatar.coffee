image = (file) -> "/packages/ctrls/images/avatar/#{ file }"

LOADED      = 'loaded'
LOAD_FAILED = 'load-failed'
HIDDEN      = 'hidden'


Ctrl.define
  'c-avatar':
    init: ->
      # @size = @options.size ? 36
      @hideOnError = @options.hideOnError ? false
      @hideUntilLoaded = @options.hideUntilLoaded ? false

    ready: ->
      el = @find()

      # Wire up events.
      el.on 'load', (e) =>
          failed   = @api.failed()
          isLoaded = failed isnt true
          @api.isLoaded(isLoaded)
          el.toggleClass LOADED, isLoaded

          if failed
            # Hide the avatar if failed to load, and the "hide on error" flag is set.
            el.addClass HIDDEN, true if @hideOnError
          else
            el.removeClass HIDDEN



      el.on 'error', (e) =>
          @api.failed(true)
          el.toggleClass LOAD_FAILED, true
          el.toggleClass LOADED, false
          el.attr 'src', @api.anonUrl()

    api:
      isLoaded: (value) -> @prop 'is-loaded', value, default:null
      failed: (value) -> @prop 'failed', value, default:null
      anonUrl: (value) -> @prop 'anon-url', value, default:@defaultValue('anonUrl', image('anon.svg'))
      size: (value) -> @prop 'size', value, default:@defaultValue('size', 36)



    helpers:
      url: -> @options.url ? 'broken'

      cssClass: ->
        cssClass = @defaultValue('class')
        css = "size#{ @api.size() }"
        css += " #{ cssClass }" if cssClass
        css += ' hidden' if @hideUntilLoaded
        css



