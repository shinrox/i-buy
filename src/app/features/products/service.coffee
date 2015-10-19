angular.module 'iBuy.services'
.service 'ProductsService', ($http, APP_ENV, $filter)->
  filter = $filter('filter')

  basePath = "#{APP_ENV.API_BASE_URL}products"

  return service =
    all: ()->
      # simpleStorage.get('products')
      
      $http({
        method: 'GET'
        url: basePath
        params:
          apiKey: APP_ENV.APIKEY
      })

    get: (id)->
      # all = simpleStorage.get('products')
      # return filter({_id: id})[0]
      
      $http({
        method: 'GET'
        url: "#{basePath}/#{id}"
        params:
          apiKey: APP_ENV.APIKEY
      })

    add: (model)->
      $http({
        method: 'POST'
        url: "#{basePath}"
        params:
          apiKey: APP_ENV.APIKEY
        data: model
      })

    remove: (id)->
      $http({
        method: 'DELETE'
        url: "#{basePath}/#{id}"
        params:
          apiKey: APP_ENV.APIKEY
      })
