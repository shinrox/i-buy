

# =============================================
# Main Module
# =============================================
angular.module 'iBuy'

# =============================================
# Config Twain
# =============================================
.config ($stateProvider, $urlRouterProvider) ->
  path = "app/features/home"
  $stateProvider
    .state "home",
      url         : "/"
      resolve:
        categories: ['CategoriesService', (CategoriesService, CollectionsService)->
          CategoriesService.all()
        ]
      views:
        '@':
          templateUrl : "#{path}/index/template.html"
          controller  : "HomeController as ctrl"
        'categories@home':
          templateUrl : "#{path}/subviews/categories/template.html"
          controller  : "CategoriesController as ctrl"


  $urlRouterProvider.otherwise '/'