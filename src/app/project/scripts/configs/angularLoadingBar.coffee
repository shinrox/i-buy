'use strict'

###
## [MODULE] LoadingBar
___

**App Config**
###
angular.module 'iBuy.configs'
  .config [ 'cfpLoadingBarProvider', (cfpLoadingBarProvider) ->
    cfpLoadingBarProvider.includeSpinner = false
    cfpLoadingBarProvider.latencyThreshold = 250
  ]
