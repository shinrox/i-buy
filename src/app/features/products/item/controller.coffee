angular.module 'iBuy'
.controller 'ProductItemController', ($stateParams, product, ProductsService, CartService, UserService, CollectionsService)->
  ctrl = @
  Service = ProductsService

  angular.extend ctrl, {
    product: product
  }

  ctrl.currentUser = UserService.current

  ctrl.product = product

  ctrl.hasProduct = ()->
    ctrl.availableCount() > 0

  ctrl.availableCount = ()->
    CollectionsService.products.available(product)

  ctrl.addToCart = (product)->
    CartService.add(product)
    ctrl.product = ProductsService.getById($stateParams.id)

  return @