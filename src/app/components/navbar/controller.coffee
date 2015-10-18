angular.module "iBuy.controllers"
.controller "NavBarCtrl", ($rootScope, $element, $scope, $state, $document, CartService) ->
  ###
  ## Init
  ###

  $document.on 'scroll', ()->
    ctrl.headerClass = if $document.scrollTop() > 30 then 'small' else 'big'
    $scope.$apply()

  ctrl = @

  ctrl.headerClass = if $document.scrollTop() > 30 then 'small' else 'big'

  ctrl.Cart = CartService

  return @

