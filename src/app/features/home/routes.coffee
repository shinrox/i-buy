

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

    $urlRouterProvider.otherwise '/'