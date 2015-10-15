angular.module "iBuy.vendors", [
  "ngTouch"
  "ngSanitize"
  "ngResource"
  "ui.router"
  "ui.bootstrap"
  "ui.select"
  "oitozero.ngSweetAlert"
  "ngAnalytics"
  "ngToast"
  "angular-loading-bar"
]

# =============================================
# Modules
# =============================================
angular.module "iBuy.controllers" , ["iBuy.vendors"]
angular.module "iBuy.filters"     , ["iBuy.vendors"]
angular.module "iBuy.factories"   , ["iBuy.vendors"]
angular.module "iBuy.constants"   , ["iBuy.vendors"]
angular.module "iBuy.services"    , ["iBuy.vendors"]
angular.module "iBuy.directives"  , ["iBuy.vendors"]
angular.module "iBuy.mocks"       , ["iBuy.vendors"]
angular.module "iBuy.configs"     , ["iBuy.vendors"]
angular.module "iBuy.providers"   , ["iBuy.vendors"]



# =============================================
# Scripts Module
# =============================================
angular.module "iBuy.scripts"     , [
  "iBuy.controllers"
  "iBuy.constants"
  "iBuy.filters"
  "iBuy.factories"
  "iBuy.services"
  "iBuy.directives"
  "iBuy.mocks"
  "iBuy.providers"
  "iBuy.configs"
]


# =============================================
# Main Module
# =============================================
angular.module "iBuy", [
  "iBuy.scripts"
  "iBuy.vendors"
]