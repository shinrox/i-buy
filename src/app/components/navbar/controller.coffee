angular.module "iBuy.controllers"
.controller "NavBarCtrl", ($rootScope, $element, $scope, $state, $document) ->
  ###
  ## Init
  ###

  $document.on 'scroll', ()->
    ctrl.headerClass = if $document.scrollTop() < 50 then 'big' else 'small'


  ctrl = @

  ctrl.headerClass = 'big'

  return @

