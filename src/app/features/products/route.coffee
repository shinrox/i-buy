

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
    .state "products",
      url         : "/products"
      resolve:
        products: ['ProductsService', (ProductsService)->
          ProductsService.all()
        ]
      views:
        '@':
          templateUrl : "#{path}/template.html"
          controller  : "ProductsController as ctrl"
        # 'categories@home':
        #   templateUrl : "#{path}/subviews/categories/template.html"
        #   controller  : "CategoriesController as ctrl"


