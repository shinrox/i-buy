angular.module 'iBuy.services'
.service 'CartService', (UserService)->

  service =
    cart:
      currentProducts: {}
      productsCount: 0
      currentTotal: 0
    calcTotal: ->
      total = 0

      for own key, product of service.cart.currentProducts
        total += (product.price * product.count)

      service.cart.currentTotal = parseFloat(total).toFixed(2)

    updateCart: ->
      currentUser = UserService.currentUser().login

      service.calcTotal()
      if service.cart.productsCount < 0
        service.cart.productsCount = 0
      simpleStorage.set(currentUser + 'Cart', service.cart)

    add: (product, quantity = 1)->
      exist = service.cart.currentProducts[product._id]
      if exist?
        exist.count += quantity
      else
        product.count = quantity
        service.cart.currentProducts[product._id] = product

      service.cart.productsCount += quantity
      service.updateCart()

    remove: (product, quantity = 1)->
      exist = service.cart.currentProducts[product._id]

      if exist?
        exist.count -= quantity

        if exist.count <= 0
          delete service.cart.currentProducts[product._id]

      service.cart.productsCount += quantity
      service.updateCart()

    load: ->
      currentUser = UserService.currentUser().login
      userCart = simpleStorage.get(currentUser + 'Cart')
      service.cart = userCart || service.cart
      service.calcTotal()

  service.load()

  return service


