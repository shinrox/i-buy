

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
      url         : "/products/:category"
      templateUrl : "#{path}/template.html"
      controller  : "ProductsController as ctrl"
      resolve:
        products: ['$stateParams', 'ProductsService', ($stateParams, ProductsService)->
          ProductsService.get($stateParams.category)
        ]

        categories: ['CategoriesService', (CategoriesService)->
          CategoriesService.all()
        ]


