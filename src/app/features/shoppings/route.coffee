

# =============================================
# Main Module
# =============================================
angular.module 'iBuy'

# =============================================
# Config Twain
# =============================================
.config ($stateProvider, $urlRouterProvider) ->
  path = "app/features/shoppings"
  $stateProvider
    .state "shoppings",
      url         : "/shoppings"
      templateUrl : "#{path}/template.html"
      controller  : "ShoppingsController as ctrl"
      resolve:
        user: ['$q', '$state', 'UserService', ($q, $state, UserService)->
          defer = $q.defer()
          if UserService.currentUser().login is 'anonymous'
            $state.go('home')
            defer.reject()
          else
            defer.resolve()

          defer.promise
        ]