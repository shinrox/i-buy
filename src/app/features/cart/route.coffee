

# =============================================
# Main Module
# =============================================
angular.module 'iBuy'

# =============================================
# Config Twain
# =============================================
.config ($stateProvider, $urlRouterProvider) ->
  path = "app/features/cart"
  $stateProvider
    .state "cart",
      url         : "/cart/{id:int}"
      templateUrl : "#{path}/template.html"
      controller  : "CartController as ctrl"
      resolve:
        cart: ['$stateParams', 'CartService', ($stateParams, CartService)->
          CartService.setCurrent($stateParams.id)
        ]


