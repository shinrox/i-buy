$(document).ready ->

  window.ENV or= {}
  setupData              = {}
  waitForSetup           = false
  ENV    = window.ENV
  window.ENV.user = null
  # Bootstrap da aplicação
  bootstrap = ->
    angular.bootstrap(document, ["iBuy"])
    return

  bootstrap()
