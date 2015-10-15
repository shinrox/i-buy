


# =============================================
# Module
# =============================================
angular.module 'iBuy'

  # =============================================
  # httpProvider Config
  # =============================================
  .config( ['$httpProvider', ($httpProvider) ->

    # Customize $httpProvider
    # =============================================
    contentType = 
      "Content-type": "application/x-www-form-urlencoded"
    $httpProvider.defaults.transformRequest = (data) -> if data then $.param(data, true) else data
    $httpProvider.defaults.headers.post = contentType
    $httpProvider.defaults.headers.put  = contentType
    $httpProvider.defaults.headers.delete  = contentType


  ])