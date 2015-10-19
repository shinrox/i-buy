angular.module 'iBuy.controllers'
.controller 'CartController', ($state, ShoppingsService, CartService, UserService, $uibModal, sAlert)->
  ctrl = @


  ctrl.currentUser = UserService.currentUser()


  ctrl.actions = 
    finish: ->
      if crtl.currentUser.login isnt 'anonymous'
        CartService.finish()
      else
        ctrl.actions.openLogin()

    openLogin: ->  
      modal = $uibModal.open {
        templateUrl: 'app/components/login/modal/template.html'
        controller: 'LoginController as ctrl'
      }

    productZoom: (product)->  
      modal = $uibModal.open {
        templateUrl: 'app/components/product/modal/template.html'
        controller: 'ProductModalController as ctrl'
        resolve:
          product: ->
            return product
      }

    add: (product)->
      CartService.add(product)

    remove: (product, quantity)->
      CartService.remove(product, quantity)

    finish: ()->
      CartService.finish(true)
      $state.go('shoppings')

    removeShopping: ->
      sAlert.confirm({
        text: 'Certeza que deseja apagar esta compra?'
        closeOnConfirm: true
      }, (confirm)->
        if confirm
          ShoppingsService.remove(ctrl.currentUser.cart)
          $state.go('home')
          CartService.clearCart()
      )



  return @