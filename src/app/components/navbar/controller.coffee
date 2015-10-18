angular.module "iBuy.controllers"
.controller "NavBarCtrl", ($rootScope, $scope, $state, $document, CartService, UserService, $uibModal) ->
  ###
  ## Init
  ###
  ctrl = @

  ctrl.user = UserService

  $document.on 'scroll', ()->
    ctrl.headerClass = if $document.scrollTop() > 30 then 'small' else 'big'
    $scope.$apply()

  ctrl.headerClass = if $document.scrollTop() > 30 then 'small' else 'big'

  ctrl.Cart = CartService.cart

  ctrl.actions =
    openLogin: ->
      modal = $uibModal.open {
        templateUrl: 'app/components/login/modal/template.html'
        controller: 'LoginController as ctrl'
      }
    logout: ->
      UserService.logout()

  return @

