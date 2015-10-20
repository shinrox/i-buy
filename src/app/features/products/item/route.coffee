

# =============================================
# Main Module
# =============================================
angular.module 'iBuy'

# =============================================
# Config Twain
# =============================================
.config ($stateProvider, $urlRouterProvider) ->
  path = "app/features/products"
  $stateProvider
    .state "product",
      url         : "/product/{id:int}"
      templateUrl : "#{path}/item/template.html"
      controller  : "ProductItemController as ctrl"
      resolve:
        product: ['$stateParams', 'ProductsService', ($stateParams, ProductsService)->
          ProductsService.getById($stateParams.id)
        ]


