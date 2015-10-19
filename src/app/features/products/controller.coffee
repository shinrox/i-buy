angular.module 'iBuy'
.controller 'ProductsController', (products, alphanumSort, ProductsService, CartService, UserService)->
  ctrl = @
  Service = ProductsService

  angular.extend ctrl, {
    products: products.data.sort (a, b)->
      return alphanumSort(a.name, b.name)
  }

  # for product in ctrl.products
  #   Service.remove product._id
  
  ctrl.currentUser = UserService.current

  if ctrl.currentUser.cart.status isnt 'CREATED'
    angular.extend ctrl.currentUser.cart, UserService.newCart() 

  ctrl.addToCart = (product)->
    CartService.add(product)

  return @