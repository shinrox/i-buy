# =============================================
# Modules
# =============================================
# angular.module 'ngAnalytics.controllers' , []
# angular.module 'ngAnalytics.filters'     , []
# angular.module 'ngAnalytics.factories'   , []
angular.module 'ngAnalytics.services'    , []
# angular.module 'ngAnalytics.constants'   , []
# angular.module 'ngAnalytics.directives'  , []
# angular.module 'ngAnalytics.mocks'       , []
angular.module 'ngAnalytics.providers'   , []



# =============================================
# Scripts Module
# =============================================
angular.module 'ngAnalytics.scripts'     , [
  # 'ngAnalytics.controllers'
  # 'ngAnalytics.filters'
  # 'ngAnalytics.factories'
  'ngAnalytics.services'
  # 'ngAnalytics.constants'
  # 'ngAnalytics.directives'
  # 'ngAnalytics.mocks'
  'ngAnalytics.providers'
]


# =============================================
# Main Module
# =============================================
angular.module 'ngAnalytics', [
  'ngAnalytics.scripts'
]