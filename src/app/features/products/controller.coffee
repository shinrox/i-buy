angular.module 'iBuy'
.controller 'ProductsController', ($stateParams, products, ProductsService, CartService, UserService, categories)->
  ctrl = @
  Service = ProductsService

  angular.extend ctrl, {
    categories: categories
    products: products
  }

  # for product in ctrl.products
  #   Service.remove product._id
  
  ctrl.currentUser = UserService.current

  if ctrl.currentUser.cart.status isnt 'CREATED'
    angular.extend ctrl.currentUser.cart, UserService.newCart() 

  ctrl.addToCart = (product)->
    CartService.add(product)
    ctrl.products = ProductsService.get($stateParams.category)

  return @