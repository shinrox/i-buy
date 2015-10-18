angular.module 'iBuy.controllers'
.controller 'AdminController', ($http, APP_ENV)->
  ctrl = @

  ctrl.collections = [
    'categories'
    'products'
  ]

  ctrl.collection = ctrl.collections[0]

  ctrl.model = {}

  ctrl.save = ()->
    config =
      url: APP_ENV.API_BASE_URL + ctrl.collection
      method: 'POST'
      params:
        apiKey: APP_ENV.APIKEY
      data: ctrl.model

    console.log config
    promise = $http(config)

    promise.then ->
      ctrl.model = {}

  return @
