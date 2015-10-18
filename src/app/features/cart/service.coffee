angular.module 'iBuy.services'
.service 'CartService', (UserService, ShoppingsService)->

  service =
    calcTotal: ->
      user = UserService.current
      total = 0

      for own key, product of user.cart.currentProducts
        total += (product.price * product.count)

      user.cart.currentTotal = parseFloat(total).toFixed(2)

    clearCart: (user)->
      user = UserService.current
      angular.extend user.cart, {
        currentProducts: {}
        productsCount: 0
        currentTotal: 0
      }

    updateCart: ()->
      service.calcTotal()
      UserService.save()

    add: (product, quantity = 1)->
      user = UserService.current
      exist = user.cart.currentProducts[product._id]
      if exist?
        exist.count += quantity
      else
        product.count = quantity
        user.cart.currentProducts[product._id] = product

      user.cart.productsCount += quantity
      service.updateCart()

    remove: (product, quantity = 1)->
      user = UserService.current
      exist = user.cart.currentProducts[product._id]

      if exist?
        exist.count -= quantity

        if exist.count <= 0
          delete user.cart.currentProducts[product._id]

      user.cart.productsCount += quantity
      service.updateCart()

    load: ->
      UserService.currentUser()
      service.updateCart()

    finish: (id)->
      user = UserService.current
      user.shoppings[id] = angular.copy user.cart
      service.clearCart()
      UserService.save()



  service.load()

  return service


