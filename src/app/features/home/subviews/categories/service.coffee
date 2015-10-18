angular.module 'iBuy.services'
.service 'CategoriesService', ($http, APP_ENV)->

  basePath = "#{APP_ENV.API_BASE_URL}categories"

  return service =
    all: ()->
      $http({
        method: 'GET'
        url: basePath
        params:
          apiKey: APP_ENV.APIKEY
      })

    get: (id)->
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
