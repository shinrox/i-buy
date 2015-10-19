angular.module "iBuy.controllers"
.controller "NavBarCtrl", ($scope, $document, UserService, $uibModal, CartService, $state) ->
  ###
  ## Init
  ###
  ctrl = @

  UserService.currentUser()
  ctrl.UserService = UserService

  $document.on 'scroll', ()->
    ctrl.headerClass = if $document.scrollTop() > 30 then 'small' else 'big'
    $scope.$apply()

  ctrl.headerClass = if $document.scrollTop() > 30 then 'small' else 'big'

  ctrl.currentUser = UserService.current

  ctrl.actions =
    openLogin: ->
      modal = $uibModal.open {
        templateUrl: 'app/components/login/modal/template.html'
        controller: 'LoginController as ctrl'
      }

    goToCart: ()->
      return if $state.is('cart')
      
      if ctrl.currentUser.cart.status isnt 'CREATED'
        angular.extend ctrl.currentUser.cart, UserService.newCart()
      $state.go('cart', {id: ctrl.currentUser.cart._id})

    logout: ->
      if ctrl.currentUser.cart.productsCount > 0
        CartService.updateStatus(ctrl.currentUser.cart.status)

      UserService.logout()
      CartService.clearCart()

  return @

