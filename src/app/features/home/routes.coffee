

# =============================================
# Main Module
# =============================================
angular.module 'iBuy'

# =============================================
# Config Twain
# =============================================
.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state "home",
      url         : "/"
      templateUrl : "app/features/home/template.html"
      controller  : "HomeController as ctrl"
      resolve:
        products: ['ProductsService', (ProductsService)->
          ProductsService.all()
        ]
      views:
        '@':
          templateUrl : "app/features/home/template.html"
          controller  : "HomeController as ctrl"
        'products@home':
          templateUrl : "app/features/products/template.html"
          controller  : "ProductsController as ctrl"


  $urlRouterProvider.otherwise '/'