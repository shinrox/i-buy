# =============================================
# Main Module
# =============================================
angular.module 'iBuy'

# =============================================
# Config Twain
# =============================================
.config ($stateProvider, $urlRouterProvider) ->
  path = "app/features/admin"
  $stateProvider
    .state "admin",
      url         : "/admin"
      abstract: true
      templateUrl : "#{path}/template.html"
      controller  : "AdminController as ctrl"
      
    .state "admin.categories",
      url         : "/categories"
      templateUrl : "#{path}/categories/template.html"
      controller  : "AdminController as ctrl"
    .state "admin.products",
      url         : "/products"
      templateUrl : "#{path}/products/template.html"
      controller  : "AdminController as ctrl"


  $urlRouterProvider.otherwise '/'