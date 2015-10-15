
# =============================================
# Module
# =============================================
angular.module 'iBuy'


  # =============================================
  # Config
  # =============================================
  .config( ['$httpProvider', '$provide', ($httpProvider, $provide) ->

    # =============================================
    # UserLoginInterceptor
    # =============================================
    $provide.factory 'UserLoginInterceptor', [ '$q', '$injector', '$rootScope', 'APP_ENV', ($q, $injector, $rootScope, APP_ENV) ->

      'request': (config) ->
        return config

      'requestError': (rejection)->
        return $q.reject rejection

      'response': (response)->
        return response or $q.when response

      'responseError': (rejection)->
        if rejection.status is 401
          $injector.invoke ['$state', '$rootScope', ($state, $rootScope) ->
            $rootScope.user = null
            $state.go 'login.auth', statusOrigin :
              status: rejection.status
          ]

        return  $q.reject rejection

    ]

    # =============================================
    # Register Interceptor
    # =============================================
    $httpProvider.interceptors.push 'UserLoginInterceptor'

  ])

  .run ['$rootScope', ($rootScope) ->
    $rootScope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->
      $rootScope.state     = toState
      $rootScope.lastState = fromState
  ]

